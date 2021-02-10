
output "kConfig" {
    value = linode_lke_cluster.k8s_cluster.kubeconfig
}

output "pool" {
    value = linode_lke_cluster.k8s_cluster.pool
}
