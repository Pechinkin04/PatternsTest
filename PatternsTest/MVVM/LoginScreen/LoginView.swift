//
//  LoginView.swift
//  PatternsTest
//
//  Created by Александр Печинкин on 29.04.2024.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func didPressLogin(with email: String?, password: String?)
}

class LoginView: UIView {

    lazy var emailTextField: UITextField = {
        
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = "Email"
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .next
        
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        
        let textField = UITextField()
        textField.delegate = self
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.textContentType = .password
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done
        
        return textField
    }()
    
    weak var delegate: LoginViewDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addSubviews() {
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint (equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
}

extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            delegate?.didPressLogin(with: emailTextField.text, password: passwordTextField.text)
        default:
            break
        }
            
        return true
    }
}
