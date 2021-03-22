//
//  SubscriptionResponse.swift
//  YSignInAPI
//
//  Created by Satinder Panesar on 8/29/20.
//  Copyright © 2020 com.gwt. All rights reserved.
//

import Foundation
struct SubscribedChannelResponse: Codable {
    let items: [SubscriptionItems]
 }
struct SubscriptionItems: Codable {
    let snippet: Snippet
}
struct Snippet:Codable {
    let title: String
}
