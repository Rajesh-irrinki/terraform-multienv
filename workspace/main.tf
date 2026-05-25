resource "aws_instance" "workspace-demo" {
    ami = local.ami_id
    instance_type = lookup(var.instance_type, local.env)
    vpc_security_group_ids = [aws_security_group.allow-all-sg-tf.id]

    tags = {
        Project = "Roboshop"
        Name = "roboshop-${local.env}"
        Terraform = true
        Environment = local.env
    }
}

resource "aws_security_group" "allow-all-sg-tf" {
    name = "allow-all-tf-sg-${local.env}"
    description = "this security group for the environment of ${local.env}"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = {
        Project = "Roboshop"
        Name = "allow-all-tf-sg-${local.env}"
        Terraform = true
        Environment = local.env
    }
}