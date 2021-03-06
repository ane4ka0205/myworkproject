resource "aws_api_gateway_rest_api" "mygw" {
  name = "mygw"
  description = "This is my API for testing purposes"
  
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_resource" "myresource"{
  rest_api_id = "${aws_api_gateway_rest_api.mygw.id}"
  parent_id = "${aws_api_gateway_rest_api.mygw.root_resource_id}"
  path_part = "myresource"
}

resource "aws_api_gateway_method" "Mymethod" {
  rest_api_id = "${aws_api_gateway_rest_api.mygw.id}"
  resource_id = "${aws_api_gateway_resource.myresource.id}"
  http_method = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "Myintegration" {
  rest_api_id = "${aws_api_gateway_rest_api.mygw.id}"
  resource_id = "${aws_api_gateway_resource.myresource.id}"
  http_method = "${aws_api_gateway_method.Mymethod.http_method}"
  type = "MOCK"
}

resource "aws_api_gateway_deployment" "mydeploy" {
  depends_on = ["aws_api_gateway_integration.Myintegration"]

  rest_api_id = "${aws_api_gateway_rest_api.mygw.id}"
  stage_name = "dev"

  variables = {
    "answer" = "42"
  }
}  

