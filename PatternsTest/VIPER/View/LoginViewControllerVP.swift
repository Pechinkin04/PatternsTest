//
//  LoginViewControllerVP.swift
//  PatternsTest
//
//  Created by Александр Печинкин on 30.04.2024.
//

import UIKit

class LoginViewControllerVP: UIViewController, LoginViewPresenterOutput {
    
    private let contentView: LoginViewVP = .init()
    
    var presenter: LoginViewPresenterInput!
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        contentView.delegate = self
        view.backgroundColor = .systemBlue
        
    }

    func updateUI(with result: Result<User, Error>) {
        switch result{
        case .success(let user):
            print("\(user)")
        case .failure(let error):
            print("Error: \(error.localizedDescription)")
        }
    }

}


extension LoginViewControllerVP: LoginViewVPDelegate {
    func didPressLogin(with email: String?, password: String?) {
        presenter.didPressedLogin(with: email, password: password)
    }
}
