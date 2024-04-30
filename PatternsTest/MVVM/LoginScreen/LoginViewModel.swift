//
//  LoginViewModel.swift
//  PatternsTest
//
//  Created by Александр Печинкин on 30.04.2024.
//

import Foundation

enum UserValidationError: Error {
    case incorrectCredentoinals
}

class LoginViewModel {
    
    private let users: [User]
    private let currentUser: User
    
    private var userValidationResult: Result<User, Error>? {
        didSet {
            guard let result = userValidationResult else { return }
            userValidationResultBlock?(result)
        }
    }
    
    var userValidationResultBlock: ((Result<User, Error>) -> Void)?
    
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
                userValidationResult = .success(user)
                return
            }
        }
        
        userValidationResult = .failure(UserValidationError.incorrectCredentoinals)
    }
}
