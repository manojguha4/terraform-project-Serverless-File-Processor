resource "aws_iam_role" "lambda_role" {

  name = "lambda-role"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "lambda.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_lambda_function" "file_processor" {

  function_name = "file-processor"

  filename = "../lambda/lambda.zip"

  handler = "handler.handler"

  runtime = "python3.9"

  role = aws_iam_role.lambda_role.arn

}