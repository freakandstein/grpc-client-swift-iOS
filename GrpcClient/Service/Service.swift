//
//  MessengerService.swift
//  GrpcClient
//
//  Created by Satrio Wicaksono on 20/09/19.
//  Copyright © 2019 Satrio Wicaksono. All rights reserved.
//

import Foundation
import SwiftGRPC
import RealmSwift

class Service {
    
    static let shared = Service()
    private let address = "127.0.0.1:8080"
    private var clientService: MessengerServiceClient?
    private var serverStreamCall: MessengerGetMessageServerStreamCall?
    private var clientStreamCall: MessengerGetMessageClientStreamCall?
    private var clientServerStreamCall: MessengerGetMessageClientServerStreamCall?
    private var salesType: SalesType? // Model to test saving data in Realm during stream from server is active

    init() {
        salesType = SalesTypeHelper.getById(id: 1)
        if clientService == nil {
            clientService = MessengerServiceClient(address: address, secure: false)
            print("GRPC version \(gRPC.version) - endpoint: \(address)")
        }
    }
    
    /**
        Request Get with send **text** as parameter.
        Type request is Unary Call. What we send  will be received back from server
        - Parameter text: String
     */
    func requestGetUnary(text: String) throws {
        var requestMessage = MessageRequest()
        requestMessage.text = text
        _ = try clientService?.getMessageUnary(requestMessage, completion: { (response, callResult) in
            if let response = response {
                print("Response : \(response.text)")
            } else {
                print("No response data")
            }
        })
    }
    
    /**
        Request Get Server Stream Call with send **text** as parameter.
        Type request is Server Stream Call. What we send will be received back from server as stream
        - Parameter text: String
     */
    func requestGetServerStream(text: String) throws {
        var requestMessage = MessageRequest()
        requestMessage.text = text
        serverStreamCall = try clientService?.getMessageServerStream(requestMessage, completion: { (callResult) in
            if callResult.success {
                print("Request Get Server Stream Call is successfully")
            }
        })
        try receiveServerStream()
    }
    
    private func receiveServerStream() throws {
        guard let serverStreamCall = serverStreamCall else {
            return
        }
        
        try serverStreamCall.receive(completion: { (response) in
            if case let result?? = response.result {
                print("Response: \(result.text)")
                do {
                    DispatchQueue.main.async {
                        try! Realm().write {
                            self.salesType?.name = result.text
                        }
                        /// Make sure data in Realm model SalesType has been updated successfuly from data stream server
                        if let salesType = SalesTypeHelper.getById(id: 1) {
                            print("Sales Type : \(salesType.name)")
                        }
                    }
                    
                    try self.receiveServerStream()
                }catch(let error) {
                    print(error)
                }
                
            } else if let error = response.error {
                print(error.localizedDescription)
            }
        })
    }
    
    /**
       Request Get Client Stream with send **text** as parameter.
       Type request is Client Stream Call. What we send as stream parameter will be received back from server as a response
       - Parameter text: String
    */
    func requestGetClientStream(text: String) throws {
        clientStreamCall = try clientService?.getMessageClientStream(completion: { (callResult) in
            if callResult.success {
                print("Request Get Client Stream Call is successfully")
            }
        })
        try sendRequestStream(text: text)
    }
    
    /// For parameter as stream, we assumed let say send message 3 times with using loop
    private func sendRequestStream(text: String) throws {
        var requestMessage = MessageRequest()
        requestMessage.text = text
        try clientStreamCall?.send(requestMessage)
        if text.isEmpty {
            try clientStreamCall?.closeAndReceive(completion: { (callResult) in
                if let result = callResult.result {
                    print("Response : \(result.text)")
                } else if let error = callResult.error {
                    print(error.localizedDescription)
                }
            })
        }
    }
    
    /**
       Request Get Client Server Stream  with send **text** as parameter stream.
       Type request is Bidirectional Stream Call. What we send as stream parameter will be received back from server as a response stream
       - Parameter text: String
    */
    func requestGetClientServerStream(text: String) throws {
        clientServerStreamCall = try clientService?.getMessageClientServerStream(completion: { (callResult) in
            if callResult.success {
                print("Request Bidirectional Stream Call is successfully")
            }
        })
        try receiveClientServerStream()
        try sendRequestClientServerStream(text: text)
    }
    
    private func receiveClientServerStream() throws {
        guard let clientServerStreamCall = clientServerStreamCall else {
            return
        }
        
        try clientServerStreamCall.receive(completion: { (response) in
            if case let result?? = response.result {
                print("Response: \(result.text)")
                do {
                    DispatchQueue.main.async {
                        try! Realm().write {
                            self.salesType?.name = result.text
                        }
                        /// Make sure data in Realm model SalesType has been updated successfuly from data stream server
                        if let salesType = SalesTypeHelper.getById(id: 1) {
                            print("Sales Type : \(salesType.name)")
                        }
                    }
                    try self.receiveClientServerStream()
                }catch(let error) {
                    print(error)
                }
                
            } else if let error = response.error {
                print(error.localizedDescription)
            }
        })
    }
    
    private func sendRequestClientServerStream(text: String) throws {
        if text.isEmpty {
            try clientServerStreamCall?.closeSend()
        } else {
            var requestMessage = MessageRequest()
            requestMessage.text = text
            try clientServerStreamCall?.send(requestMessage)
        }
    }
}
