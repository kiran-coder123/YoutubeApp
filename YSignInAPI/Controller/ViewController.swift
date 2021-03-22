//
//  ViewController.swift
//  YSignInAPI
//
//  Created by Satinder Panesar on 7/30/20.
//  Copyright © 2020 com.gwt. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController,GIDSignInDelegate{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance()?.delegate = self
        //GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!){
        if error == nil{
            print(user.profile.email!)
            print(user.profile.imageURL(withDimension: 200)!)
            print(user.authentication.accessToken!)
            
            
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let youtubeHomeScreen =  storyboard.instantiateViewController(identifier: "DashboardViewController") as! DashboardViewController
            youtubeHomeScreen.idToken = user.authentication.accessToken;
            youtubeHomeScreen.profileImage = user.profile.imageURL(withDimension: 200)!
            self.navigationController?.pushViewController(youtubeHomeScreen, animated: true)
        }
    }
}


