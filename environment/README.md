# My custom TF module
This solves all your infrastructure needs. (Just kidding :))

## Usage
~~~
module "networking" {
    source = "https://github.com/gulbeia/aws-terraform"

    vpc                    = "us-east-1"
    public_subnets_name    = "public_subnet"
    private_subnets_name   = "private_instance"
    number_of_subnets      = 6
}
~~~Wrote a terraform code for 3 environments using the network module that was provided
