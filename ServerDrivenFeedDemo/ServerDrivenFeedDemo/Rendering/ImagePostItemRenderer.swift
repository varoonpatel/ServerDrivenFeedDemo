//
//  ImagePostItemRenderer.swift
//  ServerDrivenFeedDemo
//
//  Created by Varun on 2026-08-24.
//

import SwiftUI

// MARK: ImagePostItemRenderer
struct ImagePostItemRenderer: FeedComponentRenderer {
    func render(item: FeedItem) -> AnyView {
        guard case let .imagePost(imagePost) = item else {
            return AnyView(EmptyView())
        }
        
        return AnyView(FeedImagePostItemView(imagePost: imagePost))
    }
}
