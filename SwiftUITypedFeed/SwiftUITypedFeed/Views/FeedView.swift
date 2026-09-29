//
//  FeedView.swift
//  SwiftUITypedFeed
//
//  Created by Varun on 2026-08-23.
//

import SwiftUI

struct FeedView: View {
    @State private var viewModel: FeedViewModel
    let feedComponentRegistery: FeedComponentRegistry
    
    init(viewModel: FeedViewModel, feedComponentRegistery: FeedComponentRegistry) {
        _viewModel = State(wrappedValue: viewModel)
        self.feedComponentRegistery = feedComponentRegistery
    }
    
    var body: some View {
        List {
            ForEach(viewModel.feedItems) { item in
                VStack {
                    feedComponentRegistery.render(for: item.componentType)?.render(item: item)
                }
            }
        }
        .listStyle(.plain)
        .selectionDisabled(true)
        .onAppear {
            viewModel.loadFeed()
        }
    }
}

#Preview {
    FeedView(
        viewModel: FeedViewModel(
            feedRepository: DefaultFeedItemRepository(feedLoader: LocalFeedLoader())
        ),
        feedComponentRegistery: FeedComponentRegistry()
    )
}
