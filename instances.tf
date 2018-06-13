#Security Groups

resource "aws_eip" "web-eip" {
  vpc = true

  lifecycle {
    create_before_destroy = true
  }
}

# Our default security group to access
# the instances over SSH and HTTP
resource "aws_security_group" "web-sg" {
  description = "Allow HTTP and SSH"

  ingress {
    from_port   = "${var.server_port}"
    to_port     = "${var.server_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name    = "terraform-sg"
  }

  lifecycle {
    create_before_destroy = true
  }
}

#Instances
resource "aws_instance" "web" {
  ami                    = "ami-1960d164"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.web-sg.id}"]
  key_name               = "${var.key_name}"

  # We run a remote provisioner on the instance after creating it.
  # In this case, we just install nginx and start it. By default,
  # this should be on port 80
  user_data = "${file("userdata.sh")}"

  tags {
    Name    = "terraform-instance"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_eip_association" "proxy_eip" {
  instance_id   = "${aws_instance.web.id}"
  allocation_id = "${aws_eip.web-eip.id}"

  lifecycle {
    create_before_destroy = true
  }
}
