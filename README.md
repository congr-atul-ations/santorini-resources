# Santorini resources

Public demo repository for infrastructure managed through the private Santorini IDP. Amazon S3 is the only supported module.

Each request lives under `.santorini/requests/<request-id>/`, on its own `santorini/<request-id>` branch and pull request. The app creates the PR after required inputs are complete and starts a GitHub Actions Terraform plan.

Review generated code and plans in Santorini. Code changes create a new commit and invalidate prior plans and approvals. Apply consumes the exact approved binary plan and waits for the `santorini-production` environment reviewer. A bot dispatches the protected run so the human reviewer can approve while self-review remains blocked.

AWS credentials use OIDC; state lives in a private encrypted/versioned S3 bucket. No credentials or Terraform state belong in this repository. Bucket names may be any valid globally unique S3 name.

Required Actions variables: `SANTORINI_PLAN_ROLE_ARN`, `SANTORINI_APPLY_ROLE_ARN`, `SANTORINI_STATE_BUCKET`, `SANTORINI_STATE_REGION`.
