output "Instance_Info" {

    value = aws_instance.expense
  
}

output "public_ip" {

    value = aws_instance.expense.public_ip
  
}

output "private_ip" {

    value = aws_instance.expense.private_ip
  
}