storage "raft" {
  path    = "./vault/data"
  node_id = "vault"
}
listener "tcp" {
  address       = "0.0.0.0:8200"
  tls_disable = true
}
ui = true
cluster_addr  = "http://localhost:8201"
api_addr      = "http://localhost:8200"
disable_mlock = true
