resource "aws_instance" "bootcamp-server-1" {
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    subnet_id = data.aws_subnet.az_a.id
    vpc_security_group_ids = [ aws_security_group.grupo_seguridad_grupo1.id ]
    tags = {
      "Name" = "${var.app}-server"
    }
    user_data = <<EOF
#! /bin/bash
sudo yum update -y
sudo yum install -y zip git
sudo amazon-linux-extras install nginx1 -y
sudo systemctl enable nginx
sudo systemctl start nginx
git clone https://github.com/roxsross/front-devops-github.git
sudo mv front-devops-github/* /usr/share/nginx/html
sudo systemctl restart nginx
EOF
}

resource "aws_instance" "bootcamp-server-2" {
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    subnet_id = data.aws_subnet.az_b.id
    vpc_security_group_ids = [ aws_security_group.grupo_seguridad_grupo1.id ]
    tags = {
      "Name" = "${var.app}-server"
    }
    user_data = <<EOF
#! /bin/bash
#! /bin/bash
sudo yum update -y
sudo yum install -y zip git
sudo amazon-linux-extras install nginx1 -y
sudo systemctl enable nginx
sudo systemctl start nginx
git clone https://github.com/roxsross/front-devops-github.git
sudo mv front-devops-github/* /usr/share/nginx/html
sudo systemctl restart nginx
EOF
}