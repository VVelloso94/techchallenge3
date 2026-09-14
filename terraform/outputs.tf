output "eks_cluster_endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "rds_auth_endpoint" {
  value = aws_db_instance.auth_db.endpoint
}

output "rds_flag_endpoint" {
  value = aws_db_instance.flag_db.endpoint
}

output "rds_targeting_endpoint" {
  value = aws_db_instance.targeting_db.endpoint
}

output "redis_endpoint" {
  value = aws_elasticache_cluster.redis.cache_nodes[0].address
}

output "sqs_queue_url" {
  value = aws_sqs_queue.techchallenge_queue.id
}

output "ecr_repository_urls" {
  value = { for k, v in aws_ecr_repository.services : k => v.repository_url }
}