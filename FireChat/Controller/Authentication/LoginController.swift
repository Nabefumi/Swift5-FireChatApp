//
//  LoginController.swift
//  FireChat
//
//  Created by Takafumi Watanabe on 2022-03-14.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Properties
    
    private let iconImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "bubble.right")
        iv.tintColor = .white
        return iv
    }()
    
    private lazy var emailConteinerView: UIView = {
        let conteinerView = UIView()
        conteinerView.backgroundColor = .clear
        
        let iv = UIImageView()
        iv.image = UIImage(systemName: "envelope")
        iv.tintColor = .white
        
        conteinerView.addSubview(iv)
        iv.centerY(inView: conteinerView)
        iv.anchor(left: conteinerView.leftAnchor, paddingLeft: 8)
        iv.setDimensions(height: 24, width: 28)
        
        conteinerView.addSubview(emailTextField)
        emailTextField.centerY(inView: conteinerView)
        emailTextField.anchor(left: iv.rightAnchor, bottom: conteinerView.bottomAnchor, right: conteinerView.rightAnchor, paddingLeft: 8, paddingBottom: -8)
        
        conteinerView.setHeight(height: 50)
        return conteinerView
        
    }()
    
    private lazy var  passwordConteinerView: UIView = {
        let conteinerView = UIView()
        conteinerView.backgroundColor = .clear
        
        let iv = UIImageView()
        iv.image = UIImage(systemName: "lock")
        iv.tintColor = .white
        
        conteinerView.addSubview(iv)
        iv.centerY(inView: conteinerView)
        iv.anchor(left: conteinerView.leftAnchor, paddingLeft: 8)
        iv.setDimensions(height: 28, width: 28)
        
        conteinerView.addSubview(passwordTextField)
        passwordTextField.centerY(inView: conteinerView)
        passwordTextField.anchor(left: iv.rightAnchor, bottom: conteinerView.bottomAnchor, right: conteinerView.rightAnchor, paddingLeft: 8, paddingBottom: -8)
        
        conteinerView.setHeight(height: 50)
        return conteinerView
        
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log in", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = .systemRed
        button.setHeight(height: 50)
        return button
    }()
    
    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.textColor = .white
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.textColor = .white
        return tf
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        configureGradientLayer()
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        iconImage.setDimensions(height: 120, width: 120)
        
        let stack = UIStackView(arrangedSubviews: [emailConteinerView,
                                                   passwordConteinerView,
                                                   loginButton])
        
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
    }
    
    func configureGradientLayer() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemPink.cgColor]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }
}
