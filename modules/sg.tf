resource "aws_security_group" "this" {
    name = "test-sg-dynamic"
    description = "test-sg-dynamic"

    vpc_id = aws_vpc.this.id

    dynamic "ingress" {
        for_each = var.sg_ingress
        content {
          from_port = ingress.value.from_port
          to_port   = ingress.value.to_port
          protocol  = ingress.value.protocol
          cidr_blocks = ingress.value.cidr_blocks
        }
      
    }

    dynamic "egress" {
      for_each = var.sg_egress
      content {
        from_port = egress.value.from_port
        to_port   = egress.value.to_port
        protocol  = egress.value.protocol
        cidr_blocks = egress.value.cidr_blocks
      }
    }
  
}