//
//  FeedAdManager.swift
//  SwiftUITypedFeed
//
//  Created by Varun on 2026-09-29.
//

struct FeedAdManager {
    let adStrategy: AdStrategy
    
    func feedWithAds(feedItems: [FeedItem]) -> [FeedRow] {
        var rows: [FeedRow] = []
        rows.reserveCapacity(feedItems.count + feedItems.count / adStrategy.adInterval)

        for (index, item) in feedItems.enumerated() {
            rows.append(.item(item))

            if adStrategy.shouldShowAd(afterItemAt: index) {
                rows.append(.mediumRectangleAd(afterItemIndex: index))
            }
        }

        return rows
    }
}
