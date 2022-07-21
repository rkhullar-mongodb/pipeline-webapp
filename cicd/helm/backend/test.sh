helm repo add "$HELM_ORG" "$HELM_URL"

helm install --dry-run --debug -f stage.yaml                                                            \
  --set image.repository="${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/pipeline-webapp-backend"   \
  --set image.tag=feature-pilot                                                                         \
  --set image.pullSecret="${ECR_LOGIN_SECRET_NAME}"                                                     \
  --set env.AWS_REGION="${AWS_REGION}"                                                                  \
  --set 'ingress.hosts[0]'="${BACKEND_HOST}"                                                            \
  pipeline-backend "${HELM_ORG}/${HELM_CHART}"

helm install -f stage.yaml                                                                              \
  --set image.repository="${AWS_ACCOUNT}.dkr.ecr.${AWS_REGION}.amazonaws.com/pipeline-webapp-backend"   \
  --set image.tag=feature-pilot                                                                         \
  --set image.pullSecret="${ECR_LOGIN_SECRET_NAME}"                                                     \
  --set env.AWS_REGION="${AWS_REGION}"                                                                  \
  --set 'ingress.hosts[0]'="${BACKEND_HOST}"                                                            \
  pipeline-backend "${HELM_ORG}/${HELM_CHART}"
