# unity.release-1

## About this repository

This repository contains the source for the presentation 'Testing in production for Unity using istio and shadow releases'.
The contents is meant to support the actual presentation and is not meant as a how-to/instruction.

## How to use

### Required software

- A debian installation (i.e. in WSL) other linuxes will probably work too.
- The 'make' utility.
- Both the 'docker' and the 'kubectl' commandline tools. Both require correct configuration to access the docker engine and the kubernetes deployment. When running in WSL a docker-desktop installation with activate kubernetes fulfills all requirements.
- (Optional) to build the Microservices locally, GO at version 1.16 is required.

### IMPORTANT

Before executing one of the  below steps, make sure you did:

- Chdir into the 'src' subdirectory and run 'source setup.sh'
 
This will setup some important environment variables and aliases for easier use. Do this once in every terminal session.

### Setup

Warning: Some of these steps will alter your kubernetes configuration, especially pre-existing istio and kiali deployments.

- Chdir into the directory 'src/docker' and execute 'make'. This will build all necessary docker images.
- Chdir into the directory 'src/kubernetes/local-cluster' and execute 'make clusterclean'. Carefull: This will wipe pre-existing istio and kiali deployments!
- Chdir into the directory 'src/kubernetes/local-cluster' and execute 'make clustersetup'.

Additionally, your '/etc/hosts' file ('%windir%\system32\drivers\etc\hosts' for WSL) needs to contain these lines:

    127.0.0.1 api.localgft.com
    127.0.0.1 pilot.localgft.com
    127.0.0.1 prod.localgft.com

### Deploy the application

Chdir into one of the 'step-1', 'step-2' or 'step-3' directory and execute 'kctl apply -f .'. 

### Start the necessary proxies

To access the individual components, we need to start the kubernetes proxies. Execute the following commandlines, each in a separate terminal window:

- while sleep 1 ; do kubectl port-forward -n istio-system service/kiali 20001:20001  ; done
- while sleep 1 ; do kubectl port-forward svc/istio-ingressgateway 8080:80 -n istio-system ; done
- (optional for prometheus) while sleep 1 ; do kubectl port-forward -n istio-system service/prometheus 9090:9090 ; done

### Access the application and kiali

You can now access the components of the presentation:

- Kiali: http://localhost:20001/kiali/console/graph/namespaces/?traffic=grpc%2CgrpcRequest%2Chttp%2ChttpRequest%2Ctcp%2CtcpSent&graphType=versionedApp&namespaces=com-gft-deuba-unity-release-1&duration=60&refresh=10000&animation=true&idleEdges=true&idleNodes=true&layout=dagr
- The 'production' frontend: http://prod.localgft.com:8080
- The 'pilot' frontend: http://pilot.localgft.com:8080
- The API: http://api.localgft.com:8080

### Shutdown the application

Chdir into one of the 'step-1', 'step-2' or 'step-3' directories in 'src/kubernetes/local-cluster' and execute 'kctl delete -f .'. 

### Cleanup

Chdir into the directory 'src/kubernetes/local-cluster'

