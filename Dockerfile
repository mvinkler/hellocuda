# https://github.com/kubernetes/kubernetes/blob/master/test/images/cuda-vector-add/Dockerfile
FROM k8s.gcr.io/cuda-vector-add:v0.1

# Copy the local package files to the container.
ADD ./hellocuda /go/bin/

# Run the hellocuda command by default when the container starts.
CMD ["/go/bin/hellocuda"]

# Document that the service listens on port 8080.
EXPOSE 8080