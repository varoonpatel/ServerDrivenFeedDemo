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
            ForEach(viewModel.feedRows) { row in
                switch row {
                case .item(let item):
                    VStack {
                        feedComponentRegistery.render(for: item.componentType)?.render(item: item)
                    }
                case .mediumRectangleAd:
                    FeedAdView()
                        .frame(width: 300, height: 250)
                        .frame(maxWidth: .infinity)
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
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
            feedRepository: DefaultFeedItemRepository(feedLoader: LocalFeedLoader()),
            feedAdManager: FeedAdManager(adStrategy: DefaultFeedAdStrategy())
        ),
        feedComponentRegistery: FeedComponentRegistry()
    )
}
