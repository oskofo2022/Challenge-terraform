#load balancer

resource "aws_lb" "bootcamp-web" {
    load_balancer_type = "application"
    name = "${var.app}-alb"
    security_groups = [ aws_security_group.alb.id ]
    subnets = [ data.aws_subnet.az_a.id, data.aws_subnet.az_b.id ]
}

resource "aws_lb_target_group" "tg" {
    name = "${var.app}-tg"
    port = 80
    vpc_id = data.aws_vpc.default.id
    protocol = "HTTP"

    health_check {
      enabled = true
      port = 80
      path = "/"
      protocol = "HTTP"
      matcher = "200"
    } 
}

# attachement para el servidor 1 y 2

resource "aws_lb_target_group_attachment" "bootcamp-server-1" {
    target_group_arn = aws_lb_target_group.tg.arn
    target_id = aws_instance.bootcamp-server-1.id
    port = 80
  
}

resource "aws_lb_target_group_attachment" "bootcamp-server-2" {
    target_group_arn = aws_lb_target_group.tg.arn
    target_id = aws_instance.bootcamp-server-2.id
    port = 80
}

#listener para el alb
resource "aws_lb_listener" "listen" {
    load_balancer_arn = aws_lb.bootcamp-web.arn
    port = 80

    default_action {
      target_group_arn = aws_lb_target_group.tg.arn
      type = "forward"
    }
  
}