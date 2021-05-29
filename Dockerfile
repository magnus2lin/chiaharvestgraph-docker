FROM ubuntu as upgraded_ubuntu
RUN apt update
RUN apt upgrade -y

FROM upgraded_ubuntu as builder
RUN apt install -y git make gcc
RUN git clone https://github.com/stolk/chiaharvestgraph.git
RUN cd chiaharvestgraph && make && cd ..

FROM upgraded_ubuntu
RUN DEBIAN_FRONTEND=noninteractive apt install -y tzdata dumb-init
RUN useradd chiaharvestgraphuser
RUN mkdir /chiaharvestgraph
COPY --from=builder /chiaharvestgraph/chiaharvestgraph /chiaharvestgraph/chiaharvestgraph

USER chiaharvestgraphuser
WORKDIR /chiaharvestgraph
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/chiaharvestgraph/chiaharvestgraph","/chia_log"]

