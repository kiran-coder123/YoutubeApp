//
//  SubscriberChannalViewController.swift
//  YSignInAPI
//
//  Created by Satinder Panesar on 10/5/20.
//  Copyright © 2020 com.gwt. All rights reserved.
//

import UIKit
import GoogleSignIn
 

class SubscriberChannalViewController: UIViewController {
    var idToken = ""
    var profileImage : URL!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMySubscribers()
     }
    //MARK:  get Subscribed list from JSON
    
    func fetchMySubscribers() {
           let url =  URL(string:"https://www.googleapis.com/youtube/v3/subscriptions?part=snippet%2CcontentDetails&mine=true&key=AIzaSyCmmJ_jiE1T3KTzTTxzWyTIB6vXIGQm2Ro")
        
        let request = NSMutableURLRequest(url: url!)
             //  var SCOPES = ["https://www.googleapis.com/auth/spreadsheets"]
             let session = URLSession.shared
             request.httpMethod = "GET"
             request.addValue("application/json", forHTTPHeaderField: "Accept")
             request.addValue("Bearer \(idToken)", forHTTPHeaderField: "Authorization")
              
             let task = session.dataTask(with: request as URLRequest) { data, response, error in
                 guard data != nil else { return }
                 do {
                     if let jsonArray = try JSONSerialization.jsonObject(with: data!, options : []) as? Dictionary<String,Any>
                     {
                         print("Broadcast response json - \(jsonArray)")
                     }
                 } catch let error as NSError {
                     print(error)
                 }
             };
             task.resume()
    }

}
