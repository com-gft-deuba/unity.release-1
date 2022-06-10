cat kubernetes-token.txt

while sleep 1 ; do kubectl proxy --port 8001 ; done

http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/
