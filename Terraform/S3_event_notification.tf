resource "aws_s3_bucket_notification" "trigger" {
  bucket = aws_s3_bucket.upload.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.processor.arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [aws_lambda_permission.allow_s3]
}