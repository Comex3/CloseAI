//
//  TextPresenter.swift
//  CloseAI
//
//  Created by Кирилл Мазепин on 14.01.2025.
//

import Foundation

protocol TextPresenterProtocol {
    func setRequest(question: String)
}

class TextPresenter: TextPresenterProtocol {
    
    weak var view: TextViewControllerProtocol?
    let request = TextNetworkManager()
    var messages = [Message]()
    
    init(view: TextViewController) {
        self.view = view
    }
    
        func setRequest(question: String) {
            request.sendRequest(question: question) { [self] choices in
                self.view?.textView.text = choices[0].message.content
                self.messages.append(choices[0].message)
            }
        }
    }
    
//    func setRequest(question: String) {
//        request.sendRequest(question: question) { choices in
//            guard !choices.isEmpty else {
//                print("Массив choices пуст")
//                DispatchQueue.main.async {
//                    self.view?.textView.text = "Ответ не получен."
//                }
//                return
//            }
//            
//            DispatchQueue.main.async {
//                self.view?.textView.text = choices[0].message.content
//                self.messages.append(choices[0].message)
//            }
//        }
//    }
//}
