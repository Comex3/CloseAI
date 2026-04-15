//
//  ViewController.ext.swift
//  CloseAI
//
//  Created by Кирилл Мазепин on 14.01.2025.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
