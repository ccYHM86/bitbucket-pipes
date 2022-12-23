FROM node:18.12.1-bullseye-slim

RUN apt update

COPY gen_sbom.sh /opt/gen_sbom.sh

ENV PATH="/opt:${PATH}"

WORKDIR /build
ENTRYPOINT ["gen_sbom.sh"]