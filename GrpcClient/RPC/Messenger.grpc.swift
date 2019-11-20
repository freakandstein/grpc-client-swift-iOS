//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: Messenger.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import Dispatch
import Foundation
import SwiftGRPC
import SwiftProtobuf

internal protocol MessengerGetMessageUnaryCall: ClientCallUnary {}

fileprivate final class MessengerGetMessageUnaryCallBase: ClientCallUnaryBase<MessageRequest, MessageResponse>, MessengerGetMessageUnaryCall {
  override class var method: String { return "/Messenger/GetMessageUnary" }
}

internal protocol MessengerGetMessageServerStreamCall: ClientCallServerStreaming {
  /// Do not call this directly, call `receive()` in the protocol extension below instead.
  func _receive(timeout: DispatchTime) throws -> MessageResponse?
  /// Call this to wait for a result. Nonblocking.
  func receive(completion: @escaping (ResultOrRPCError<MessageResponse?>) -> Void) throws
}

internal extension MessengerGetMessageServerStreamCall {
  /// Call this to wait for a result. Blocking.
  func receive(timeout: DispatchTime = .distantFuture) throws -> MessageResponse? { return try self._receive(timeout: timeout) }
}

fileprivate final class MessengerGetMessageServerStreamCallBase: ClientCallServerStreamingBase<MessageRequest, MessageResponse>, MessengerGetMessageServerStreamCall {
  override class var method: String { return "/Messenger/GetMessageServerStream" }
}

internal protocol MessengerGetMessageClientStreamCall: ClientCallClientStreaming {
  /// Send a message to the stream. Nonblocking.
  func send(_ message: MessageRequest, completion: @escaping (Error?) -> Void) throws
  /// Do not call this directly, call `send()` in the protocol extension below instead.
  func _send(_ message: MessageRequest, timeout: DispatchTime) throws

  /// Call this to close the connection and wait for a response. Blocking.
  func closeAndReceive() throws -> MessageResponse
  /// Call this to close the connection and wait for a response. Nonblocking.
  func closeAndReceive(completion: @escaping (ResultOrRPCError<MessageResponse>) -> Void) throws
}

internal extension MessengerGetMessageClientStreamCall {
  /// Send a message to the stream and wait for the send operation to finish. Blocking.
  func send(_ message: MessageRequest, timeout: DispatchTime = .distantFuture) throws { try self._send(message, timeout: timeout) }
}

fileprivate final class MessengerGetMessageClientStreamCallBase: ClientCallClientStreamingBase<MessageRequest, MessageResponse>, MessengerGetMessageClientStreamCall {
  override class var method: String { return "/Messenger/GetMessageClientStream" }
}

internal protocol MessengerGetMessageClientServerStreamCall: ClientCallBidirectionalStreaming {
  /// Do not call this directly, call `receive()` in the protocol extension below instead.
  func _receive(timeout: DispatchTime) throws -> MessageResponse?
  /// Call this to wait for a result. Nonblocking.
  func receive(completion: @escaping (ResultOrRPCError<MessageResponse?>) -> Void) throws

  /// Send a message to the stream. Nonblocking.
  func send(_ message: MessageRequest, completion: @escaping (Error?) -> Void) throws
  /// Do not call this directly, call `send()` in the protocol extension below instead.
  func _send(_ message: MessageRequest, timeout: DispatchTime) throws

  /// Call this to close the sending connection. Blocking.
  func closeSend() throws
  /// Call this to close the sending connection. Nonblocking.
  func closeSend(completion: (() -> Void)?) throws
}

internal extension MessengerGetMessageClientServerStreamCall {
  /// Call this to wait for a result. Blocking.
  func receive(timeout: DispatchTime = .distantFuture) throws -> MessageResponse? { return try self._receive(timeout: timeout) }
}

