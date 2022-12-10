FROM node:18.12.1-bullseye-slim

RUN apt update
RUN npm install --global @cyclonedx/cyclonedx-npm

COPY gen_sbom.sh /build/gen_sbom.sh

WORKDIR /build
ENTRYPOINT ["./gen_sbom.sh", "-h"]