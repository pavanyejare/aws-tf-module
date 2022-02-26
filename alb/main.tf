resource "aws_lb" "alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.alb_sg
  subnets            = var.subent

  enable_deletion_protection = false

  tags = var.tag
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.port
  protocol          = var.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.group.arn
  }
}

resource "aws_lb_target_group" "group" {
  name        = var.target_group_name
  port        = var.target_port
  protocol    = var.target_protocol
  vpc_id      = var.vpc_id
  target_type = "ip"
  tags        = var.tag
}


