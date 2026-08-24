//
//  ServerDrivenFeedDemoApp.swift
//  ServerDrivenFeedDemo
//
//  Created by Varun on 2026-08-21.
//

import SwiftUI

@main
struct ServerDrivenFeedDemoApp: App {
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
