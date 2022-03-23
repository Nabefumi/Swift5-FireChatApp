//
//  ChatController.swift
//  FireChat
//
//  Created by Takafumi Watanabe on 2022-03-23.
//

import UIKit

class ChatController: UICollectionViewController {
    
    // MARK: - Properties
    
    private let user: User
    
    // MARK: - Lifecycle
    
    init(user: User) {
        self.user = user
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        print("DEBUG: User in chat controller is \(user.username)")
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        collectionView.backgroundColor = .white
    }
}
