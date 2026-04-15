//
//  TabBarViewPresenterProtocol.swift
//  CloseAI
//
//  Created by Кирилл Мазепин on 14.01.2025.
//

import UIKit

protocol TabBarPresenterProtocol: AnyObject {
    
}

class TabBarPresenter: TabBarPresenterProtocol {
    
    weak var view: TabBarViewControllerProtocol?
    
    init(view: TabBarViewControllerProtocol) {
        self.view = view
    }
    
}
