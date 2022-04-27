resource "aws_budgets_budget" "monthly_forecasted_general_cost" {
  name         = "Monthly Forecasted General Cost"
  budget_type  = "COST"
  limit_amount = 3
  limit_unit   = "USD"
  time_unit    = "MONTHLY"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 60
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = [var.budget_email]
  }
}
