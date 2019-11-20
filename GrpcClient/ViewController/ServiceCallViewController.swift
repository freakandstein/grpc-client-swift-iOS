//
//  ServiceCallViewController.swift
//  GrpcClient
//
//  Created by Satrio Wicaksono on 20/11/19.
//  Copyright © 2019 Satrio Wicaksono. All rights reserved.
//

import Foundation
import UIKit

enum ServiceCall {
    case getUnaryCall
    case getClientStreamCall
    case getServerStreamCall
    case getClientServerStreamCall
}

class ServiceCallViewController: UIViewController {
    
    var serviceCallType: ServiceCall?
    @IBOutlet weak var messageText: UITextField!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onSendButtonClicked(_ sender: Any) {
        guard let message = messageText.text else { return }
        guard let serviceCall = serviceCallType else { return }
        do {
            switch serviceCall {
            case .getUnaryCall:
                try Service.shared.requestGetUnary(text: message)
            case .getClientStreamCall:
                try Service.shared.requestGetClientStream(text: message)
            case .getServerStreamCall:
                try Service.shared.requestGetServerStream(text: message)
            case .getClientServerStreamCall:
                try Service.shared.requestGetClientServerStream(text: message)
            }
        } catch {
            print("Service call error")
        }
    }
    
    @IBAction func onDismissClicked(_ sender: Any) {
        navigationController?.dismiss(animated: true, completion: nil)
        // Every dismiss, we reset data sales type
        SalesTypeHelper.initSalesTypeDummy()
    }
}
