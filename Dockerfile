# Declare the alpine linux base image
FROM gcr.io/crucial-context-284219/docker-kdb:3.6-20190402

MAINTAINER Jingran Dai

# Ensure we have your our zipped version of q for linux in the same folder as this Dockerfile, and copy it
COPY q wwc/q/.
RUN mkdir wwc/data

ENV APPHOME /wwc
ENV APPPORT 4000

RUN cd wwc


