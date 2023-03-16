resource "aws_db_option_group"  "db_opt_gr" {
    name                        = var.aws_db_option_group_name
    option_group_description    = var.description 
    engine_name                 = var.engine 
    major_engine_version        = var.major_engine_version
}