//
//  ShowingVideoVC.swift
//  YSignInAPI
//
//  Created by Satinder Panesar on 9/3/20.
//  Copyright © 2020 com.gwt. All rights reserved.
//

import UIKit
import YoutubePlayer_in_WKWebView
class ShowingVideoVC: UIViewController {
    @IBOutlet weak var videoView: WKYTPlayerView!
    var videoPlayer = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        videoView.load(withVideoId:videoPlayer)
        videoView.delegate = self
     }
    
    func exitVideoScreen(){
    
    }
}
extension ShowingVideoVC: WKYTPlayerViewDelegate{
    func playerViewDidBecomeReady(_ playerView: WKYTPlayerView) {
        playerView.playVideo()
    }
}
