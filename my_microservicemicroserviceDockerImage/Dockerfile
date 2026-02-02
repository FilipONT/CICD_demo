# Dockerfile for image: my_microservice
# 
# Sample docker build command:
# docker build -f "Dockerfile" -t my_microservice "."

FROM matlabruntime/r2025b/release/update0/108000000000000000

RUN apt-get update && apt-get upgrade -y

COPY ./applicationFilesForMATLABCompiler /usr/bin/mlrtapp
RUN chmod -R a+rX /usr/bin/mlrtapp/*

RUN if ["$(getent passwd appuser | cut -d: -f1)" = ""] ; then useradd -ms /bin/bash appuser ; fi
USER appuser

ENTRYPOINT ["/opt/matlabruntime/R2025b/bin/glnxa64/muserve", "-a", "/usr/bin/mlrtapp/myArchive.ctf"]
