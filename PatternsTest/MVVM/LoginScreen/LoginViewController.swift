//
//  LoginViewController.swift
//  PatternsTest
//
//  Created by Александр Печинкин on 29.04.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let contentView: LoginView = .init()
    
    private let viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        contentView.delegate = self
        view.backgroundColor = .systemBlue
        setupBindings()
        
//        viewModel.formattedUserName
    }

    func setupBindings() {
        
        viewModel.userValidationResultBlock = { [weak self] result in
            switch result {
            case .success:
//                self?.show(MainViewController(), sender: nil)
                self?.navigationController?.pushViewController(MainViewController(), animated: true)
            case .failure(let error):
                print("Failure \(error.localizedDescription)")
            }
        }
        
    }

}


extension LoginViewController: LoginViewDelegate {
    func didPressLogin(with email: String?, password: String?) {
        viewModel.login(email, password: password)
    }
}
