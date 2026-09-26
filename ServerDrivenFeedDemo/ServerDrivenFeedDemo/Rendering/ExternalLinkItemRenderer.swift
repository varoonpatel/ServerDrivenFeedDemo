//
//  ExternalLinkItemRenderer.swift
//  ServerDrivenFeedDemo
//
//  Created by Varun on 2026-09-25.
//
import SwiftUI

struct ExternalLinkItemRenderer: FeedComponentRenderer {
    func render(item: FeedItem) -> AnyView {
        guard case let .externalLinkPost(externalLinkPost) = item else {
            return AnyView(EmptyView())
        }
        
        return AnyView(FeedExternalLinkItemView(externalLinkPost: externalLinkPost))
    }
}
