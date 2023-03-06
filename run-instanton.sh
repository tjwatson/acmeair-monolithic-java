docker run -it \
  --cap-add CHECKPOINT_RESTORE \
  --cap-add SETPCAP \
  --security-opt seccomp=unconfined \
  -p 9080:9080 \
  acmeair-mono-app-minimal-instanton

