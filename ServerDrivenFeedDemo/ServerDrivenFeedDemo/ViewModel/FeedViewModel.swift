//
//  FeedViewModel.swift
//  ServerDrivenFeedDemo
//
//  Created by Varun on 2026-08-23.
//

import Observation

@MainActor @Observable
final class FeedViewModel {
    private(set) var feedItems: [FeedItem] = []
    
    @ObservationIgnored
    let feedRepository: FeedRepository
    
    init(feedRepository: FeedRepository) {
        self.feedRepository = feedRepository
    }
    
    func loadFeed() {
        do {
            let feedPage = try feedRepository.loadFeed(cursor: nil)
            feedItems.append(contentsOf: feedPage.items)
        } catch {
            print(error)
        }
    }
}
