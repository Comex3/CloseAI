//
//  ImageGenerate.swift
//  CloseAI
//
//  Created by Кирилл Мазепин on 05.01.2025.
//

import UIKit
import SDWebImage

protocol ImageViewControllerProtocol: AnyObject {
    var imageView: UIImageView { get set }
}

class ImageViewController: UIViewController, ImageViewControllerProtocol {
    
    let image = ImageNetworkManager()
    
    var presenter: ImagePresenterProtocol!
    
    lazy var imageDesc = {
        $0.frame = CGRect(x: 20, y: 100, width: view.frame.width - 40, height: 50)
        $0.placeholder = "Опишите изображение..."
        $0.leftViewMode = .always
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: -20, height: 0))
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        return $0
    }(UITextField())
    
    lazy var imageQuality = {
        $0.frame = CGRect(x: 20, y: imageDesc.frame.maxY + 20, width: view.frame.width - 40, height: 50)
        $0.placeholder = "1024x1024"
        $0.leftViewMode = .always
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.isUserInteractionEnabled = false
        return $0
    }(UITextField())
    
    lazy var imageView = {
        $0.frame = CGRect(x: 20, y: imageQuality.frame.maxY + 55, width: view.frame.width - 40, height: 350)
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.tintColor = .black
        return $0
    }(UIImageView())
    
    private lazy var getButton = {
        $0.setTitle("Получить изображение", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        $0.setTitleColor(.gray, for: .highlighted)
        $0.frame = CGRect(x: 20, y: imageDesc.frame.maxY + 550, width: view.frame.size.width - 40, height: 50)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 20
        return $0
    }(UIButton(primaryAction: UIAction(handler: { _ in
        guard let prompt = self.imageDesc.text, !prompt.isEmpty else { return }
        self.presenter.setImage(prompt: prompt)
        self.imageView.image = UIImage(systemName: "timer")
    })))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        view.addSubviews(imageDesc, imageQuality, imageView, getButton)
        dismissOnTap()
    }
}



