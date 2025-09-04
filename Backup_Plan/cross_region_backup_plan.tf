/////////////// AWS Backup Plan for Cross Region //////////

#  If vault is not present in the code , use the following lines
#  Using data to import value of AWS Backup Vault
data "aws_backup_vault" "current"{

  name = "my_vault"
}


###### Cross-Region Backup Plan #####
# Backup Plan
resource "aws_backup_plan" "cross_backup" {
  name = "name_for_backup_plan"

  rule {
    rule_name         = "main_rule"
    target_vault_name = data.aws_backup_vault.current.id
    schedule          = "cron(00 01 * * ? *)"
    start_window      = 60
    completion_window = 120

    lifecycle {
      delete_after = 31
    }
    copy_action {
      destination_vault_arn = "destination_vault"

    }

  }
  tags = {

    Environment = "env_name"
  }
}

##### Backup Selection by tag for cross-region ######
resource "aws_backup_selection" "cross_backup_selection" {
  iam_role_arn = "role_for_backup"
  plan_id      = aws_backup_plan.cross_backup.id
  name         = "main_assignment"

  selection_tag {
    type  = "STRINGEQUALS"
    key   = "backup_daily"
    value = "tag_value_assigned_to_ec2_resources"
  }

}
