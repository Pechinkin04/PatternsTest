//
//  LoginViewRouter.swift
//  PatternsTest
//
//  Created by Александр Печинкин on 30.04.2024.
//

import Foundation
import UIKit

protocol LoginViewRouterInput {
    func showMainViewController()
}

class LoginViewRouter: LoginViewRouterInput {
    
    weak var view: UIViewController!
//    weak var presenter: LoginViewPresenter!
    
    func showMainViewController() {
        
//        view.show(MainViewController(), sender: nil)
        view.navigationController?.pushViewController(MainViewController(), animated: true)
    }
    
}
