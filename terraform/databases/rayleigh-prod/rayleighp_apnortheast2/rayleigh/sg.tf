# Database Security Group
# This security Group needs to be made before creating database
resource "aws_security_group" "rayleigh_aurora" {
  name        = "rayleigh-aurora-${data.terraform_remote_state.vpc.outputs.shard_id}"
  description = "rayleigh Aurora SG"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id
  
  # Not using 3306 for mysql is recommended
  ingress {
    from_port = 3900
    to_port   = 3900 
    protocol  = "tcp"

    security_groups = []

    description = "Aurora whitelist from services."
  }
  
  ingress {
    from_port = 3900
    to_port   = 3900 
    protocol  = "tcp"

    security_groups = []

    description = "Aurora whitelist from xxx-vpc"
  }

  tags = {
    Name = "rayleigh-aurora-${data.terraform_remote_state.vpc.outputs.shard_id}"
  }
}