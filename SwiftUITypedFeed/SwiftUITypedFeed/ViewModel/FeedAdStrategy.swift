//
//  FeedAdStrategy.swift
//  SwiftUITypedFeed
//
//  Created by Varun on 2026-09-29.
//

protocol AdStrategy {
    var adInterval: Int { get }
    func shouldShowAd(afterItemAt index: Int) -> Bool
}

struct DefaultFeedAdStrategy: AdStrategy {
    let adInterval: Int = 3
    
    func shouldShowAd(afterItemAt index: Int) -> Bool {
        (index + 1) % adInterval == 0
    }
}
