#creation de la security group
resource "aws_security_group" "my_sg" {
  name        = "${var.maintainer}-sg"
  description = "Allow http, https  and ssh inbound traffic"
      #définition des regles d'entrées pour les connexions http.
 ingress {
    description      = "HTTP from all"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
      #définition des regles d'entrées pour les connexions ssh
  ingress {
    description      = "HTTP from all"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
       #définition des regles d'entrées pour les connexions https
  ingress {
    description      = "HTTPS from all"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
       #définition des regles de sortir des machines(tous sont autorisés a sortir)
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
        #tag du security groupe
  tags = {
    Name = "${var.maintainer}-sg"
  }

}