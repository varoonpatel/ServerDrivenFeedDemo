//
//  FeedPostItem.swift
//  ServerDrivenFeedDemo
//
//  Created by Varun on 2026-08-24.
//
import Foundation

protocol FeedPostItem: Identifiable {
    var id: String { get }
    var author: Author { get }
    var createdAt: Date { get }
    var engagement: Engagement { get }
}

struct Engagement {
    let likes: Int
    let comments: Int
    let shares: Int
    
    var showLikesCount: Bool { likes > 0 }
    var showCommentsCount: Bool { comments > 0 }
    var showSharesCount: Bool { shares > 0 }
}

// MARK: TextPost
struct TextPost: FeedPostItem {
    let id: String
    let author: Author
    let content: String
    let createdAt: Date
    var engagement = Engagement(likes: 0, comments: 0, shares: 0)
}

// MARK: Author
struct Author {
    let id: String
    let name: String
    let avatarURL: URL
    var username: String? = nil
}

// MARK: ImagePost
struct ImagePost: FeedPostItem {
    let id: String
    let author: Author
    let imageData: ImageData
    let createdAt: Date
    var engagement = Engagement(likes: 0, comments: 0, shares: 0)
}

// MARK: ImageData
struct ImageData: Hashable {
    var id: String
    let url: URL
    let width: CGFloat
    let height: CGFloat
}

// MARK: VideoPost
struct VideoPost: FeedPostItem {
    let id: String
    let author: Author
    let videoData: VideoData
    let createdAt: Date
    var engagement = Engagement(likes: 0, comments: 0, shares: 0)
}

struct VideoData {
    var id: String
    let thumbnailURL: URL?
    let streamURL: URL
    var width: CGFloat = 0
    var height: CGFloat = 0
    var duration: Double? = nil
}

// MARK: MultiImagePost
struct MultiImagePost: FeedPostItem {
    let id: String
    let author: Author
    let images: [ImageData]
    let createdAt: Date
    var engagement = Engagement(likes: 0, comments: 0, shares: 0)
}

// MARK: ExternalLinkPost
struct ExternalLinkPost: FeedPostItem {
    let id: String
    let author: Author
    let text: String
    let url: URL
    let imageData: ImageData
    let createdAt: Date
    let engagement: Engagement
}
