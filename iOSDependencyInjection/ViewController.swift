//
//  ViewController.swift
//  iOSDependencyInjection
//
//  Created by Atil Samancioglu on 6.08.2022.
//

import UIKit
import Swinject

class ViewController: UIViewController {
    
    //Swinject
    let container : Container = {
        let container = Container()
        container.register(BackgroundProvidingClass.self) { resolver in
            return BackgroundProvidingClass()
        }
        container.register(AnotherVC.self) { resolver in
            let vc = AnotherVC(providerProtocol: resolver.resolve(BackgroundProvidingClass.self))
            return vc
        }
        
        return container
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        button.setTitle("Open Another VC", for: .normal)
        button.center = view.center
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        view.addSubview(button)
        
        
    }
    
    @objc private func buttonClicked() {
        if let viewController = container.resolve(AnotherVC.self) {
            present(viewController, animated: true)
        }
    }

    
    
}




