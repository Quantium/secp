#!/bin/bash

# S3 Bucket Setup Script for software-engineer-career-path.quantium.com.mx
# This script helps set up the S3 bucket with proper configuration

set -e

BUCKET_NAME="software-engineer-career-path.quantium.com.mx"
REGION="us-east-1"

echo "🚀 Setting up S3 bucket: $BUCKET_NAME"

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "❌ AWS CLI is not installed. Please install it first."
    echo "   Visit: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html"
    exit 1
fi

# Check if AWS credentials are configured
if ! aws sts get-caller-identity &> /dev/null; then
    echo "❌ AWS credentials are not configured. Please run 'aws configure' first."
    exit 1
fi

echo "✅ AWS CLI and credentials are configured"

# Create S3 bucket
echo "📦 Creating S3 bucket..."
aws s3 mb s3://$BUCKET_NAME --region $REGION

# Configure bucket for static website hosting
echo "🌐 Configuring bucket for static website hosting..."
aws s3 website s3://$BUCKET_NAME \
    --index-document index.html \
    --error-document index.html

# Disable block public access settings FIRST
echo "🔓 Disabling block public access settings..."
aws s3api put-public-access-block \
    --bucket $BUCKET_NAME \
    --public-access-block-configuration \
    "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false"

# Apply bucket policy for public read access
echo "🔓 Applying public read access policy..."
aws s3api put-bucket-policy \
    --bucket $BUCKET_NAME \
    --policy file://s3-bucket-policy.json

# Enable CORS for web access
echo "🌍 Enabling CORS..."
aws s3api put-bucket-cors \
    --bucket $BUCKET_NAME \
    --cors-configuration '{
        "CORSRules": [
            {
                "AllowedHeaders": ["*"],
                "AllowedMethods": ["GET"],
                "AllowedOrigins": ["*"],
                "ExposeHeaders": []
            }
        ]
    }'

echo "✅ S3 bucket setup completed successfully!"
echo ""
echo "📋 Next steps:"
echo "1. Add the following secrets to your GitHub repository:"
echo "   - AWS_ACCESS_KEY_ID"
echo "   - AWS_SECRET_ACCESS_KEY"
echo "2. Push to main/master branch to trigger deployment"
echo "3. Your website will be available at: http://$BUCKET_NAME"
echo ""
echo "🔧 To deploy manually, run:"
echo "   aws s3 sync . s3://$BUCKET_NAME --exclude '.git/*' --exclude '.github/*' --delete"
