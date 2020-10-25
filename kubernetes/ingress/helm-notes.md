#### for ingress

- helm is needed
- helm helps download and create various resources
- resources
  - ingress-controller
  - http-backend
  - creates required services and deployments for each
- this implementation uses ingress-nginx controller provided by kubernetes. https://artifacthub.io/packages/helm/ingress-nginx/ingress-nginx
- other implementation exists for the nginx provided by nginx. https://github.com/nginxinc/kubernetes-ingress


