//
//  FeedMultiImagePostItemView.swift
//  SwiftUITypedFeed
//
//  Created by Varun on 2026-08-23.
//

import SwiftUI

struct FeedMultiImagePostItemView: View {
    let multiImagePost: MultiImagePost
    
    var body: some View {
        VStack(alignment: .leading) {
            FeedPostContainerView(feedPostItem: multiImagePost) {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 20) {
                        ForEach(multiImagePost.images, id: \.self) { image in
                            AsyncImage(url: image.url) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(8)
                            } placeholder: {
                                Image(systemName: "photo")
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundStyle(Color.gray.tertiary)
                            }
                            .frame(width: 280)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
            }
        }
    }
}

#Preview {
    FeedMultiImagePostItemView(
        multiImagePost: MultiImagePost(
            id: "id123",
            author: Author(id: "avatar123", name: "Test User", avatarURL: URL(string: "https://test.url")!),
            images: [
                ImageData(id: "abc123", url: URL(string: "https://test.url")!, width: 600, height: 600),
                ImageData(id: "abc124", url: URL(string: "https://test2.url")!, width: 600, height: 600),
                ImageData(id: "abc125",url: URL(string: "https://test3.url")!, width: 600, height: 600)
            ],
            createdAt: Date(timeIntervalSince1970: 1_700_000_000),
            engagement: Engagement(likes: 10, comments: 200)
        )
    )
}
