############## rayleigh DevOps Group ##################
resource "aws_iam_group" "rayleigh_devops_white" {
  name = "rayleigh_devops_white"
}

resource "aws_iam_group_membership" "rayleigh_devops_white" {
  name = aws_iam_group.rayleigh_devops_white.name

  users = [
    aws_iam_user.readonly_rayleigh.name,
  ]

  group = aws_iam_group.rayleigh_devops_white.name
}

#######################################################

########### rayleigh DevOps users #####################

resource "aws_iam_user" "readonly_rayleigh" {
  name = "readonly@rayleigh.me" # Edit this value to the username you want to use 
}

#######################################################

############### DevOps Basic Policy ##################
######################################################

########### DevOps Assume Policies ####################
resource "aws_iam_group_policy_attachment" "rayleigh_devops_white" {
  count      = length(var.assume_policy_rayleigh_devops_white)
  group      = aws_iam_group.rayleigh_devops_white.name
  policy_arn = var.assume_policy_rayleigh_devops_white[count.index]
}

variable "assume_policy_rayleigh_devops_white" {
  description = "IAM Policy to be attached to user"
  type        = list(string)

  default = [
    # Please change <account_id> to the real account id number of id account 
    "arn:aws:iam::{your-id-account_id}:policy/assume-rayleigh-prod-readonly-policy", # Add readonly policy to white group user 
  ]
}

#######################################################


############### MFA Manager ###########################
resource "aws_iam_group_policy_attachment" "rayleigh_devops_white_rotatekeys" {
  group      = aws_iam_group.rayleigh_devops_white.name
  policy_arn = aws_iam_policy.RotateKeys.arn
}

resource "aws_iam_group_policy_attachment" "rayleigh_devops_white_selfmanagemfa" {
  group      = aws_iam_group.rayleigh_devops_white.name
  policy_arn = aws_iam_policy.SelfManageMFA.arn
}

resource "aws_iam_group_policy_attachment" "rayleigh_devops_white_forcemfa" {
  group      = aws_iam_group.rayleigh_devops_white.name
  policy_arn = aws_iam_policy.ForceMFA.arn
}

#######################################################
