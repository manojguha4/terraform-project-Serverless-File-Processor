import json
import boto3
import uuid

dynamodb = boto3.resource(
    "dynamodb",
    endpoint_url="http://localhost:4566",
    region_name="us-east-1"
)

table = dynamodb.Table("files-table")

def handler(event, context):

    file_id = str(uuid.uuid4())

    table.put_item(
        Item={
            "id": file_id
        }
    )

    return {
        "statusCode": 200,
        "body": json.dumps({
            "message": "File processed",
            "id": file_id
        })
    }