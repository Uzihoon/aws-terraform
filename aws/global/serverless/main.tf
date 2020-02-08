
resource "aws_s3_bucket" "uzihoon-repository" {
  bucket        = "uzihoon-repository"
  force_destroy = true
  versioning {
      enabled = false
  }
  lifecycle {
      prevent_destroy = false
  }
}

resource "aws_api_gateway_rest_api" "api-gateway-uzihoon" {
  name = "api-gateway-uzihoon"
}

#module "lambda_greetingsOnDemand" {
#  source = "../../../module/global/serverless"
#  
#  lambda_function_name = "greetingsOnDemand"
#  lambda_handler       = var.lambda_handler
#  lambda_runtime       = var.lambda_runtime
#  
#  lambda_iam_role_name        = "greetingsOnDemand_role"
#  lambda_iam_assume_role_file = file("iamPolicy/lambdaAssumeRole.json")
#  lambda_iam_role_policy_name = "greetingsOnDemand_role_policy"
#  lambda_iam_role_policy_file = file("iamPolicy/greetingsOnDemand.json")
#  
#  lambda_code_s3_bucket = aws_s3_bucket.uzihoon-repository.id
#  lambda_code_s3_key    = "greetingsOnDemand.zip"
#  
#  api_gateway_rest_api_id               = aws_api_gateway_rest_api.api-gateway-uzihoon.id
#  api_gateway_rest_api_root_resource_id = aws_api_gateway_rest_api.api-gateway-uzihoon.root_resource_id
#  api_gateway_rest_api_execution_arn    = aws_api_gateway_rest_api.api-gateway-uzihoon.execution_arn
#  
#  api_gateway_resource      = "greeting"
#  api_gateway_method        = "GET"
#  api_gateway_deploy_stages = ["dev", "test"] 
#}

