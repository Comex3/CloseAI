//
//  TabView.swift
//  CloseAI
//
//  Created by Кирилл Мазепин on 05.01.2025.
//

import UIKit

protocol TabBarViewControllerProtocol: AnyObject {
    
}

class TabBarViewController: UITabBarController, TabBarViewControllerProtocol {
    
    weak var presenter: TabBarPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .black
        tabBar.barTintColor = .black
        
        setupBar()
    }
    
    
    
    private func setupBar() {
        let text = Builder.createTextView()
        text.tabBarItem.title = "Текст"
        text.tabBarItem.image = UIImage(systemName: "doc.text")
        text.tabBarItem.selectedImage = UIImage(systemName: "doc.text.fill")
        
        let image = Builder.createImageView()
        image.tabBarItem.title = "Изображение"
        image.tabBarItem.image = UIImage(systemName: "photo")
        image.tabBarItem.selectedImage = UIImage(systemName: "photo.fill")
        
        setViewControllers([text, image], animated: false)
    }
}
