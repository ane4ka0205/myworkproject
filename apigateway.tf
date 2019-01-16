resource "aws_api_gateway_rest_api" "mygw" {
  name = "mygw"
  description = "This is my API for testing purposes"
  
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}


