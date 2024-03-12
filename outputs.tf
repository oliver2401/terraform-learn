output "ec2_instance_public_ip" {
  value = module.myapp-server.instance.public_ip
  
}