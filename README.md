# Terraform EC2 Project

This project uses Terraform to create an EC2 instance on AWS.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS account with appropriate permissions
- AWS CLI configured with your credentials

## Project Structure
```
├── .gitignore
├── .terraform/ 
├── .terraform.lock.hcl 
├── ec2.tf 
├── provider.tf 
├── README.md 
├── terraform.tfstate 
├── terraform.tfstate.backup 
├── variables.tf
├── vpc.tf
```

## Files
- `ec2.tf`: Defines the EC2 instance, and security group to be attached to EC2 instance.
- `vpc.tf`: Defines the VPC, IGW, Subnets, and Route Table to be created.
- `provider.tf`: Configures the AWS provider.
- `variables.tf`: Contains the variables used in the project.
- `.gitignore`: Specifies files and directories to be ignored by Git.
- `README.md`: Project documentation.

## Getting Started

1. Clone the repository:
    ```sh
    git clone https://github.com/javiguerra777/terraform-ec2-project.git
    ```

2. After cloning the repository to your computer you will see a folder called `terraform-ec2-project`, open this folder in a code editor of choice. 

3.  **Create a `variables.tf` file:**
    You will need to create a `variables.tf` file and structure it like this before you run the terraform project:
    ```hcl
    variable "aws_access_key" {
      default = "aws access key"
    }
    variable "aws_secret_key" {
      default = "aws secret key"
    }
    variable "region" {
      default = "aws region"
    }
    variable "subnet_zone_1" {
      default = "aws subnet zone 1"
    }
    variable "subnet_zone_2" {
      default = "aws subnet zone 2"
    }
    variable "environment" {
      default = "project environment"
    }
    variable "project_name" {
      default = "project name"
    }
    variable "ssh_key_name" {
      default = "name of ssh key created"
    }
    ```

## Usage

1. Initialize Terraform:
    ```sh
    terraform init
    ```

2. Review the plan:
    ```sh
    terraform plan
    ```

3. Apply the configuration:
    ```sh
    terraform apply
    ```

4. Confirm the apply step by typing `yes`.

5. If you go to your AWS VPC you will see the VPC, IGW, Subnets, and Route Table that were created

6. If you go to your AWS EC2 you will see the EC2 instance and Security Group created, you should now be able to connec to your EC2 instance using SSH or Putty

## Variables

- **aws_access_key**: Your AWS access key for authentication.
- **aws_secret_key**: Your AWS secret key.
- **region**: The AWS region where resources are created.
- **subnet_zone_1**: Availability Zone for the first subnet.
- **subnet_zone_2**: Availability Zone for the second subnet.
- **instance_type**: EC2 instance type.
- **ami_id**: AMI ID to be used for the EC2 instance.
- **ssh_key_name**: The name of the SSH key used to access the EC2 instance.
- **security_group_name**: Name of the security group.
- **environment**: The environment tag for your resources (e.g., `dev`, `prod`).
- **project_name**: The project name tag.


## Outputs

- **instance_public_ip**: The public IP address of the created EC2 instance.
- **vpc_id**: The ID of the created VPC.
- **subnet_ids**: The IDs of the subnets created.

## Cleanup

To destroy the created resources, run:
```sh
terraform destroy
```