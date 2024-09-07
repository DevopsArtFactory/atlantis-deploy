# VPC - use these parameters to create new VPC resources
# 10.0.0.0 - 10.255.255.255 (10/8 접두사)	
# 172.16.0.0 - 172.31.255.255 (172.16/12 접두사)	
# 192.168.0.0 - 192.168.255.255 (192.168/16 접두사)	
cidr = "192.168.0.0/16"

azs = ["ap-northeast-2a", "ap-northeast-2c"]

private_subnets = ["192.168.1.0/24", "192.168.2.0/24"]

public_subnets = ["192.168.11.0/24", "192.168.12.0/24"]

# VPC - use these parameters to use existing VPC resources
# vpc_id = "vpc-1651acf1"
# private_subnet_ids = ["subnet-1fe3d837", "subnet-129d66ab"]
# public_subnet_ids = ["subnet-1211eef5", "subnet-163466ab"]

# DNS
route53_zone_name = ""
route53_zone_id   = ""

# ACM (SSL certificate)
# Specify ARN of an existing certificate or new one will be created and validated using Route53 DNS:
certificate_arn = ""

# ECS Service and Task
ecs_service_assign_public_ip = true

# Atlantis
atlantis_allowed_repo_names = [""]
atlantis_repo_whitelist     = ["github.com/<Org or YourUserName>/*"]

# Specify one of the following block.
# For Github
atlantis_github_user = ""

# For Gitlab
atlantis_gitlab_user       = ""
atlantis_gitlab_user_token = ""

# For Bitbucket
atlantis_bitbucket_user       = ""
atlantis_bitbucket_user_token = ""

# For Bitbucket on prem (Stash)
# atlantis_bitbucket_base_url = ""

# Tags
tags = {
  Name = "atlantis"
}
