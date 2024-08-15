#
# alias administrator
#
resource "aws_iam_role" "atlantis_alias_admin" {
  name = "atlantis-alias-admin"
  path = "/"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : [
            "arn:aws:iam::${var.account_id.id}:role/atlantis-ecs_task_execution"
          ]
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })

}

resource "aws_iam_role_policy" "atlantis_alias_admin" {
  name = "atlantis-alias-admin-passrole"
  role = aws_iam_role.atlantis_alias_admin.id

  policy = jsonencode({
    "Statement" : [
      {
        "Sid" : "AllowIAMPassRole",
        "Action" : [
          "iam:PassRole"
        ],
        "Effect" : "Allow",
        "Resource" : "*"
      }
    ]
  })

}

resource "aws_iam_role_policy_attachment" "atlantis_alias_admin" {
  role       = aws_iam_role.atlantis_alias_admin.id
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

data "aws_iam_policy_document" "atlantis_assume_role" {
    statement {
    actions = [
      "sts:AssumeRole"
    ]

    resources = [
      aws_iam_role.atlantis_alias_admin.arn
   ]
  }
}

resource "aws_iam_role_policy" "atlantis_assume_role" {
  name   = "atlantis-assume-role"
  role   = aws_iam_role.ecs_task_execution.id
  policy = data.aws_iam_policy_document.atlantis_assume_role.json
}
