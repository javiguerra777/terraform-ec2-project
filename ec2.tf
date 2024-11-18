resource "aws_instance" "main" {
  ami = "ami-02a7ad1c45194c72f"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet_1.id
  key_name = var.ssh_key_name
  vpc_security_group_ids = [aws_security_group.main.id]
  tags = {
    Name = "${var.project_name}-${var.environment}-instance"
  }
}

resource "aws_security_group" "main" {
  vpc_id = aws_vpc.main.id
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
