output "db_address" {
  description = "The address of the database."
  value       =  aws_db_address
}

output "db_port" {
  description = "The port of the database service."
  value       = aws_db_port
}

output  "option_group_id"  {
    description  = "The db option group id"
    value        = aws_db_option_group.db_gr.id
}

output  "db_option_group_arn"  {
    description  = "The ARN of the db option group"
    value        = aws_db_option_group.db_opt_gr.arn
}

output  "subnet_group_id"  {
    value        = aws_db_subnet_group.db_sg.id
}