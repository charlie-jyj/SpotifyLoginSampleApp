//
//  LoginViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by UAPMobile on 2022/01/18.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: UIButton!
    @IBOutlet weak var appleLoginButton: UIButton!
    
    override func viewDidLoad() {
        [self.emailLoginButton, self.googleLoginButton, self.appleLoginButton].forEach {
            $0?.layer.borderWidth = 1
            $0?.layer.borderColor = UIColor.white.cgColor
            $0?.layer.cornerRadius = 30
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // navigation bar 숨기기
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func googleLoginButtonTapped(_ sender: UIButton) {
        // firebase auth
    }
    
    @IBAction func appleLoginButtonTapped(_ sender: UIButton) {
        // firebase auth
    }
}
