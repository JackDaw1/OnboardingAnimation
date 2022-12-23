//
//  ViewController.swift
//  OnboardingAnimation
//
//  Created by Galina Iaroshenko on 23.12.2022.
//

import UIKit

class ViewController: UIViewController {

    var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        imageView.image = UIImage(named: "crow")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(imageView)
        DispatchQueue.main.asyncAfter(deadline: .now()+5) {
            self.performSegue(withIdentifier: "segue", sender: self)
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.animation()
        }
    }
    func animation() {
        UIView.animate(withDuration: 1) {
            let size = self.view.frame.size.width * 2
            let xpostion = size - self.view.frame.width
            let ypostion = self.view.frame.height - size
            
            self.imageView.frame = CGRect(x: -(xpostion/2), y: ypostion/2, width: size, height: size)
            self.imageView.alpha = 0
        }
    }
}

