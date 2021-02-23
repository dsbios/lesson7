resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "8.0.21"
  instance_class       = "db.t3.micro"
  name                 = "wp"
  username             = "admin"
  password             = "12345qwerty"
  identifier = "db-wp"
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.allow_22_80_3306.id]
  db_subnet_group_name = aws_db_subnet_group.default.id


}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.main.id, aws_subnet.second.id]

  tags = {
    Name = "My DB subnet group"
  }
}

output "DB" {
  value = aws_db_instance.default.endpoint

}