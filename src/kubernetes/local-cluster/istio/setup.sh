# # kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.4.0/aio/deploy/recommended.yaml
# kubectl apply -f dashboard.yaml
# kubectl apply -f setup.yaml
# echo
# echo
# kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"

export ISTIO_VERSION="1.13.3"
export ISTIO_ARCH="linux-amd64"
wget -o "istio-${ISITIO_VERSION}-${ISTIO_ARCH}.tgz" "https://github.com/istio/istio/releases/download/${ISTIO_VERSION}/istio-${ISTIO_VERSION}-${ISTIO_ARCH}.tar.gz"
