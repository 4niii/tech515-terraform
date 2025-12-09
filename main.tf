# create an EC2 instance
# where to create - what cloud provider
# use Ireland region
# which AMI ID: ami-0c1c30571d2dae5c9 (for ubuntu 22.04 lts)
# type of instance t3.micro
# need a public IP address 

# aws_access_key = // MUST NOT DO THIS | Never hardcode
# aws_secret_key = // MUST NOT DO THIS | credentials!!

# name the instance tech515-anika-tf-first-instance
# syntax for HCL (HashiCorp) is {key = value}

# create an EC2 instance
# cloud provider is AWS

# during git clone, do not push the provider file (.terraform\providers...). when someone downloads your git repo, they'll have to do 'terraform init' to download the provider in ther machine for the terraform commands to work.
# ensure you do share the .terraform.lock.hcl file, it contains your version of provider!

provider "aws" {
    # use Ireland region
    region = "eu-west-1"
}

# which service/resource
resource "aws_instance" "app_instance" {
 
    # which AMI ID ami-070bb96caec8210c0 (for ubuntu 22.04 lts)
    ami = "ami-070bb96caec8210c0"
 
    # what type of instance to launch
    instance_type = "t3.micro"

    #ssh key
    key_name = "tech515-anika-aws"

    # attaching new security group
    vpc_security_group_ids = [aws_security_group.anika_sg.id]

    # please add a public ip to this instance
    associate_public_ip_address = true
 
    # name the service
    tags = {
        Name = "tech515-anika-tf-instance"
    }
}

