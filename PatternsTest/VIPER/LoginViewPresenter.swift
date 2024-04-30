//
//  LoginViewPresenter.swift
//  PatternsTest
//
//  Created by Александр Печинкин on 30.04.2024.
//

import Foundation
import UIKit

protocol LoginViewPresenterInput: AnyObject {
    
    func didPressedLogin(with email: String?, password: String?)
    
    func userLoginResult(with result: Result<User, Error>)
}

protocol LoginViewPresenterOutput: AnyObject {
    
    func updateUI(with result: Result<User, Error>)
}

class LoginViewPresenter: LoginViewPresenterInput, LoginViewInteractorOutput {
    
    weak var view: LoginViewPresenterOutput!
    var interactor: LoginViewInteractorInput!
    var router: LoginViewRouterInput!
    
    func didPressedLogin(with email: String?, password: String?) {
        interactor.login(email, password: password)
    }
    
    func userLoginResult(with result: Result<User, Error>) {
        view.updateUI(with: result)
        router.showMainViewController()
    }
    
}
