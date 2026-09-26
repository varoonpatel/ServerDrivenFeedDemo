//
//  FeedPostEngegementFooterView.swift
//  ServerDrivenFeedDemo
//
//  Created by Varun on 2026-09-26.
//

import SwiftUI

struct FeedPostEngegementFooterView: View {
    let engegement: Engagement
    
    var body: some View {
        HStack(spacing: 16) {
            if engegement.showLikesCount {
                HStack(spacing: 4) {
                    Image(.icLike)
                        .foregroundStyle(.pink.gradient)
                    Text("\(engegement.likes.formatted(.number.notation(.compactName)))")
                }
            }
            
            if engegement.showCommentsCount {
                HStack {
                    Image(.icComment)
                        .foregroundStyle(.black)
                    Text("\(engegement.comments.formatted(.number.notation(.compactName)))")
                }
            }
            
            Image(.icShare)
                .foregroundStyle(.black)
                .offset(y: 1)
            
            Spacer()
        }
    }
}

#Preview {
    FeedPostEngegementFooterView(engegement: Engagement(likes: 10, comments: 200))
}
