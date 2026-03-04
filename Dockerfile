FROM crystallang/crystal:1.19-alpine

WORKDIR /src

COPY . .

RUN shards install
RUN crystal build src/chat.cr --release --static --no-debug -o ./chat

EXPOSE 9090

CMD ["./chat"]