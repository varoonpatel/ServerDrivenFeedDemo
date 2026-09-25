//
//  FeedItem.swift
//  ServerDrivenFeedDemo
//
//  Created by Varun on 2026-08-21.
//
import Foundation

enum FeedItem: Identifiable {
    case textPost(TextPost)
    case imagePost(ImagePost)
    case videoPost(VideoPost)
    case multiImagePost(MultiImagePost)
    case newsPost(NewsPost)
    
    var id: String {
        switch self {
        case .textPost(let post): return post.id
        case .imagePost(let post): return post.id
        case .videoPost(let post): return post.id
        case .multiImagePost(let post): return post.id
        case .newsPost(let post): return post.id
        }
    }
}
