resource "aws_security_group" "allow_tls" {
  name        = var.name
  description = "Allow TLS inbound traffic"

  dynamic "ingress" {
    for_each = [22, 80, 443, 3306]
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}


resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  security_groups = [aws_security_group.allow_tls.name]


  tags = {
    Name = var.name
    ower = var.owner
    purpose = var.purpose
  }
}
