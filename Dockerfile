FROM crystallang/crystal:1.20.0-dev

WORKDIR /src

COPY shard.yml shard.lock /src/
RUN shards install

COPY . .

RUN crystal build app/chat.cr --release

CMD ["./chat"]