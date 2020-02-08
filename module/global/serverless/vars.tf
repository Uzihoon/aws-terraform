variable "lambda_function_name" {
}

variable "lambda_handler" {
}

variable "lambda_runtime" {
}

variable "lambda_iam_role_name" {
}

variable "lambda_iam_assume_role_file" {
}

variable "lambda_iam_role_policy_name" {
}

variable "lambda_iam_role_policy_file" {
}

variable "lambda_code_s3_bucket" {
}

variable "lambda_code_s3_key" {
}

variable "api_gateway_rest_api_id" {
}

variable "api_gateway_rest_api_root_resource_id" {
}

variable "api_gateway_rest_api_execution_arn" {
}

variable "api_gateway_resource" {
}

variable "api_gateway_method" {
}

variable "api_gateway_deploy_stages" {
  type = list
}
