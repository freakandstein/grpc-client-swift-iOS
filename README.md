# gRPC Client in Swift iOS (gRPC-client-swift-iOS)

gRPC is a modern open source high performance RPC framework that can run in any environment. It can efficiently connect services in and across data centers with pluggable support for load balancing, tracing, health checking and authentication. It is also applicable in last mile of distributed computing to connect devices, mobile applications and browsers to backend services.[https://grpc.io].

Before we start, better we prepare for how to know to install gRPC for Swift. Ok let's do it...

## Installation gRPC for Swift
1. Install Protobuf first for Swift with ```brew``` command in your Mac terminal ```brew install swift-protobuf ```
2. Install gRPC for Swift with goes to [gRPC Swift](https://github.com/grpc/grpc-swift/tree/nio) repository and following the README
3. Install plugins `protoc-gen-swift` and `protoc-gen-swiftgrpc`. For `protoc-gen-swift` is responsible to generate `.proto` file to Swift (not include RPC). `proton-gen-swiftgrpc` is responsible to generate `.proto` file to Swift (with RPCs)
4. Copy `protoc-gen-swift` and `protoc-gen-swiftgrpc` plugins into path where the `protoc` was exist

After we installed successfully, we are supposed to be able generate anything file `.proto` to Swift included gRPC. For the instance, you may try the command `protoc swift_out=. --swiftgrpc_out=. your.proto`. Then you can see 2 files with type file is Swift (`your.grpc.swift` and `your.pb.swift`) in your current location. Otherwise, there is an incorrect from you installation steps.
If you did, congrats to you.  Finally we can truly to start with `git clone` first for this source code.

The purpose of source code i wrote to show how to use 4 kind of RPC types in Swift iOS. The RPC types such as: 

1. Unary Call
2. Client Stream
3. Server Stream
4. Client Server Stream (Bidirectional).

You may see our repository [gRPC Server in Java](https://github.com/freakandstein/grpc-server-java) again to remind what of definitions from those RPCs

## Scenario
1. I tried to integrate Realm Swift with gRPC on Server Stream and Client Server Stream (Bidirectional) RPC. I assumed the scenario was iOS receives data update from server and from iOS side will be updated for the data. Currently I just want to show how we can integrate Realm Swift with gRPC
