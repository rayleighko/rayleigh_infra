############## Perpick DevOps Group ##################
resource "aws_iam_group" "perpick_devops_white" {
  name = "perpick_devops_white"
}

resource "aws_iam_group_membership" "perpick_devops_white" {
  name = aws_iam_group.perpick_devops_white.name

  users = [
    aws_iam_user.readonly_perpick.name,
  ]

  group = aws_iam_group.perpick_devops_white.name
}

#######################################################

########### Perpick DevOps users #####################

resource "aws_iam_user" "readonly_perpick" {
  name = "readonly@perpick.me" # Edit this value to the username you want to use 
}

#######################################################

############### DevOps Basic Policy ##################
######################################################

########### DevOps Assume Policies ####################
resource "aws_iam_group_policy_attachment" "perpick_devops_white" {
  count      = length(var.assume_policy_perpick_devops_white)
  group      = aws_iam_group.perpick_devops_white.name
  policy_arn = var.assume_policy_perpick_devops_white[count.index]
}

variable "assume_policy_perpick_devops_white" {
  description = "IAM Policy to be attached to user"
  type        = list(string)

  default = [
    # Please change <account_id> to the real account id number of id account 
    "arn:aws:iam::{your-id-account_id}:policy/assume-perpick-prod-readonly-policy", # Add readonly policy to white group user 
  ]
}

#######################################################


############### MFA Manager ###########################
resource "aws_iam_group_policy_attachment" "perpick_devops_white_rotatekeys" {
  group      = aws_iam_group.perpick_devops_white.name
  policy_arn = aws_iam_policy.RotateKeys.arn
}

resource "aws_iam_group_policy_attachment" "perpick_devops_white_selfmanagemfa" {
  group      = aws_iam_group.perpick_devops_white.name
  policy_arn = aws_iam_policy.SelfManageMFA.arn
}

resource "aws_iam_group_policy_attachment" "perpick_devops_white_forcemfa" {
  group      = aws_iam_group.perpick_devops_white.name
  policy_arn = aws_iam_policy.ForceMFA.arn
}

#######################################################
