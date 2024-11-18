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
├── dynamodb_table.tf 
├── provider.tf 
├── README.md 
├── terraform.tfstate 
├── terraform.tfstate.backup 
├── variables.tf
```

## Files
- `dynamodb_table.tf`: Defines the DynamoDB table resource.
- `provider.tf`: Configures the AWS provider.
- `variables.tf`: Contains the variables used in the project.
- `.gitignore`: Specifies files and directories to be ignored by Git.
- `README.md`: Project documentation.

## Getting Started

1. Clone the repository:
    ```sh
    git clone https://github.com/javiguerra777/terraform-dynamodb-project.git
    ```

2. After cloning the repository to your computer you will see a folder called `terraform-dynamodb-project`, open this folder in a code editor of choice. 

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
    variable "table_name" {
      default = "table name"
    }

    variable "billing_mode" {
      default = valid options are: "PAY_PER_REQUEST" or "PROVISIONED"
    }

    variable "partition_key" {
      default = "name of partition key"
    }

    variable "sort_key" {
      default = "name of sort key"
    }

    variable "read_capacity" {
      default = 5
      description = "Read Capacity Units"
      type = number
    }

    variable "write_capacity" {
      default = 5
      description = "Write Capacity Units"
      type = number
    }

    variable "environment" {
      default = "name of environment"
    }

    variable "project_name" {
      default = "name of project"
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

5. If you go to your AWS DynamoDB tables you can see the newest table you created

## Variables

- **table_name**: The name of the DynamoDB table.
- **billing_mode**: The billing mode for the DynamoDB table (default: PAY_PER_REQUEST).
- **partition_key**: The partition key for the DynamoDB table.
- **sort_key**: The sort key for the DynamoDB table.
- **read_capacity**: The read capacity units for the DynamoDB table (default: 5).
- **write_capacity**: The write capacity units for the DynamoDB table (default: 5).
- **environment**: The environment tag for the DynamoDB table.
- **project_name**: The project name tag for the DynamoDB table.

## Outputs

- **table_arn**: The ARN of the created DynamoDB table.
- **table_name**: The name of the created DynamoDB table.

## Cleanup

To destroy the created resources, run:
```sh
terraform destroy
```