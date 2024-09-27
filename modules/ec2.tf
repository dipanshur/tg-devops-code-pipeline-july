resource "aws_instance" "this" {
    for_each = var.ec2_attributes
    
    ami = each.value.ami
    instance_type = each.value.instance_type
    key_name = each.value.key_name
    tags = each.value.tags
    security_groups = [ aws_security_group.this.id ]
    
  
}

