locals {
  env = terraform.workspace
  ami_id = data.aws_ami.ami_id.id
}