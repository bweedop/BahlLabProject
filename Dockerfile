FROM ubuntu:18.04

MAINTAINER K. Bodie Weedop <kbweedop@gmail.com>

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y build-essential wget && \
    cd /usr/local/ && \
    wget -O  standard-RAxML-8.2.12.tar.gz https://github.com/stamatak/standard-RAxML/archive/v8.2.12.tar.gz && \
    tar -xzvf standard-RAxML-8.2.12.tar.gz && \
    rm -rf standard-RAxML-8.2.12.tar.gz && \
    cd standard-RAxML-8.2.12 && \
    make -f Makefile.SSE3.PTHREADS.gcc && \
    rm *.o && \
    mv raxmlHPC-PTHREADS-SSE3 /usr/local/bin/raxmlHPC && \
    cd /usr/local && \
    rm -rf /usr/local/standard-RAxML-8.2.12

ENTRYPOINT ["/usr/local/bin/raxmlHPC"]