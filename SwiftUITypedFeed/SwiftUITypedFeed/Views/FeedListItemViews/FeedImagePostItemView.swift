//
//  FeedImagePostItemView.swift
//  SwiftUITypedFeed
//
//  Created by Varun on 2026-08-23.
//

import SwiftUI

struct FeedImagePostItemView: View {
    let imagePost: ImagePost
    
    var body: some View {
        VStack(spacing: 10) {
            FeedPostContainerView(feedPostItem: imagePost) {
                AsyncImage(url: imagePost.imageData.url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(Color.gray.tertiary)
                }
            }
        }
    }
}

#Preview {
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
