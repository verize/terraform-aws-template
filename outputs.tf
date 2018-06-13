# Output Configuration
output "address" {
  value = "${aws_instance.web.private_ip}"
}

output "public_ip" {
  value = "${aws_eip.web-eip.public_ip}"
}
