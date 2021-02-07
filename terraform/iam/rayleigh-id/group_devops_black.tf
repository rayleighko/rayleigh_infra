############## rayleigh DevOps Group ##################
resource "aws_iam_group" "rayleigh_devops_black" {
  name = "rayleigh_devops_black"
}

resource "aws_iam_group_membership" "rayleigh_devops_black" {
  name = aws_iam_group.rayleigh_devops_black.name

  users = [
    aws_iam_user.ray_ko.name
  ]

  group = aws_iam_group.rayleigh_devops_black.name
}

############### DevOps Basic Policy ##################
######################################################

########### DevOps Assume Policies ####################
resource "aws_iam_group_policy_attachment" "rayleigh_devops_black" {
  count      = length(var.assume_policy_rayleigh_devops_black)
  group      = aws_iam_group.rayleigh_devops_black.name
  policy_arn = var.assume_policy_rayleigh_devops_black[count.index]
}

variable "assume_policy_rayleigh_devops_black" {
  description = "IAM Policy to be attached to user"
  type        = list(string)

  default = [
    # Please change <account_id> to the real account id number of id account 
    "arn:aws:iam::{your-id-account_id}:policy/assume-rayleigh-prod-admin-policy", # Add admin policy to black group user 
    "arn:aws:iam::{your-id-account_id}:policy/assume-rayleigh-dev-admin-policy",  # Add admin policy to black group user 
  ]
}

#######################################################


############### MFA Manager ###########################
resource "aws_iam_group_policy_attachment" "rayleigh_devops_black_rotatekeys" {
  group      = aws_iam_group.rayleigh_devops_black.name
  policy_arn = aws_iam_policy.RotateKeys.arn
}

resource "aws_iam_group_policy_attachment" "rayleigh_devops_black_selfmanagemfa" {
  group      = aws_iam_group.rayleigh_devops_black.name
  policy_arn = aws_iam_policy.SelfManageMFA.arn
}

resource "aws_iam_group_policy_attachment" "rayleigh_devops_black_forcemfa" {
  group      = aws_iam_group.rayleigh_devops_black.name
  policy_arn = aws_iam_policy.ForceMFA.arn
}

#######################################################
