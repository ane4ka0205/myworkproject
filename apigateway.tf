resource "aws_api_gateway_rest_api" "mygw" {
  name = "mygw"
  description = "This is my API for testing purposes"
  
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_resource" "Myresource"{
  rest_api_d = "${aws_api_gateway_rest_api.mygw.id}"
  parent_id = "${aws_api_gateway_rest_api.mygw.root_resource_id}"
  path_part = "myresource"
}

resource "aws_api_gateway_method" "Mymethod" {
  rest_api_id = "${aws_api_gateway_rest_api.mygw.id}"
  resource_id = "${aws_api_gateway_resource.Myresource.id}"
  http_method = "GET"
  authorization = "NONE"
}


