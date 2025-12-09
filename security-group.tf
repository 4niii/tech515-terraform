resource "aws_security_group" "anika_sg" {
  name        = "tech515-anika-tf-allow-port-22-3000-80"
  description = "Terraform SG for Anika"
  # vpc_id      = "default" # already set as default unless specified

# inbound traffic rules

  ingress {
    description = "SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["31.94.16.17/32"]
  }

  ingress {
    description = "Allow port 3000"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

# ingress = INcoming traffic - what traffic is allowed into the VM
# egress - EXiting traffic - what the VM is allowed to send out