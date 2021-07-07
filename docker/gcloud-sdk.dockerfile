FROM ubuntu:20.04

# install prerequisites
RUN apt-get update -q && apt-get install -q -y curl apt-transport-https ca-certificates gnupg
# install gcloud, taken from https://cloud.google.com/sdk/docs/install#deb
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" \
  | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
  && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
  | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - \
  && apt-get update -y && apt-get install google-cloud-sdk -y
      

# by creating a dev user I can directly use this image in devcontainers
RUN adduser --disabled-password --gecos "" --no-create-home dev
