resource "aws_security_group" "tf_basics_ec2_security_group" {
  name        = "allow-ssh-http-https-tf"
  description = "Allow inbound SSH, HTTP, and HTTPS traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "terraform_basics" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.tf_basics_ec2_security_group.id]

  tags = {
    Name = "Terraform Basics"
  }
}

resource "aws_security_group" "tf_basics_rds_security_group" {
  name        = "allow-tf-ec2"
  description = "Allow inbound traffic from EC2 instance"

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.tf_basics_ec2_security_group.id]
  }
}

resource "aws_db_instance" "terraform_basics_rds_instance" {
  identifier             = "terraform-basics-rds-instance"
  allocated_storage      = 20
  engine                 = "postgres"
  instance_class         = "db.t3.micro"
  username               = "tfadmin"
  password               = "password"
  parameter_group_name   = "default.postgres15"
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.tf_basics_rds_security_group.id]
}
