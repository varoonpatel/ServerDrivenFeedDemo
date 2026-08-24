//
//  FeedPostHeaderView.swift
//  ServerDrivenFeedDemo
//
//  Created by Varun on 2026-08-23.
//

import SwiftUI

struct FeedPostHeaderView: View {
    let feedPostItem: any FeedPostItem
    
    init(feedPostItem: any FeedPostItem) {
        self.feedPostItem = feedPostItem
    }
    
    var body: some View {
        HStack(spacing: 10) {
            AsyncImage(url: feedPostItem.author.avatarURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            } placeholder: {
                Image(systemName: "person.fill")
                    .resizable()
                    .padding(10)
                    .background(.gray.secondary)
                    .clipShape(Circle())
                    .frame(width: 40, height: 40)
            }
            
            VStack(alignment: .leading) {
                Text(feedPostItem.author.name)
                    .font(.headline)
                
                Text(feedPostItem.createdAt, style: .date)
                    .font(.footnote)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    FeedPostHeaderView(
        feedPostItem: TextPost(
            id: "abc123",
            author: Author(id: "avatar123", name: "Test User", avatarURL: URL(string: "https://test.url")!),
            content: "This is test post",
            createdAt: Date(timeIntervalSince1970: 1_700_000_000)
        )
    )
}
