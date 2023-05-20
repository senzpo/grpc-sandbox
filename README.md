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
grpc_tools_ruby_protoc -I /market/config/protos --ruby_out=/market/lib --grpc_out=/market/lib /market/config/protos/marketplace.proto
```