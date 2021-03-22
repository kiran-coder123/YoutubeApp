////
////  Sports.swift
////  YSignInAPI
////
////  Created by Satinder Panesar on 8/25/20.
////  Copyright © 2020 com.gwt. All rights reserved.
////
//
import Foundation
struct VideosResponse: Codable {
    let items: [VideoItems]
}
struct VideoItems: Codable {
    let id: VideoID
}
struct VideoID: Codable {
    let videoId: String
}
    


struct SubscribersResponse: Codable {
    let items: [SubsItems]
}
struct SubsItems: Codable {
    let snippet: SubsSnippet
}
struct SubsSnippet: Codable {
    let title: String
}
