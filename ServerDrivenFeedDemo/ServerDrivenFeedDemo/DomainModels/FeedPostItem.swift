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
}

// MARK: TextPost
struct TextPost: FeedPostItem {
    let id: String
    let author: Author
    let content: String
    let createdAt: Date
}

// MARK: Author
struct Author {
    let id: String
    let name: String
    let avatarURL: URL
}

// MARK: ImagePost
struct ImagePost: FeedPostItem {
    let id: String
    let author: Author
    let imageData: ImageData
    let createdAt: Date
}

// MARK: ImageData
struct ImageData: Hashable {
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
}

struct VideoData {
    let thumbnailURL: URL
    let streamURL: URL
}

// MARK: MultiImagePost
struct MultiImagePost: FeedPostItem {
    let id: String
    let author: Author
    let images: [ImageData]
    let createdAt: Date
}
