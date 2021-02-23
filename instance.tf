resource "aws_instance" "redhat" {
  ami = "ami-009b16df9fcaac611"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.allow_22_80_3306.id]
  key_name = "aws"
  user_data = file("inst_docker_wp.sh")
  provisioner "file" {
    source      = "docker-compose.yml"
    destination = "/home/ec2-user/docker-compose.yml"
    connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("/home/valeriy/.ssh/aws.pem")
    host     = aws_instance.redhat.public_ip
  }
    
  }
  tags = {
    "Name" = "RedHat"
  }
}
