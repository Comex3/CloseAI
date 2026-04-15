//
//  Presenter.swift
//  CloseAI
//
//  Created by Кирилл Мазепин on 14.01.2025.
//

import UIKit

class Builder {
    
    static func createTabBarView() -> UIViewController {
        let tabBar = TabBarViewController()
        let presenter = TabBarPresenter(view: tabBar)
        tabBar.presenter = presenter
        return tabBar
    }
    
    static func createTextView() -> UIViewController {
        let text = TextViewController()
        let presenter = TextPresenter(view: text)
        text.presenter = presenter
        return text
    }
    
    static func createImageView() -> UIViewController {
        let image = ImageViewController()
        let presenter = ImagePresenter(view: image)
        image.presenter = presenter
        return image
    }
}
