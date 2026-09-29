//
//  FeedItem.swift
//  SwiftUITypedFeed
//
//  Created by Varun on 2026-08-21.
//
import Foundation

enum FeedItem: Identifiable {
    case textPost(TextPost)
    case imagePost(ImagePost)
    case videoPost(VideoPost)
    case multiImagePost(MultiImagePost)
    case externalLinkPost(ExternalLinkPost)
    
    var id: String {
        switch self {
        case .textPost(let post): return post.id
        case .imagePost(let post): return post.id
        case .videoPost(let post): return post.id
        case .multiImagePost(let post): return post.id
        case .externalLinkPost(let post): return post.id
        }
    }
}
