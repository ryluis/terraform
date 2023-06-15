resource "random_string" "rand_str" {
  length  = 7
  special = false
}

resource "random_string" "rds_instance_name_str" {
  length  = 7
  special = false
  upper   = false
}

resource "random_string" "rds_password_str" {
  length           = 30
  special          = true
  min_numeric      = 1
  min_upper        = 1
  override_special = "~!#$%&*()-_=+[]{}<>:?"
  ## do not include these character '/', '@', '"', '^'
}