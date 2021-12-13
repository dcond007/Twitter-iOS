//
//  LoginViewController.swift
//  Twitter
//
//  Created by Astronaut Elvis on 12/11/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit
import Toast

class LoginViewController: UIViewController {
    
    let login_url = "https://api.twitter.com/oauth/request_token"
    
    
    @IBAction func loginButtonClick(_ sender: Any) {
        // Handle login after login button click
        TwitterAPICaller.client?.login(url: login_url,
                                       success: {
            // Persistent login
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            
            // perform segue from login to homepage
            self.view.makeToast("Login Success!")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        },
                                       failure: { Error in
            self.view.makeToast("Login Failed")
        })
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
