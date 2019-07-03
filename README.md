# hellocuda-go

A simple GO class which starts webserver and runs https://github.com/kubernetes/kubernetes/tree/v1.7.11/test/images/nvidia-cuda with every request.

Docker image available at https://hub.docker.com/r/mvinkler/hellocuda-go

Instructions how to run the service on OCP 4.1 in AWS:
1. Start OCP 4.1.3 with at least one GPU node (p2.xlarge flavor), install knative-serving
2. Deploy https://github.com/openshift/cluster-nfd-operator
3. Deploy https://github.com/zvonkok/special-resource-operator
- Your OCP needs to use kernel v410.79-4.18.0-80.4.2.el8_0.x86_64 (i.e. OCP 4.1.3), see available images here https://quay.io/repository/zvonkok/nvidia-driver?tab=tags
4. Apply hellocuda-go.yaml
5. Access the exposed service, i.e. something like `curl http://hellocuda-go.default.apps.your.cluster.name.com`
