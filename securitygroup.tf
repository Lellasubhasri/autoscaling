resource "aws_security_group" "amibuild" {
  name        = "ansible_server"
  description = "Allow connection for ansible inbound traffic"
  #vpc_id      = data.aws_vpc.blue-green-deploy.id

  ingress {
    description      = "allow port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["49.205.107.194/32"]
  }

  ingress {
    description      = "allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["49.205.107.194/32"]
  }
   ingress {
    description      = "allow port 443"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["49.205.107.194/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "amibuild"
  }
}
