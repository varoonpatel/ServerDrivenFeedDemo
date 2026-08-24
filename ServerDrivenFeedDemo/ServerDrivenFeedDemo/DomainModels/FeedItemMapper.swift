//
//  FeedItemMapper.swift
//  ServerDrivenFeedDemo
//
//  Created by Varun on 2026-08-21.
//

enum FeedItemMapper {
    static func map(from feedItem: FeedItemType) -> FeedItem? {
        switch feedItem {
        case .text(let post):
            return .textPost(TextPost(
                id: post.id,
                author: post.author.toDomain(),
                content: post.content.text,
                createdAt: post.createdAt
            ))
            
        case .photo(let post):
            return .imagePost(
                ImagePost(
                    id: post.id,
                    author: post.author.toDomain(),
                    imageData: post.content.image.toDomain(),
                    createdAt: post.createdAt
                )
            )
            
        case .video(let post):
            return .videoPost(
                VideoPost(
                    id: post.id,
                    author: post.author.toDomain(),
                    videoData: post.content.video.toDomain(),
                    createdAt: post.createdAt
                )
            )
            
        case .multiPhoto(let post):
            return .multiImagePost(
                MultiImagePost(
                    id: post.id,
                    author: post.author.toDomain(),
                    images: post.content.images.map { $0.toDomain() },
                    createdAt: post.createdAt
                )
            )
        }
    }
}
