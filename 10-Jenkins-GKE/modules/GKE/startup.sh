gcloud container clusters get-credentials $CLUSTER --region us-central1-a
kubectl apply -f deployment.yaml
