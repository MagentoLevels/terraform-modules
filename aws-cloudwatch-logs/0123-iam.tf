module "role" {

  source = "git::https://github.com/MagentoLevels/terraform-modules.git//aws-iam-role?ref=tags/0.0.37"


  attributes = compact(concat(module.this.attributes, tolist(["log"]), tolist(["group"])))

  role_description   = "Cloudwatch ${module.this.id} logs role"
  policy_description = "Cloudwatch ${module.this.id} logs policy"

  principals = var.principals

  policy_documents = [
    data.aws_iam_policy_document.log_agent.json,
  ]

  context = module.this.context
}

data "aws_iam_policy_document" "log_agent" {
  statement {
    actions = [
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "logs:PutLogEvents",
    ]

    resources = [
      join("", aws_cloudwatch_log_group.default.*.arn),
    ]
  }

  statement {
    actions = var.additional_permissions

    resources = [
      join("", aws_cloudwatch_log_group.default.*.arn),
    ]
  }
}