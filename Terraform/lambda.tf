resource "aws_lambda_function" "processor" {

  function_name = "file-processor"

  filename = "${path.module}/../lambda/lambda.zip"
  source_code_hash = filebase64sha256("${path.module}/../lambda/lambda.zip")

  runtime = "python3.11"
  handler = "handler.handler"

  role = "arn:aws:iam::000000000000:role/lambda-role"
}



resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.processor.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.upload.arn
}