# Deployment Guide

This guide explains how to deploy the Software Engineer Career Path project to an S3 bucket with the subdomain `software-engineer-career-path.quantium.com.mx`.

## Prerequisites

1. **AWS Account**: You need an AWS account with appropriate permissions
2. **AWS CLI**: Install and configure the AWS CLI
3. **GitHub Repository**: This project should be in a GitHub repository
4. **IAM User**: Create an IAM user with S3 permissions

## IAM Permissions

Create an IAM user with the following policy:

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:CreateBucket",
                "s3:DeleteBucket",
                "s3:PutBucketPolicy",
                "s3:PutBucketWebsite",
                "s3:PutBucketCors",
                "s3:PutPublicAccessBlock",
                "s3:PutObject",
                "s3:GetObject",
                "s3:DeleteObject",
                "s3:ListBucket",
                "s3:PutObjectAcl"
            ],
            "Resource": [
                "arn:aws:s3:::software-engineer-career-path.quantium.com.mx",
                "arn:aws:s3:::software-engineer-career-path.quantium.com.mx/*"
            ]
        }
    ]
}
```

## Setup Steps

### 1. Initial S3 Bucket Setup

Run the setup script to create and configure the S3 bucket:

```bash
chmod +x deploy-setup.sh
./deploy-setup.sh
```

This script will:
- Create the S3 bucket
- Configure it for static website hosting
- Apply the public read access policy
- Enable CORS
- Disable block public access settings

### 2. Configure GitHub Secrets

Add the following secrets to your GitHub repository:

1. Go to your repository → Settings → Secrets and variables → Actions
2. Add these secrets:
   - `AWS_ACCESS_KEY_ID`: Your AWS access key
   - `AWS_SECRET_ACCESS_KEY`: Your AWS secret key

### 3. Deploy

The deployment will automatically trigger when you push to the `main` or `master` branch.

## Manual Deployment

To deploy manually:

```bash
aws s3 sync . s3://software-engineer-career-path.quantium.com.mx \
  --exclude ".git/*" \
  --exclude ".github/*" \
  --exclude "README.md" \
  --exclude "CONTRIBUTING.md" \
  --exclude "docs/*" \
  --exclude "package.json" \
  --exclude "LICENSE" \
  --delete \
  --cache-control "max-age=31536000,public"
```

## Website Access

After deployment, your website will be available at:
- **S3 Website URL**: `http://software-engineer-career-path.quantium.com.mx.s3-website-us-east-1.amazonaws.com`
- **Custom Domain**: `http://software-engineer-career-path.quantium.com.mx` (if configured)

## Troubleshooting

### Common Issues

1. **403 Forbidden**: Check that the bucket policy allows public read access
2. **404 Not Found**: Ensure the bucket is configured for static website hosting
3. **CORS errors**: Verify CORS is properly configured
4. **Deployment fails**: Check GitHub Actions logs and AWS credentials

### Verification Commands

```bash
# Check bucket policy
aws s3api get-bucket-policy --bucket software-engineer-career-path.quantium.com.mx

# Check website configuration
aws s3api get-bucket-website --bucket software-engineer-career-path.quantium.com.mx

# Check public access block settings
aws s3api get-public-access-block --bucket software-engineer-career-path.quantium.com.mx
```

## Security Notes

- The S3 bucket is configured for public read access
- Only GET operations are allowed for public users
- The bucket policy restricts access to read-only operations
- Consider implementing additional security measures if needed

## Cost Optimization

- S3 Standard storage is used for the website files
- No CloudFront distribution is configured (as requested)
- Consider setting up lifecycle policies for cost optimization if needed
