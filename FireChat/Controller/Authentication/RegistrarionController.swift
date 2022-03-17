//
//  RegistrarionController.swift
//  FireChat
//
//  Created by Takafumi Watanabe on 2022-03-14.
//

import UIKit

class RegistrarionController: UIViewController {
    
    // MARK: - Properties
    
    private let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        //#imageLiteral(
        let image = #imageLiteral(resourceName: "plus_photo")
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        return button
    }()

    private lazy var emailConteinerView: InputContainerView = {
        
        return InputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"),
                                  textField: emailTextField)//#imageLiteral(
        
    }()
    
    private lazy var fullNameConteinerView: InputContainerView = {
        
        return InputContainerView(image: #imageLiteral(resourceName: "ic_person_outline_white_2x"),
                                  textField: fullnameTextField)//#imageLiteral(
        
    }()
    
    private lazy var userNameConteinerView: InputContainerView = {
        
        return InputContainerView(image: #imageLiteral(resourceName: "ic_person_outline_white_2x"),
                                  textField: usernamelTextField)//#imageLiteral(
        
    }()
    
    private lazy var  passwordConteinerView: InputContainerView = {
        return InputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"),
                                  textField: passwordTextField)
    }()
    
    private let emailTextField = CustomTextField(placeholder: "Email")
    private let fullnameTextField = CustomTextField(placeholder: "Full Name")
    private let usernamelTextField = CustomTextField(placeholder: "Username")

    
    private let passwordTextField: CustomTextField = {
        let tf = CustomTextField(placeholder: "password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .systemRed
        button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.setHeight(height: 50)
        return button
    }()
    
    private let alreadyHaveAcountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Already have an account?  ",
                                                        attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: "Log In",
                                                  attributes: [.font: UIFont.boldSystemFont(ofSize: 16), .foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
        
    }()
    
    // MARK: - Selectors
    
    @objc func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    @objc func handleSelectPhoto() {
        print("Select Photo here...")
    }
    
    func configureUI() {
        configureGradientLayer()
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        plusPhotoButton.setDimensions(height: 200, width: 200)
        
        let stack = UIStackView(arrangedSubviews: [emailConteinerView,
                                                   passwordConteinerView,
                                                   fullNameConteinerView,
                                                   userNameConteinerView,
                                                   signUpButton])
        
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor,
                     right: view.rightAnchor, paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(alreadyHaveAcountButton)
        alreadyHaveAcountButton.anchor(left: view.leftAnchor,
                                    bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                    right: view.rightAnchor, paddingLeft: 32, paddingRight: 32)
    }
}
