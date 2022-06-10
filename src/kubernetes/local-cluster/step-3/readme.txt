while sleep 1 ; do kubectl port-forward -n istio-system service/kiali 20001:20001  ; done
http://localhost:20001/kiali/console/graph/namespaces/?traffic=grpc%2CgrpcRequest%2Chttp%2ChttpRequest%2Ctcp%2CtcpSent&graphType=versionedApp&namespaces=com-gft-deuba-unity-release-1&duration=60&refresh=10000&animation=true&idleEdges=true&idleNodes=true&layout=dagre

while sleep 1 ; do kubectl port-forward svc/istio-ingressgateway 8080:80 -n istio-system ; done
http://prod.localgft.com:8080/
http://pilot.localgft.com:8080/

curl -v http://api.localgft.com:8080/thermometer/measure
curl -v http://api.localgft.com:8080/random/random
