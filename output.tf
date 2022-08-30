output "tls_private_key" {
  value     = tls_private_key.docker.private_key_pem
  sensitive = true
}
