//
//  LoginAssembly.swift
//  PatternsTest
//
//  Created by Александр Печинкин on 30.04.2024.
//

import Foundation
import UIKit

class LoginAssembly {
    
    static func buildLoginScreen() -> UIViewController {
        
        let users = [User(name: "Max", age: 18, email: "Admin@admin", password: "123")]
        
        let view = LoginViewControllerVP()
        let presenter = LoginViewPresenter()
        let interactor = LoginViewInteractor(users: users)
        let router = LoginViewRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
    
    private init() {
        
    }
}
