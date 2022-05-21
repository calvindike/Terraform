output "Elastic_dns" {
  description = "The public DNS"
  value       = aws_eip.ip.public_dns 
}


output "public_ip" {
  description = "public ip"
  value       = aws_eip.ip.public_ip
}

