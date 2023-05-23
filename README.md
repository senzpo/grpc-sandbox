# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Generate API only project

```rails new project-name-here --api --database=postgresql```

## Add grpc support

```
gem install grpc
gem install grpc-tools
```

## add protos

protos/marketplace.proto

```
grpc_tools_ruby_protoc -I /market/app/grpc --ruby_out=/market/app/grpc --grpc_out=/market/app/grpc /market/app/grpc/marketplace.proto
```

ruby server.rb

Market::Marketplace::Stub.new 'localhost:50051', :this_port_is_insecure

bin/rails runner lib/server.rb

```
rails generate model product name:string description:text promo_text:text country:text lang:text price:decimal category:string user_id:bigint ext_id:bigint
```

Client:

stub = Marketplace::Service.rpc_stub_class.new 'localhost:50051', :this_channel_is_insecure

stub.get_product(Marketplace::Identity.new(id: 1))