//
//  FeedVideoPostItemView.swift
//  ServerDrivenFeedDemo
//
//  Created by Varun on 2026-08-23.
//

import SwiftUI

struct FeedVideoPostItemView: View {
    let videoPost: VideoPost
    
    var body: some View {
        VStack(alignment: .leading) {
            FeedPostHeaderView(feedPostItem: videoPost)
            
            AsyncImage(url: videoPost.videoData.thumbnailURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Image(systemName: "video")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(Color.gray.tertiary)
            }
            .overlay {
                Button {
                    
                } label: {
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .foregroundStyle(Color.gray)
                        .frame(width: 50, height: 50)
                }
                .buttonStyle(BorderlessButtonStyle())

            }
        }
    }
}

#Preview {
    FeedVideoPostItemView(
        videoPost: VideoPost(
            id: "id123",
            author: Author(id: "avatar123", name: "Test User", avatarURL: URL(string: "https://test.url")!),
            videoData: VideoData(id: "abc123", thumbnailURL: URL(string: "https://test.url")!, streamURL: URL(string: "https://test.url")!),
            createdAt: Date(timeIntervalSince1970: 1_700_000_000)
        )
    )
}
