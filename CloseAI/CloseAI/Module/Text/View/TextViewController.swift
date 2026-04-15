//
//  TextGenerate.swift
//  CloseAI
//
//  Created by Кирилл Мазепин on 05.01.2025.
//

import UIKit

protocol TextViewControllerProtocol: AnyObject {
    var textView: UITextView { get set }
}

class TextViewController: UIViewController, TextViewControllerProtocol {
    
    var presenter: TextPresenterProtocol!
    
    lazy var requestField = {
        $0.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 50)
        $0.placeholder = "Задайте любой вопрос..."
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.leftViewMode = .always
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        return $0
    }(UITextField())
    
    lazy var textView = {
        $0.frame = CGRect(x: 20, y: requestField.frame.maxY + 20, width: view.frame.width - 40, height: 500)
        $0.text = "...И ответ появится прямо тут"
        $0.textColor = .black
        $0.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        $0.layer.cornerRadius = 20
        $0.isEditable = false
        $0.font = UIFont.systemFont(ofSize: 16, weight: .black)
        $0.showsVerticalScrollIndicator = false
        return $0
    }(UITextView())
    
    private lazy var getButton = {
        $0.setTitle("Получить ответ", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        $0.setTitleColor(.gray, for: .highlighted)
        $0.frame = CGRect(x: 20, y: requestField.frame.maxY + 550, width: view.frame.size.width - 40, height: 50)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 20
        return $0
    }(UIButton(primaryAction: UIAction(handler: { _ in
        self.textView.text = "Загружаю ответ!)"
        let question = self.requestField.text ?? ">"
        self.presenter.setRequest(question: question)
    })))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubviews(requestField, textView, getButton)
        dismissOnTap()
    }
}


