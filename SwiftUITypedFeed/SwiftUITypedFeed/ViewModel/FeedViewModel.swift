//
//  FeedViewModel.swift
//  SwiftUITypedFeed
//
//  Created by Varun on 2026-08-23.
//

import Observation

@MainActor @Observable
final class FeedViewModel {
    private(set) var feedRows: [FeedRow] = []
    
    @ObservationIgnored
    let feedRepository: FeedRepository
    @ObservationIgnored
    let feedAdManager: FeedAdManager
    
    init(feedRepository: FeedRepository, feedAdManager: FeedAdManager) {
        self.feedRepository = feedRepository
        self.feedAdManager = feedAdManager
    }
    
    func loadFeed() {
        do {
            let feedPage = try feedRepository.loadFeed(cursor: nil)
            let feedItems = feedAdManager.feedWithAds(feedItems: feedPage.items)
            feedRows.append(contentsOf: feedItems)
        } catch {
            print(error)
        }
    }
}
