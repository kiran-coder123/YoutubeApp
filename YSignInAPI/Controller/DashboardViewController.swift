//
//  DashboardViewController.swift
//  YSignInAPI
//
//  Created by Satinder Panesar on 10/5/20.
//  Copyright © 2020 com.gwt. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    var idToken = ""
    var profileImage : URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()

     }
    
    @IBAction func btnAllCatClicked(_ sender: UIButton) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let youtubeHomeScreen =  storyboard.instantiateViewController(identifier: "VideoCategoryListVC") as! VideoCategoryListVC
        youtubeHomeScreen.idToken = idToken
        youtubeHomeScreen.profileImage =  profileImage
        self.navigationController?.pushViewController(youtubeHomeScreen, animated: true)
        
        
    }
    
 
    @IBAction func btnSubscribedChannalClicked(_ sender: UIButton) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let youtubeHomeScreen =  storyboard.instantiateViewController(identifier: "SubscriberChannalViewController") as! SubscriberChannalViewController
        youtubeHomeScreen.idToken = idToken
        youtubeHomeScreen.profileImage =  profileImage
        self.navigationController?.pushViewController(youtubeHomeScreen, animated: true)
    }
}
