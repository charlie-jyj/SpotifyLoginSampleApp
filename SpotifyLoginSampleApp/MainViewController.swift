//
//  MainViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by UAPMobile on 2022/01/18.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var resetPasswordButton: UIButton!
    @IBOutlet weak var waitingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.waitingIndicator.isHidden = true
        navigationController?.navigationBar.isHidden = true
        
        let email = Auth.auth().currentUser?.email ?? "고객"
        self.welcomeLabel.text = """
            환영합니다.
            \(email)님
            """
        let isEmailprovider = Auth.auth().currentUser?.providerData[0].providerID == "password"
        resetPasswordButton.isHidden = !isEmailprovider
        
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error: signout \(signOutError.localizedDescription)")
        }
    }
    
    @IBAction func resetPasswordButtonTapped(_ sender: UIButton) {
        let email = Auth.auth().currentUser?.email ?? ""
        Auth.auth().sendPasswordReset(withEmail: email, completion: nil)
    }
    
    @IBAction func profileUpdateButtonTapped(_ sender: UIButton) {
        let nameInputAlert = UIAlertController.init(title: "닉네임을 입력해주세요", message: nil, preferredStyle: .alert)
        nameInputAlert.addTextField {
            textField in
            textField.placeholder = "변경할 닉네임을 입력해주세요."
        }
        let ok = UIAlertAction(title: "ok", style: .default){ (_) in
            self.waitingIndicator.isHidden = false
            self.waitingIndicator.startAnimating()
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = nameInputAlert.textFields?[0].text
            changeRequest?.commitChanges { error in
                self.waitingIndicator.stopAnimating()
                self.waitingIndicator.isHidden = true
                let displayName = Auth.auth().currentUser?.displayName ?? Auth.auth().currentUser?.email ?? "고객"
                
                self.welcomeLabel.text = """
                    환영합니다.
                    \(displayName)님
                    """
            }
        }
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        nameInputAlert.addAction(ok)
        nameInputAlert.addAction(cancel)
        self.present(nameInputAlert, animated: true, completion: nil)
        
       
    }
}