internal extension MessengerGetMessageClientServerStreamCall {
  /// Send a message to the stream and wait for the send operation to finish. Blocking.
  func send(_ message: MessageRequest, timeout: DispatchTime = .distantFuture) throws { try self._send(message, timeout: timeout) }
}

fileprivate final class MessengerGetMessageClientServerStreamCallBase: ClientCallBidirectionalStreamingBase<MessageRequest, MessageResponse>, MessengerGetMessageClientServerStreamCall {
  override class var method: String { return "/Messenger/GetMessageClientServerStream" }
}


/// Instantiate MessengerServiceClient, then call methods of this protocol to make API calls.
internal protocol MessengerService: ServiceClient {
  /// Synchronous. Unary.
  func getMessageUnary(_ request: MessageRequest, metadata customMetadata: Metadata) throws -> MessageResponse
  /// Asynchronous. Unary.
  @discardableResult
  func getMessageUnary(_ request: MessageRequest, metadata customMetadata: Metadata, completion: @escaping (MessageResponse?, CallResult) -> Void) throws -> MessengerGetMessageUnaryCall

  /// Asynchronous. Server-streaming.
  /// Send the initial message.
  /// Use methods on the returned object to get streamed responses.
  func getMessageServerStream(_ request: MessageRequest, metadata customMetadata: Metadata, completion: ((CallResult) -> Void)?) throws -> MessengerGetMessageServerStreamCall

  /// Asynchronous. Client-streaming.
  /// Use methods on the returned object to stream messages and
  /// to close the connection and wait for a final response.
  func getMessageClientStream(metadata customMetadata: Metadata, completion: ((CallResult) -> Void)?) throws -> MessengerGetMessageClientStreamCall

  /// Asynchronous. Bidirectional-streaming.
  /// Use methods on the returned object to stream messages,
  /// to wait for replies, and to close the connection.
  func getMessageClientServerStream(metadata customMetadata: Metadata, completion: ((CallResult) -> Void)?) throws -> MessengerGetMessageClientServerStreamCall

}

