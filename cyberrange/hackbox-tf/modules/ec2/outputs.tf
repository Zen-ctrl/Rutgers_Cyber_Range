output "instance_id" {
    value = { for k, v in aws_instance.this : k => v ["id"] }
}

output "private_ip" {
    value = { for k, v in aws_instance.this : k => v ["private_ip"] }
}

output "public_ip" {
    value = { for k, v in aws_instance.this : k => v ["public_ip"] }
}

output "password_data" {
    value = { for k, v in aws_instance.this : k => v ["password_data"] }
}