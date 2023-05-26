FROM linuxserver/ffmpeg:latest

RUN apt-get update && apt-get install -y fonts-dejavu jq

COPY execute.sh .
COPY check.sh .
ENTRYPOINT ["/usr/bin/env"]
CMD [ "/bin/bash", "execute.sh" ]