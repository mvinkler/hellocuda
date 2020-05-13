# https://github.com/kubernetes/kubernetes/blob/v1.18.2/test/images/cuda-vector-add/Dockerfile
FROM nvidia/cuda:10.0-devel-ubuntu18.04

RUN apt-get update && apt-get install -y --no-install-recommends \
        cuda-samples-$CUDA_PKG_VERSION && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/cuda/samples/0_Simple/vectorAdd
RUN make

# Copy the local package files to the container.
ADD ./hellocuda /go/bin/

# Run the hellocuda command by default when the container starts.
CMD ["/go/bin/hellocuda"]

# Document that the service listens on port 8080.
EXPOSE 8080
