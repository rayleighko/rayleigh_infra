aws_region = "ap-northeast-2"
cidr_numeral = "10"

# Please change "perpick" to what you want to use
# d after name indicates develop. This means that perpickd_apnortheast2 VPC is for development environment VPC in Seoul Region.
vpc_name = "perpickd_apnortheast2"

# Billing tag in this VPC 
billing_tag = "dev"

# Availability Zone list
availability_zones = ["ap-northeast-2a","ap-northeast-2c"]

# In Seoul Region, some resources are not supported in ap-northeast-2b
availability_zones_without_b = ["ap-northeast-2a","ap-northeast-2c"]

# shard_id will be used later when creating other resources.
# With shard_id, you could distinguish which environment the resource belongs to 
shard_id = "perpickdapne2"
shard_short_id = "perpick01d"

# d means develop
env_suffix = "d"

# VPC Peering Connection Variables
# vpc_peer_connection_id_perpickp_apne2 = "pcx-0b3fe05474643ae1f"
# perpickp_destination_cidr_block = "10.20.0.0/16"