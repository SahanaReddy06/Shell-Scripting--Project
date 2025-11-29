#!/bin/bash

echo "============================================"
echo "        AWS PROJECT USAGE REPORT"
echo "============================================"
echo

# ---------- EC2 INSTANCES ----------
echo "🔹 EC2 Instances:"
aws ec2 describe-instances --query "Reservations[].Instances[].[InstanceId,InstanceType,State.Name,Tags]" --output table
echo

# Count EC2
echo "🔹 Total EC2 Instances:"
aws ec2 describe-instances --query "Reservations[].Instances[].InstanceId" --output text | wc -w
echo

# ---------- S3 BUCKETS ----------
echo "🔹 S3 Buckets:"
aws s3 ls
echo

# S3 Bucket Sizes
echo "🔹 S3 Bucket Sizes:"
for bucket in $(aws s3 ls | awk '{print $3}')
do
  echo "➡️ Bucket: $bucket"
  aws s3api list-objects --bucket $bucket --output json --query "[sum(Contents[].Size)]"
done
echo

# ---------- LAMBDA FUNCTIONS ----------
echo "🔹 Lambda Functions:"
aws lambda list-functions --query "Functions[].FunctionName" --output table
echo

# ---------- IAM USERS ----------
echo "🔹 IAM Users:"
aws iam list-users --query "Users[].UserName" --output table
echo

# ---------- COST (optional) ----------
echo "🔹 Est. Monthly Cost (If enabled):"
aws ce get-cost-and-usage \
  --time-period Start=$(date -d "1 month ago" +%Y-%m-01),End=$(date +%Y-%m-%d) \
  --granularity MONTHLY \
  --metrics "UnblendedCost" \
  --query "ResultsByTime[].Total.UnblendedCost.Amount"
echo

echo "============================================"
echo "        END OF AWS USAGE REPORT"
echo "============================================"
