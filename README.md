# hellocuda-go

A simple GO class which starts webserver and runs https://github.com/kubernetes/kubernetes/tree/v1.18.2/test/images/cuda-vector-add with every request.

Docker image available at https://hub.docker.com/r/mvinkler/hellocuda-go

Instructions how to run the service on OCP 4.4 in AWS:
1. Start OCP 4.4 with at least one GPU node (p2.xlarge flavor), install NFD Operator from OperatorHub.
 - see https://www.openshift.com/blog/creating-a-gpu-enabled-node-with-openshift-4-2-in-amazon-ec2 
2. Add a cluster-wide entitlement via a Kubernetes secret.
 - see https://www.openshift.com/blog/how-to-use-entitled-image-builds-to-build-drivercontainers-with-ubi-on-openshift 
   - section "Cluster-Wide Entitled Builds on OpenShift" 
3. Install NVIDIA GPU Operator via helm (will be available in OperatorHub) 
 - see https://www.openshift.com/blog/simplifying-deployments-of-accelerated-ai-workloads-on-red-hat-openshift-with-nvidia-gpu-operator
 - latest working version is 1.1.5
4. Apply hellocuda-go.yaml
5. Access the exposed service, i.e. something like `curl http://hellocuda-go.default.apps.your.cluster.name.com`
