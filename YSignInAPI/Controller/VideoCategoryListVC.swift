//
//  swiftyJSONViewcontroller.swift
//  YSignInAPI
//
//  Created by Satinder Panesar on 8/14/20.
//  Copyright © 2020 com.gwt. All rights reserved.
//

import UIKit
struct Response: Codable {
    let items: [Items]
}
struct Items: Codable{
    let id: String
    let snippet: Snippets
    
}
struct Snippets: Codable {
    let title: String
}

class VideoCategoryListVC: UIViewController{
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var imgUserProfile: UIImageView!
    
    // create array and pass response json struct.
    var arrCategory = [Items]()
    
    var idToken = ""
    var profileImage : URL!
    
    // create  an array for VideoCategory ID's
    var arrVideoCategoryID = ["",]
   override func viewDidLoad() {
        super.viewDidLoad()
    
       getVideoCategoryList()
       profile()
       
        
         
        
    }
    
    override func viewDidLayoutSubviews() {
        
        imgUserProfile.layer.cornerRadius = imgUserProfile.frame.size.width/2
        imgUserProfile.layer.masksToBounds = true
        
    }
    func profile(){
        
        //        let urlString = "https://lh6.googleusercontent.com/-daugsWMJ36Y/AAAAAAAAAAI/AAAAAAAAAAA/AMZuucnAhR8qH09dN8GUwrcqD8pvstHp8A/s200/photo.jpg"
        let request = NSURLRequest(url: profileImage)
        
        URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            
            if error != nil {
                print("Failed to load image for url: \(String(describing: self.profileImage)), error: \(error!.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Not an NSHTTPURLResponse from loading url: \(String(describing: self.profileImage))")
                return
            }
            
            if httpResponse.statusCode != 200 {
                print("Bad response statusCode: \(httpResponse.statusCode) while loading url: \(String(describing: self.profileImage))")
                return
            }
            
            DispatchQueue.main.async {
                self.imgUserProfile.image = UIImage(data: data!)
            }
            
        }.resume()
    }
    //MARK:  get video category list from JSON
    func getVideoCategoryList(){
        let url = URL(string: "https://www.googleapis.com/youtube/v3/videoCategories?part=snippet&regionCode=US&key=AIzaSyCmmJ_jiE1T3KTzTTxzWyTIB6vXIGQm2Ro")
        URLSession.shared.dataTask(with: url!) { (data, _, _) in
            if let data = data {
                // print(data)
                
                let user =  try? JSONDecoder().decode(Response.self, from: data)
                self.arrCategory = user!.items
               // print(user ?? "error getting data")
                DispatchQueue.main.async {
                    self.tblView.reloadData()
                }
            }
       }.resume()
    }
     
    }
 extension VideoCategoryListVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.lblID.text = "ID: \(arrCategory[indexPath.row].id)"
        cell.lblTITLE.text = "TITLE: \(arrCategory[indexPath.row].snippet.title)"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let id = self.arrCategory[indexPath.row].id
        
        let videoListVC = (self.storyboard?.instantiateViewController(identifier: "VideosListVC"))! as VideosListVC
        videoListVC.categoryID = String(describing: id)
        self.navigationController?.pushViewController(videoListVC, animated: true)
    }
  
}




