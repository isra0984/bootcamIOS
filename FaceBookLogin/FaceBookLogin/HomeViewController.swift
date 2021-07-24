//
//  HomeViewController.swift
//  FaceBookLogin
//
//  Created by Israel Torres Alvarado on 22/07/21.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class HomeViewController: UIViewController {

    lazy var loginButton: FBLoginButton = {
        let button = FBLoginButton()
        button.permissions = ["public_profile", "email"]
        button.translatesAutoresizingMaskIntoConstraints = false
        button.delegate = self
        return button
    }()
    
    @IBOutlet weak var lblNombre: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        if let token = AccessToken.current, token.isExpired == false {
            
            self.getInfoUser(token: token.tokenString)
            
        }
        
    }
    
}

extension HomeViewController: LoginButtonDelegate {
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("se cierra la sesion...")
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        
        print("Sesion iniciada....")
        
        performSegue(withIdentifier: "goToHome", sender: nil)
        
        guard let token = result?.token else {
            return
        }
        
        getInfoUser(token: token.tokenString)
        
    }
    
    func getInfoUser(token: String) {
        
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                 parameters: ["field" : "me?fields=id,name,email,picture{url}"],
                                                 tokenString: token,
                                                 version: nil,
                                                 httpMethod: .get)
        
        request.start { conn, result, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
        
            if let response = result as? [String: Any] {
                dump(response)
                
                if let name = response["name"] as? String {
                    self.lblNombre.text = "Bienvenido: " + name
                }
                
            }
        
        }
        
    }

}



