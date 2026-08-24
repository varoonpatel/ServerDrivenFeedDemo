//
//  TextPostItemRenderer.swift
//  ServerDrivenFeedDemo
//
//  Created by Varun on 2026-08-24.
//

import SwiftUI

// MARK: TextPostItemRenderer
struct TextPostItemRenderer: FeedComponentRenderer {
    func render(item: FeedItem) -> AnyView {
        guard case let .textPost(textPost) = item else {
            return AnyView(EmptyView())
        }

        return AnyView(FeedTextPostItemView(textPost: textPost))
    }
}
