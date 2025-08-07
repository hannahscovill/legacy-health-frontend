# Legacy Health Frontend

A modern TypeScript React application built with Vite for Legacy Health's patient advocacy platform.

## 🏗️ Architecture

- **Frontend**: React 18 + TypeScript + Vite
- **Infrastructure**: AWS S3 + CloudFront + ACM (SSL)
- **CI/CD**: GitHub Actions with Terraform automation

## 🚀 Quick Start

### Prerequisites

- Node.js 18+
- npm or yarn
- AWS CLI configured (for deployment)
- Terraform 1.6+ (for infrastructure)

### Local Development

```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Build for production
npm run build

# Type checking
npm run type-check

# Linting
npm run lint
```

## ☁️ AWS Infrastructure

The application deploys to AWS using Terraform with the following resources:

- **S3 Bucket**: Static website hosting with public read access
- **CloudFront**: CDN with HTTPS redirect and SPA routing support
- **ACM Certificate**: SSL/TLS certificate with DNS validation
- **Route53**: DNS validation records (if domain provided)

### Infrastructure Setup

1. **Configure Terraform variables**:
   ```bash
   cd terraform
   cp terraform.tfvars.example terraform.tfvars
   # Edit terraform.tfvars with your values
   ```

2. **Deploy infrastructure**:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

### Required Terraform Variables

```hcl
aws_region      = "us-west-2"          # AWS region
environment     = "dev"                # Environment name
domain_name     = "your-domain.com"    # Optional: Custom domain
certificate_arn = ""                   # Optional: Existing certificate ARN
project_name    = "legacy-health-frontend"
```

## 🔄 CI/CD Pipeline

The GitHub Actions workflow automatically:

1. **On Pull Requests**:
   - Runs tests and linting
   - Generates Terraform plan
   - Posts plan as PR comment

2. **On Main Branch Push**:
   - Runs tests and builds application
   - Applies Terraform changes
   - Deploys to S3
   - Invalidates CloudFront cache

### Required GitHub Secrets

- `AWS_ACCESS_KEY_ID`: AWS access key
- `AWS_SECRET_ACCESS_KEY`: AWS secret key

### Required GitHub Variables

- `AWS_REGION`: AWS region (default: us-west-2)
- `ENVIRONMENT`: Environment name (default: dev)
- `DOMAIN_NAME`: Custom domain (optional)
- `CERTIFICATE_ARN`: Existing certificate ARN (optional)

## 📁 Project Structure

```
├── src/                    # React application source
├── terraform/             # Infrastructure as Code
│   ├── main.tf            # Provider configuration
│   ├── variables.tf       # Input variables
│   ├── s3.tf             # S3 bucket resources
│   ├── cloudfront.tf     # CloudFront distribution
│   ├── acm.tf            # SSL certificate
│   └── outputs.tf        # Output values
├── .github/
│   └── workflows/
│       └── deploy.yml    # CI/CD pipeline
└── dist/                 # Build output
```

## 🛠️ Development Commands

```bash
npm run dev          # Start dev server
npm run build        # Build for production
npm run preview      # Preview production build
npm run type-check   # TypeScript checking
npm run lint         # ESLint checking
```

## 📋 Features

- ⚡ **Vite**: Lightning fast HMR and builds
- 🔒 **TypeScript**: Type safety and better DX
- 🎨 **ESLint**: Code quality and consistency
- ☁️ **AWS**: Scalable cloud infrastructure
- 🚀 **CI/CD**: Automated testing and deployment
- 🔐 **HTTPS**: SSL/TLS with custom domains
- 🌐 **CDN**: Global content delivery

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and linting
5. Submit a pull request
