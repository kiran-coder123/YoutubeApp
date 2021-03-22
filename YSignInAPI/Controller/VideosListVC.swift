//
//  VideosListVC.swift
//  YSignInAPI
//
//  Created by Prashant Gaikwad on 03/09/20.
//  Copyright © 2020 com.gwt. All rights reserved.
//

import UIKit

class VideosListVC: UIViewController,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var tblViewVideoList: UITableView!
    var categoryID: String = ""
    // video list array
    var arrVideoList = [VideoItems]()
    var limit = 0
    var totalItems = 50
    override func viewDidLoad() {
        super.viewDidLoad()
   
     //  tblViewVideoList.tableFooterView = UIView(frame:.zero)
        // Do any additional setup after loading the view.
        search(by: String(describing: categoryID))
    }
    
    /*
     'https://www.googleapis.com/youtube/v3/search?part=snippet&type=video&videoCategoryId=2&key=[YOUR_API_KEY]' \
     */
    func search(by id: String) {
        let searchURL = URL(string:"https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&type=video&videoCategoryId=\(id)&key=AIzaSyCmmJ_jiE1T3KTzTTxzWyTIB6vXIGQm2Ro")
        
        URLSession.shared.dataTask(with: searchURL!) { (data, _, _) in
            if let data = data {
                //print(data)
                let videoList =  try? JSONDecoder().decode( VideosResponse.self, from: data)
                self.arrVideoList = videoList!.items
                print(self.arrVideoList)
                DispatchQueue.main.async {
                    self.tblViewVideoList.reloadData()
                }
            }
        }.resume()
    }
    
    
    // Tableview Method's
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrVideoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblViewVideoList.dequeueReusableCell(withIdentifier: "VideoListCell", for: indexPath) as! VideoVCTableViewCell
        cell.lblVideoListTitle.text = "Video Title: \(arrVideoList[indexPath.row].id.videoId)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = self.storyboard?.instantiateViewController(identifier: "ShowingVideoVC") as! ShowingVideoVC
        storyboard.videoPlayer = arrVideoList[indexPath.row].id.videoId
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//          if indexPath.row == arrVideoList.count - 1 {
//              // more data
//              moreData()
//          }
//      }
//      func moreData(){
//          for _ in 0...19{
//            arrVideoList.append(arrVideoList.last!)
//
//          }
//          self.tblViewVideoList.reloadData()
//      }
//
    
}


