resource "aws_alb" "tableau_lb" {
  depends_on = [module.sg_tableau_lb]

  name               = "tableau-lb"
  internal           = true
  load_balancer_type = "application"
  # load_balancer_type = "network"
  security_groups            = [module.sg_tableau_lb.security_group_id]
  subnets                    = values(local.private_subnets_info)
  enable_deletion_protection = false

  tags = {
    Name          = format("%s-%s-%s-tableau_lb", local.environment, local.project_name, local.generated_str),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
  }
}

resource "aws_lb_target_group" "tableau_lb_tg_http" {
  name     = "tableau-lb-tg"
  port     = 80
  protocol = "HTTP"
  # protocol = "TCP"
  vpc_id = local.vpc_id

  tags = {
    Name          = format("%s-%s-%s-tableau_lb_target_group", local.environment, local.project_name, local.generated_str),
    created_by    = local.created_by,
    generated_via = local.generated_via,
    environment   = local.environment,
    project_name  = local.project_name
  }
}

resource "aws_lb_target_group_attachment" "tableau_lb_tg_http_attachment" {
  depends_on = [
    aws_lb_target_group.tableau_lb_tg_http,
    module.ec2_tableau
  ]

  count = length(local.list_of_existing_tableau_instance_id)

  target_group_arn = aws_lb_target_group.tableau_lb_tg_http.arn
  target_id        = local.list_of_existing_tableau_instance_id[count.index]
  port             = 80
}

resource "aws_lb_listener" "tableau_lb_listener" {
  depends_on = [
    aws_alb.tableau_lb,
    aws_lb_target_group.tableau_lb_tg_http
  ]

  load_balancer_arn = aws_alb.tableau_lb.arn
  port              = 80
  protocol          = "HTTP"
  # protocol = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tableau_lb_tg_http.arn
  }
}

resource "aws_lb_listener_rule" "tableau_lb_listener_rule" {
  depends_on = [
    aws_lb_listener.tableau_lb_listener,
    aws_lb_target_group.tableau_lb_tg_http
  ]

  listener_arn = aws_lb_listener.tableau_lb_listener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tableau_lb_tg_http.arn
  }

  condition {
    path_pattern {
      values = ["/"]
    }
  }
}
