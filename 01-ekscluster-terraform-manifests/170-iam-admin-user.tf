# Resource: AWS IAM User - Admin User (Has Full AWS Access)
resource "aws_iam_user" "admin_user" {
  name = "${local.name}-admin"
  path = "/"
  force_destroy = true
  tags = local.common_tags
}

# Resource: Admin Access Policy - Attach it to admin user
resource "aws_iam_user_policy_attachment" "admin_user" {
  user       = aws_iam_user.admin_user.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

#Since aws_iam_user_login_profile resource does not allow to add a password argument 
#and password output is not a best practice please create the login credentials with this command 

#aws iam create-login-profile --user-name MyUser --password My!User1Login8P@ssword --password-reset-required