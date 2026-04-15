//
//  ImagePresenter.swift
//  CloseAI
//
//  Created by Кирилл Мазепин on 14.01.2025.
//

import Foundation

protocol ImagePresenterProtocol: AnyObject {
    func setImage(prompt: String)
}

class ImagePresenter: ImagePresenterProtocol {
    
    weak var view: ImageViewControllerProtocol?
    let request = ImageNetworkManager()
    
    init(view: ImageViewController) {
        self.view = view
    }
    
    func setImage(prompt: String) {
        request.sendRequest(prompt: prompt, n: 1, size: "1024x1024") { [weak self] images in
            guard let self = self else { return }
            guard let imageUrl = images.first?.url else {
                print("No images received.")
                return
            }
            
            view?.imageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: .checkmark, options: .progressiveLoad)
        }
    }
}
