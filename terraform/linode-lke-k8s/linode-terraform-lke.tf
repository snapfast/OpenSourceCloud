
resource "linode_lke_cluster" "k8s_cluster" {
    label       = "k8s-cluster"
    k8s_version = "1.18"
    region      = "ap-west"
    tags        = ["prod"]

    pool {
        type  = "g6-standard-1"
        count = 2
    }
}

resource "local_file" "file" {
    content = base64decode(linode_lke_cluster.k8s_cluster.kubeconfig)
    filename = "${path.module}/k8s.yml"
}

