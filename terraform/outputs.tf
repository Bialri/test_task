output "eks_init" {
  value       = "aws eks update-kubeconfig --name test_cluster --region us-west-2"
  description = "Run the following command to connect to the EKS cluster."
}