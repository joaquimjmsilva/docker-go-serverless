ARG golang_version="1.14"

FROM golang:${golang_version}

ARG nodejs_version="12"
ARG serverless_version="1.65.0"

RUN apt-get -y update && \
    apt-get -y install git curl && \
    curl -sL "https://deb.nodesource.com/setup_${nodejs_version}.x" | bash && \
    apt-get -y update && \
    apt-get -y install nodejs && \
    rm -rf /var/lib/apt/lists/*

RUN npm i -g serverless@${serverless_version}

RUN go get -u github.com/golang/dep/cmd/dep
