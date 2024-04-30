//
//  LoginViewInteractor.swift
//  PatternsTest
//
//  Created by Александр Печинкин on 30.04.2024.
//

import Foundation

protocol LoginViewInteractorInput: AnyObject {
    
    func login(_ email: String?, password: String?)
}

protocol LoginViewInteractorOutput: AnyObject {
    
    func userLoginResult(with result: Result<User, Error>)
}

class LoginViewInteractor: LoginViewInteractorInput {
    
    weak var presenter: LoginViewInteractorOutput!
    
    private let users: [User]
    private let currentUser: User
    
    var formattedUserName: String {
        currentUser.name + " \(currentUser.age) years"
    }
    
    init(users: [User]) {
        self.users = users
        self.currentUser = users.first!
    }
    
    func login(_ email: String?, password: String?) {
        
        for user in users {
            if user.email == email &&  user.password == password {
                // Show next screen
                presenter.userLoginResult(with: .success(user))
                return
            }
        }
        
        presenter.userLoginResult(with: .failure(UserValidationError.incorrectCredentoinals))
    }
}
