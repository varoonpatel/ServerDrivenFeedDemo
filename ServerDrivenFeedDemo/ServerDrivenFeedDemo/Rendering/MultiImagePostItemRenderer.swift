//
//  MultiImagePostItemRenderer.swift
//  ServerDrivenFeedDemo
//
//  Created by Varun on 2026-08-24.
//

import SwiftUI

// MARK: MultiImagePostItemRenderer
struct MultiImagePostItemRenderer: FeedComponentRenderer {
    func render(item: FeedItem) -> AnyView {
        guard case let .multiImagePost(multiImagePost) = item else {
            return AnyView(EmptyView())
        }
        
        return AnyView(FeedMultiImagePostItemView(multiImagePost: multiImagePost))
    }
}
