FROM linuxserver/ffmpeg:latest

RUN apt-get update && apt-get install -y fonts-dejavu

COPY execute.sh .
ENTRYPOINT ["/usr/bin/env"]
CMD [ "/bin/bash", "execute.sh" ]