resource "aws_instance" "multienv-demo" {
    ami = var.ami_id
    instance_type = var.instance_type 
    vpc_security_group_ids = [aws_security_group.allow-all-sg-tf.id]
    tags = {
        Name = "roboshop-${var.env}"
        Project = "Roboshop"
        Terraform = true
        Environment = var.env
    }
}

resource "aws_security_group" "allow-all-sg-tf" {
    name = "allow-all-sg-tf-${var.env}"

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    tags = {
      name = "allow-all-sg-tf-${var.env}"
    }
}