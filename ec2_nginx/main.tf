
resource "aws_instance" "web" {
  ami                    = var.img_id
  instance_type          = var.ins
  count = var.ct
  key_name               = aws_key_pair.key-tf.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "Hello"
  }
 user_data = file("${path.module}/script.sh")

}
output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = "${aws_instance.web.*.public_ip}"
}