//
//  FeedPostContainerView.swift
//  SwiftUITypedFeed
//
//  Created by Varun on 2026-09-26.
//

import SwiftUI

struct FeedPostContainerView<Content: View>: View {
    let feedPostItem: any FeedPostItem
    let content: () -> Content

    var body: some View {
        VStack(spacing: 10) {
            FeedPostHeaderView(feedPostItem: feedPostItem)
            content()
            FeedPostEngegementFooterView(engegement: feedPostItem.engagement)
        }
    }
}

#Preview {
    FeedPostContainerView(feedPostItem: ImagePost(
        id: "id123",
        author: Author(id: "avatar123", name: "Test User", avatarURL: URL(string: "https://test.url")!),
        imageData: ImageData(id: "abc123", url: URL(string: "https://test.url")!, width: 600, height: 600),
        createdAt: Date(timeIntervalSince1970: 1_700_000_000),
        engagement: Engagement(likes: 10, comments: 200)
    )) {
        FeedImagePostItemView(
            imagePost: ImagePost(
                id: "id123",
                author: Author(id: "avatar123", name: "Test User", avatarURL: URL(string: "https://test.url")!),
                imageData: ImageData(id: "abc123", url: URL(string: "https://test.url")!, width: 600, height: 600),
                createdAt: Date(timeIntervalSince1970: 1_700_000_000),
                engagement: Engagement(likes: 10, comments: 200)
            )
        )
    }
}
