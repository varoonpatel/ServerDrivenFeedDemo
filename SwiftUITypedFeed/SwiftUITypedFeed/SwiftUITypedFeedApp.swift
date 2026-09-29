//
//  SwiftUITypedFeedApp.swift
//  SwiftUITypedFeed
//
//  Created by Varun on 2026-08-21.
//

import SwiftUI

@main
struct SwiftUITypedFeedApp: App {
    private let feedComponentRegistery: FeedComponentRegistry
    
    init () {
        feedComponentRegistery = FeedComponentRegistry()
        
        feedComponentRegistery.register(
            type: .textPost,
            renderer: TextPostItemRenderer()
        )
        
        feedComponentRegistery.register(
            type: .imagePost,
            renderer: ImagePostItemRenderer()
        )
        
        feedComponentRegistery.register(
            type: .videoPost,
            renderer: VideoPostItemRenderer()
        )
        
        feedComponentRegistery.register(
            type: .multiImagePost,
            renderer: MultiImagePostItemRenderer()
        )
        
        feedComponentRegistery.register(
            type: .externalLinkPost,
            renderer: ExternalLinkItemRenderer()
        )
    }
    
    var body: some Scene {
        WindowGroup {
            FeedView(
                viewModel: FeedViewModel(
                    feedRepository: DefaultFeedItemRepository(feedLoader: LocalFeedLoader())
                ),
                feedComponentRegistery: feedComponentRegistery
            )
        }
    }
}
