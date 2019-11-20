//
//  MainViewController.swift
//  GrpcClient
//
//  Created by Satrio Wicaksono on 14/09/19.
//  Copyright © 2019 Satrio Wicaksono. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func goToServiceCallViewController(_ serviceCallType: ServiceCall) {
        guard let serviceCallViewController = getViewController(viewControllerClass: ServiceCallViewController.self) as? ServiceCallViewController else { return }
        serviceCallViewController.serviceCallType = serviceCallType
        let navigationController = UINavigationController(rootViewController: serviceCallViewController)
        navigationController.navigationBar.isHidden = true
        present(navigationController, animated: true, completion: { () -> Void in
            switch serviceCallType {
            case .getUnaryCall:
                serviceCallViewController.navigationBar.topItem?.title = "Unary Call"
            case .getClientStreamCall:
            serviceCallViewController.navigationBar.topItem?.title = "Client Stream Call"
            case .getServerStreamCall:
            serviceCallViewController.navigationBar.topItem?.title = "Server Stream Call"
            case .getClientServerStreamCall:
            serviceCallViewController.navigationBar.topItem?.title = "Client Server Stream Call"
            }
        })
    }
    
    @IBAction func onUnaryCallButtonClicked(_ sender: Any) {
        goToServiceCallViewController(.getUnaryCall)
    }
    
    @IBAction func onClientStreamCallButtonClicked(_ sender: Any) {
        goToServiceCallViewController(.getClientStreamCall)
    }
    
    @IBAction func onServerStreamCallButtonClicked(_ sender: Any) {
        goToServiceCallViewController(.getServerStreamCall)
    }
    
    @IBAction func onClientServerStreamCallButtonClicked(_ sender: Any) {
        goToServiceCallViewController(.getClientServerStreamCall)
    }
}

