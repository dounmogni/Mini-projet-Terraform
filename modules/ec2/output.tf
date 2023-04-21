      #afficher en console l'Id de l'instance
output "output_ec2_id" {
  value = aws_instance.mini-projet-ec2.id
}
       #afficher en console la zone de disponibilité ou se trouve l'instance.
output "output_ec2_AZ" {
  value = aws_instance.mini-projet-ec2.availability_zone
}