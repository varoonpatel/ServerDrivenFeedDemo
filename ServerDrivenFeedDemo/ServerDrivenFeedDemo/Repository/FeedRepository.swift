//
//  FeedRepository.swift
//  ServerDrivenFeedDemo
//
//  Created by Varun on 2026-08-21.
//

import Foundation

protocol FeedRepository {
    func loadFeed(cursor: String?) throws -> FeedPage
}

final class DefaultFeedItemRepository: FeedRepository {
    let feedLoader: FeedLoader
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    func loadFeed(cursor: String?) throws -> FeedPage {
        try feedLoader.load(cursor: cursor)
    }
}
