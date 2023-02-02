//
//  RegisterViewController.swift
//  Twitters
//
//  Created by Rivaldo Fernandes on 02/02/23.
//

import UIKit
import Combine

class RegisterViewController: UIViewController {
    
    private var viewModel = RegisterViewModel()
    private var subscriptions: Set<AnyCancellable> = []
    
    private let registerTitleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Create your account"
        label.font = .systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    private let emailTextField: UITextField = {
       let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textfield.keyboardType = .emailAddress
        return textfield
    }()
    
    private let passwordTextField: UITextField = {
       let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create Account", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.backgroundColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 25
        button.isEnabled = false
        
        return button
        
    }()
    
    @objc private func didChangeEmailField(){
        viewModel.email = emailTextField.text
        viewModel.validateRegistrationForm()
    }
    
    @objc private func didChangePasswordField(){
        viewModel.password = passwordTextField.text
        viewModel.validateRegistrationForm()
    }
    
    private func bindViews() {
        emailTextField.addTarget(self, action: #selector(didChangeEmailField), for: .editingChanged)
        
        passwordTextField.addTarget(self, action: #selector(didChangePasswordField), for: .editingChanged)
        
        viewModel.$isRegistrationFormValid.sink { [weak self] validationState in
            self?.registerButton.isEnabled = validationState
        }.store(in: &subscriptions)
        
        viewModel.$user.sink { [weak self] user in
            guard user != nil  else { return }
            
            guard let vc = self?.navigationController?.viewControllers.first as? OnboardingViewController else { return }
            vc.dismiss(animated: true)
        }
        .store(in: &subscriptions)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registerTitleLabel)
        view.addSubview(registerButton)
        
        configureConstraints()
        
        registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapToDismiss)))
        
        bindViews()
    }
    
    @objc private func didTapRegister(){
        viewModel.createUser()
    }
    
    @objc private func didTapToDismiss(){
        view.endEditing(true)
    }
    
    private func configureConstraints(){
        let registerTitleLabelConstraints = [
            registerTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ]
        
        let emailTextfieldConstraints = [
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            emailTextField.topAnchor.constraint(equalTo: registerTitleLabel.bottomAnchor, constant: 20),
            emailTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 40),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        let passwordTextfieldConstraints = [
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 40),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        let registerButtonConstraints = [
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            registerButton.widthAnchor.constraint(equalToConstant: 180),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(registerTitleLabelConstraints)
        NSLayoutConstraint.activate(emailTextfieldConstraints)
        NSLayoutConstraint.activate(passwordTextfieldConstraints)
        NSLayoutConstraint.activate(registerButtonConstraints)
    }
}
