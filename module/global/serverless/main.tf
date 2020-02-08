resource "aws_lambda_function" "example-lambda-function" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.example-iam-role.arn
  
  s3_bucket = var.lambda_code_s3_bucket
  s3_key    = var.lambda_code_s3_key

  handler = var.lambda_handler
  runtime = var.lambda_runtime
}

resource "aws_iam_role" "example-iam-role" {
  name = var.lambda_iam_role_name
  assume_role_policy = var.lambda_iam_assume_role_file
}

resource "aws_iam_role_policy" "example-iam-role-policy" {
  name = var.lambda_iam_role_policy_name
  role = aws_iam_role.example-iam-role.id
  policy = var.lambda_iam_role_policy_file
}

resource "aws_api_gateway_resource" "example-api-gateway-resource" {
  rest_api_id = var.api_gateway_rest_api_id
  parent_id   = var.api_gateway_rest_api_root_resource_id
  path_part   = var.api_gateway_resource
}

resource "aws_api_gateway_method" "example-api-gateway-method" {
  rest_api_id   = var.api_gateway_rest_api_id
  resource_id   = aws_api_gateway_resource.example-api-gateway-resource.id
  http_method   = var.api_gateway_method
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "example-api-gateway-integration" {
  rest_api_id = var.api_gateway_rest_api_id
  resource_id = aws_api_gateway_resource.example-api-gateway-resource.id
  http_method = aws_api_gateway_method.example-api-gateway-method.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.example-lambda-function.invoke_arn
}


resource "aws_api_gateway_deployment" "example-api-gateway-deployment" {
  depends_on = [ aws_api_gateway_integration.example-api-gateway-integration ]

  rest_api_id = var.api_gateway_rest_api_id
  
  count      = length(var.api_gateway_deploy_stages)
  stage_name = element(var.api_gateway_deploy_stages, count.index)
}

resource "aws_lambda_permission" "example-lambda-permission" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.example-lambda-function.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${var.api_gateway_rest_api_execution_arn}/*/*"
}

