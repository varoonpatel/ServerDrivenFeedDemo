//
//  FeedTextPostItemView.swift
//  ServerDrivenFeedDemo
//
//  Created by Varun on 2026-08-23.
//

import SwiftUI

struct FeedTextPostItemView: View {
    let textPost: TextPost
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            FeedPostHeaderView(feedPostItem: textPost)
            
            Text(textPost.content)
        }
    }
}

#Preview {
    FeedTextPostItemView(
        textPost: TextPost(
            id: "abc123",
            author: Author(id: "avatar123", name: "Test User", avatarURL: URL(string: "https://test.url")!),
            content: "This is test post",
            createdAt: Date(timeIntervalSince1970: 1_700_000_000)
        )
    )
}
