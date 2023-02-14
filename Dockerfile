#shiny base image (amd64 architecture) + install python & pip
FROM --platform=linux/amd64 rocker/shiny-verse:4.2.2
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip

#copy from source -> container
COPY ./src ./src

#install packages
RUN Rscript ./src/requirements.R
RUN pip3 install -r ./src/requirements.txt
