#filtrage de l'image appartir des user data

data "aws_ami" "my_ubuntu_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

#creation de l'instance

resource "aws_instance" "mini-projet-ec2" {
  ami               = data.aws_ami.my_ubuntu_ami.id
  instance_type     = var.instance_type
  key_name          = var.ssh_key
  availability_zone = var.AZ
  security_groups   = ["${var.sg_name}"]
  tags = {
    Name = "${var.maintainer}-ec2"
  }
      #suppression de EBS qui reste sur aws a chaque destruction de la ressource
   root_block_device {
    delete_on_termination = true
  }
     #récuperation de l'adresse publique
  provisioner "local-exec" {
    command = "echo PUBLIC IP: ${var.public_ip} >> IP_ec2.txt"
  }
     #Installation de nginx sur l'instance distant
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
       #Connection a l'instance 
    connection {
      type        = "ssh"
      user        = var.user
      private_key = file("D:/2023/EAZYTREANING/BOOTCAMP-DevOps/Terraform-entrainement/${var.ssh_key}.pem")
      host        = self.public_ip
    }
  }


}