//
//  dismissKeyboard.swift
//  CloseAI
//
//  Created by Кирилл Мазепин on 14.01.2025.
//

import UIKit

extension UIViewController {
    /// Добавляет возможность скрывать клавиатуру по тапу на экран
    func dismissOnTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false  // Позволяет другим взаимодействиям (например, нажатиям на кнопки)
        view.addGestureRecognizer(tapGesture)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)  // Закрывает клавиатуру
    }
}


