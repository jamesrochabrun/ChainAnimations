//
//  ViewController.swift
//  ChainAnimationToolTip
//
//  Created by James Rochabrun on 3/31/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Setup UI
    let titleLabel = UILabel()
    let bodyLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels()
        setUpStackView()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(startAnimation)))
    }
    
    @objc func startAnimation() {
        
        /// Here is the good stuff
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
            
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
                self.titleLabel.alpha = 0

            }) { (_) in
            }
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
            
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.bodyLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
                self.bodyLabel.alpha = 0
                
            }) { (_) in
            }
        }
    }

    fileprivate func setUpLabels() {
        titleLabel.text = "Welcome"
        titleLabel.numberOfLines = 0
        bodyLabel.text = "Hello there here thanks for downloding this app. please give us a try and review us on the appstore"
        bodyLabel.numberOfLines = 0
    }
    
    fileprivate func setUpStackView() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, bodyLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.frame = CGRect(x: 0, y: 0, width: 200, height: 400)
        view.addSubview(stackView)
        
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -100).isActive = true
    }
}










