//
//  FeedExternalLinkItemView.swift
//  ServerDrivenFeedDemo
//
//  Created by Varun on 2026-09-25.
//

import SwiftUI

struct FeedExternalLinkItemView: View {
    let externalLinkPost: ExternalLinkPost
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            FeedPostContainerView(feedPostItem: externalLinkPost) {
                AsyncImage(url: externalLinkPost.imageData.url) { image in
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
                .overlay(alignment: .bottom) {
                    Text(externalLinkPost.text)
                        .fontWeight(.semibold)
                        .lineLimit(3)
                        .foregroundStyle(Color.white)
                        .shadow(color: .black.opacity(0.5), radius: 3, x: 0, y: 2)
                        .padding(8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background {
                            LinearGradient(gradient: Gradient(colors: [.black.opacity(0.1), .black.opacity(0.4), .black.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                        }
                }
            }
        }
    }
}

#Preview {
    FeedExternalLinkItemView(
        externalLinkPost: ExternalLinkPost(
            id: "post_1009",
            author: Author(
                id: "source_302",
                name: "Sports Network",
                avatarURL: URL(string: "https://i.pravatar.cc/150?img=59")!,
                username: "sportsnetwork"
            ),
            text: "Five things to watch before tonight's biggest matchup",
            url: URL(string: "https://www.espn.com/nhl/story/_/id/50022825/nhl-2026-27-preview-guide-top-teams-players-storylines-trades-contracts-lapsed-fan")!,
            imageData: ImageData(
                id: "media_1009_1",
                url: URL(string: "https://images.unsplash.com/photo-1461896836934-ffe607ba8211?w=1200")!,
                width: 1200,
                height: 675
            ),
            createdAt: Date(),
            engagement: Engagement(likes: 202, comments: 20)
        )
    )
}
