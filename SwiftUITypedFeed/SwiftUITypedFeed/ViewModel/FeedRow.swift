//
//  FeedRow.swift
//  SwiftUITypedFeed
//
//  Created by Varun on 2026-09-29.
//

enum FeedRow: Identifiable {
    case item(FeedItem)
    case mediumRectangleAd(afterItemIndex: Int)

    var id: String {
        switch self {
        case .item(let item):
            return item.id
        case .mediumRectangleAd(let afterItemIndex):
            return "feed-ad-after-\(afterItemIndex)"
        }
    }
}
