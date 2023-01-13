output "dns_publica_server1" {
    description = "DNS publica del servidor 1"
    value = "http://${aws_instance.bootcamp-server-1.public_dns}"
}

output "dns_publica_server2" {
    description = "DNS publica del servidor 2"
    value = "http://${aws_instance.bootcamp-server-2.public_dns}"
}

output "dns_alb" {
    description = "DNS publica del load balancer"
    value = "http://${aws_lb.bootcamp-web.dns_name}"
  
}