//
//  VideoPostItemRenderer.swift
//  ServerDrivenFeedDemo
//
//  Created by Varun on 2026-08-24.
//

import SwiftUI

// MARK: VideoPostItemRenderer
struct VideoPostItemRenderer: FeedComponentRenderer {
    func render(item: FeedItem) -> AnyView {
        guard case let .videoPost(videoPost) = item else {
            return AnyView(EmptyView())
        }
        
        return AnyView(FeedVideoPostItemView(videoPost: videoPost))
    }
}