internal extension MessengerService {
  /// Synchronous. Unary.
  func getMessageUnary(_ request: MessageRequest) throws -> MessageResponse {
    return try self.getMessageUnary(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func getMessageUnary(_ request: MessageRequest, completion: @escaping (MessageResponse?, CallResult) -> Void) throws -> MessengerGetMessageUnaryCall {
    return try self.getMessageUnary(request, metadata: self.metadata, completion: completion)
  }

  /// Asynchronous. Server-streaming.
  func getMessageServerStream(_ request: MessageRequest, completion: ((CallResult) -> Void)?) throws -> MessengerGetMessageServerStreamCall {
    return try self.getMessageServerStream(request, metadata: self.metadata, completion: completion)
  }

  /// Asynchronous. Client-streaming.
  func getMessageClientStream(completion: ((CallResult) -> Void)?) throws -> MessengerGetMessageClientStreamCall {
    return try self.getMessageClientStream(metadata: self.metadata, completion: completion)
  }

  /// Asynchronous. Bidirectional-streaming.
  func getMessageClientServerStream(completion: ((CallResult) -> Void)?) throws -> MessengerGetMessageClientServerStreamCall {
    return try self.getMessageClientServerStream(metadata: self.metadata, completion: completion)
  }

}

internal final class MessengerServiceClient: ServiceClientBase, MessengerService {
  /// Synchronous. Unary.
  internal func getMessageUnary(_ request: MessageRequest, metadata customMetadata: Metadata) throws -> MessageResponse {
    return try MessengerGetMessageUnaryCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func getMessageUnary(_ request: MessageRequest, metadata customMetadata: Metadata, completion: @escaping (MessageResponse?, CallResult) -> Void) throws -> MessengerGetMessageUnaryCall {
    return try MessengerGetMessageUnaryCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Asynchronous. Server-streaming.
  /// Send the initial message.
  /// Use methods on the returned object to get streamed responses.
  internal func getMessageServerStream(_ request: MessageRequest, metadata customMetadata: Metadata, completion: ((CallResult) -> Void)?) throws -> MessengerGetMessageServerStreamCall {
    return try MessengerGetMessageServerStreamCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Asynchronous. Client-streaming.
  /// Use methods on the returned object to stream messages and
  /// to close the connection and wait for a final response.
  internal func getMessageClientStream(metadata customMetadata: Metadata, completion: ((CallResult) -> Void)?) throws -> MessengerGetMessageClientStreamCall {
    return try MessengerGetMessageClientStreamCallBase(channel)
      .start(metadata: customMetadata, completion: completion)
  }

  /// Asynchronous. Bidirectional-streaming.
  /// Use methods on the returned object to stream messages,
  /// to wait for replies, and to close the connection.
  internal func getMessageClientServerStream(metadata customMetadata: Metadata, completion: ((CallResult) -> Void)?) throws -> MessengerGetMessageClientServerStreamCall {
    return try MessengerGetMessageClientServerStreamCallBase(channel)
      .start(metadata: customMetadata, completion: completion)
  }

}

/// To build a server, implement a class that conforms to this protocol.
/// If one of the methods returning `ServerStatus?` returns nil,
/// it is expected that you have already returned a status to the client by means of `session.close`.
internal protocol MessengerProvider: ServiceProvider {
  func getMessageUnary(request: MessageRequest, session: MessengerGetMessageUnarySession) throws -> MessageResponse
  func getMessageServerStream(request: MessageRequest, session: MessengerGetMessageServerStreamSession) throws -> ServerStatus?
  func getMessageClientStream(session: MessengerGetMessageClientStreamSession) throws -> MessageResponse?
  func getMessageClientServerStream(session: MessengerGetMessageClientServerStreamSession) throws -> ServerStatus?
}

extension MessengerProvider {
  internal var serviceName: String { return "Messenger" }

  /// Determines and calls the appropriate request handler, depending on the request's method.
  /// Throws `HandleMethodError.unknownMethod` for methods not handled by this service.
  internal func handleMethod(_ method: String, handler: Handler) throws -> ServerStatus? {
    switch method {
    case "/Messenger/GetMessageUnary":
      return try MessengerGetMessageUnarySessionBase(
        handler: handler,
        providerBlock: { try self.getMessageUnary(request: $0, session: $1 as! MessengerGetMessageUnarySessionBase) })
          .run()
    case "/Messenger/GetMessageServerStream":
      return try MessengerGetMessageServerStreamSessionBase(
        handler: handler,
        providerBlock: { try self.getMessageServerStream(request: $0, session: $1 as! MessengerGetMessageServerStreamSessionBase) })
          .run()
    case "/Messenger/GetMessageClientStream":
      return try MessengerGetMessageClientStreamSessionBase(
        handler: handler,
        providerBlock: { try self.getMessageClientStream(session: $0 as! MessengerGetMessageClientStreamSessionBase) })
          .run()
    case "/Messenger/GetMessageClientServerStream":
      return try MessengerGetMessageClientServerStreamSessionBase(
        handler: handler,
        providerBlock: { try self.getMessageClientServerStream(session: $0 as! MessengerGetMessageClientServerStreamSessionBase) })
          .run()
    default:
      throw HandleMethodError.unknownMethod
    }
  }
}

internal protocol MessengerGetMessageUnarySession: ServerSessionUnary {}

fileprivate final class MessengerGetMessageUnarySessionBase: ServerSessionUnaryBase<MessageRequest, MessageResponse>, MessengerGetMessageUnarySession {}

internal protocol MessengerGetMessageServerStreamSession: ServerSessionServerStreaming {
  /// Send a message to the stream. Nonblocking.
  func send(_ message: MessageResponse, completion: @escaping (Error?) -> Void) throws
  /// Do not call this directly, call `send()` in the protocol extension below instead.
  func _send(_ message: MessageResponse, timeout: DispatchTime) throws

  /// Close the connection and send the status. Non-blocking.
  /// This method should be called if and only if your request handler returns a nil value instead of a server status;
  /// otherwise SwiftGRPC will take care of sending the status for you.
  func close(withStatus status: ServerStatus, completion: (() -> Void)?) throws
}

internal extension MessengerGetMessageServerStreamSession {
  /// Send a message to the stream and wait for the send operation to finish. Blocking.
  func send(_ message: MessageResponse, timeout: DispatchTime = .distantFuture) throws { try self._send(message, timeout: timeout) }
}

fileprivate final class MessengerGetMessageServerStreamSessionBase: ServerSessionServerStreamingBase<MessageRequest, MessageResponse>, MessengerGetMessageServerStreamSession {}

internal protocol MessengerGetMessageClientStreamSession: ServerSessionClientStreaming {
  /// Do not call this directly, call `receive()` in the protocol extension below instead.
  func _receive(timeout: DispatchTime) throws -> MessageRequest?
  /// Call this to wait for a result. Nonblocking.
  func receive(completion: @escaping (ResultOrRPCError<MessageRequest?>) -> Void) throws

  /// Exactly one of these two methods should be called if and only if your request handler returns nil;
  /// otherwise SwiftGRPC will take care of sending the response and status for you.
  /// Close the connection and send a single result. Non-blocking.
  func sendAndClose(response: MessageResponse, status: ServerStatus, completion: (() -> Void)?) throws
  /// Close the connection and send an error. Non-blocking.
  /// Use this method if you encountered an error that makes it impossible to send a response.
  /// Accordingly, it does not make sense to call this method with a status of `.ok`.
  func sendErrorAndClose(status: ServerStatus, completion: (() -> Void)?) throws
}

internal extension MessengerGetMessageClientStreamSession {
  /// Call this to wait for a result. Blocking.
  func receive(timeout: DispatchTime = .distantFuture) throws -> MessageRequest? { return try self._receive(timeout: timeout) }
}

fileprivate final class MessengerGetMessageClientStreamSessionBase: ServerSessionClientStreamingBase<MessageRequest, MessageResponse>, MessengerGetMessageClientStreamSession {}

internal protocol MessengerGetMessageClientServerStreamSession: ServerSessionBidirectionalStreaming {
  /// Do not call this directly, call `receive()` in the protocol extension below instead.
  func _receive(timeout: DispatchTime) throws -> MessageRequest?
  /// Call this to wait for a result. Nonblocking.
  func receive(completion: @escaping (ResultOrRPCError<MessageRequest?>) -> Void) throws

  /// Send a message to the stream. Nonblocking.
  func send(_ message: MessageResponse, completion: @escaping (Error?) -> Void) throws
  /// Do not call this directly, call `send()` in the protocol extension below instead.
  func _send(_ message: MessageResponse, timeout: DispatchTime) throws

  /// Close the connection and send the status. Non-blocking.
  /// This method should be called if and only if your request handler returns a nil value instead of a server status;
  /// otherwise SwiftGRPC will take care of sending the status for you.
  func close(withStatus status: ServerStatus, completion: (() -> Void)?) throws
}

internal extension MessengerGetMessageClientServerStreamSession {
  /// Call this to wait for a result. Blocking.
  func receive(timeout: DispatchTime = .distantFuture) throws -> MessageRequest? { return try self._receive(timeout: timeout) }
}

internal extension MessengerGetMessageClientServerStreamSession {
  /// Send a message to the stream and wait for the send operation to finish. Blocking.
  func send(_ message: MessageResponse, timeout: DispatchTime = .distantFuture) throws { try self._send(message, timeout: timeout) }
}

fileprivate final class MessengerGetMessageClientServerStreamSessionBase: ServerSessionBidirectionalStreamingBase<MessageRequest, MessageResponse>, MessengerGetMessageClientServerStreamSession {}
