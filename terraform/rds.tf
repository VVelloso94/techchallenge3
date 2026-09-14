resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-rds-subnet-group"
  subnet_ids = [aws_subnet.public_1.id, aws_subnet.public_2.id]

  tags = {
    Name = "${var.project_name}-rds-subnet-group"
  }
}

# 1. RDS para auth-service
resource "aws_db_instance" "auth_db" {
  identifier             = "auth-service-db"
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "13"
  instance_class         = "db.t3.micro"
  db_name                = "auth_db"
  username               = "postgres"
  password               = "postgres123"
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.all_internal.id]
  skip_final_snapshot    = true
  publicly_accessible    = true
}

# 2. RDS para flag-service
resource "aws_db_instance" "flag_db" {
  identifier             = "flag-service-db"
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "13"
  instance_class         = "db.t3.micro"
  db_name                = "flag_db"
  username               = "postgres"
  password               = "postgres123"
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.all_internal.id]
  skip_final_snapshot    = true
  publicly_accessible    = true
}

# 3. RDS para targeting-service
resource "aws_db_instance" "targeting_db" {
  identifier             = "targeting-service-db"
  allocated_storage      = 20
  engine                 = "postgres"
  engine_version         = "13"
  instance_class         = "db.t3.micro"
  db_name                = "targeting_db"
  username               = "postgres"
  password               = "postgres123"
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.all_internal.id]
  skip_final_snapshot    = true
  publicly_accessible    = true
}