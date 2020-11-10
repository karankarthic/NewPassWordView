//
//  ViewController.swift
//  NewPassWordView
//
//  Created by karan on 09/11/20.
//  Copyright © 2020 karan. All rights reserved.
//

import UIKit
import PassCode


class ViewController: UIViewController {
    
    lazy var loginButton :UIButton = {
           var loginButton = UIButton()
           loginButton.layer.cornerRadius = 70
           loginButton.setTitle("SignIn", for: .normal)
           loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .ultraLight)
           loginButton.setTitleColor(.black, for: .normal)
           loginButton.backgroundColor = UIColor.init(red: 232/255, green: 232/255, blue: 232/255, alpha: 1)
           loginButton.addTarget(self, action: #selector(showPassWord), for: .touchUpInside)
           loginButton.translatesAutoresizingMaskIntoConstraints = false
           return loginButton
       }()
    
    private let password = "226688"
    lazy var passcodeView : PassCodeViewController = {
        var passcodeView = PassCodeViewController()
        passcodeView.view.backgroundColor = .white
        passcodeView.validateButton.addTarget(self, action: #selector(doValidation), for: .touchUpInside)
        return passcodeView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(loginButton)

        NSLayoutConstraint.activate([
                                      loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                      loginButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                                      loginButton.heightAnchor.constraint(equalToConstant: 140),
                                      loginButton.widthAnchor.constraint(equalToConstant: 140)
        ])
        
    }
    
    @objc private func showPassWord(){
        
        self.present(passcodeView, animated: true, completion: nil)
        
    }
    
    @objc private func doValidation(){
        
        if password == passcodeView.passCodeView.getPassWord(){
            let alertController = UIAlertController(title: "", message: "SuccessFull", preferredStyle:.alert)

            alertController.addAction(UIAlertAction(title: "OK", style: .default)
            { action -> Void in
                
            })
            passcodeView.present(alertController, animated: true, completion: nil)
        }else{
            passcodeView.passCodeView.validationFails()
        }
        
    }


}

