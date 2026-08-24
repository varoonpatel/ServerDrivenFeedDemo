//
//  FeedResponseDTO.swift
//  ServerDrivenFeedDemo
//
//  Created by Varun on 2026-08-21.
//

import Foundation

struct FeedResponseDTO: Decodable {
    let schemaVersion: Int
    let items: [FeedItemType]
    let pagination: FeedPaginationDTO
}

struct FeedPaginationDTO: Decodable {
    let nextCursor: String
    let hasMore: Bool
}

enum FeedType: String, Decodable, CaseIterable {
    case textPost = "text_post"
    case photoPost = "photo_post"
    case videoPost = "video_post"
    case multiPhotoPost = "multi_photo_post"
}

struct AuthorDTO: Decodable {
    let id: String
    let name: String
    let avatarURL: URL
}

struct TextPostDTO: Decodable {
    let id: String
    let type: FeedType
    let author: AuthorDTO
    let content: Content
    let createdAt: Date
    
    struct Content: Decodable {
        let text: String
    }
}

struct ImagePostDTO: Decodable {
    let id: String
    let type: FeedType
    let author: AuthorDTO
    let content: Content
    let createdAt: Date
    
    struct Content: Decodable {
        let image: ImageDataDTO
    }
}

struct ImageDataDTO: Decodable {
    let url: URL
    let width: Int
    let height: Int
}

struct VideoPostDTO: Decodable {
    let id: String
    let type: FeedType
    let author: AuthorDTO
    let content: Content
    let createdAt: Date
    
    struct Content: Decodable {
        let video: VideoDataDTO
    }
}

struct MultiPhotoPostDTO: Decodable {
    let id: String
    let type: FeedType
    let author: AuthorDTO
    let content: Content
    let createdAt: Date
    
    struct Content: Decodable {
        let images: [ImageDataDTO]
    }
}

struct VideoDataDTO: Decodable {
    let thumbnailURL: URL
    let streamURL: URL
}

enum FeedItemType: Decodable {
    case text(TextPostDTO)
    case photo(ImagePostDTO)
    case video(VideoPostDTO)
    case multiPhoto(MultiPhotoPostDTO)
    
    enum CodingKeys: CodingKey {
        case type
    }
    
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(FeedType.self, forKey: .type)
        
        switch type {
        case .textPost:
            self = .text(try TextPostDTO(from: decoder))
        case .photoPost:
            self = .photo(try ImagePostDTO(from: decoder))
        case .videoPost:
            self = .video(try VideoPostDTO(from: decoder))
        case .multiPhotoPost:
            self = .multiPhoto(try MultiPhotoPostDTO(from: decoder))
        }
    }
}

extension AuthorDTO {
    func toDomain () -> Author {
        .init(id: id, name: name, avatarURL: avatarURL)
    }
}

extension ImageDataDTO {
    func toDomain () -> ImageData {
        .init(url: url, width: CGFloat(width), height: CGFloat(height))
    }
}

extension VideoDataDTO {
    func toDomain () -> VideoData {
        .init(thumbnailURL: thumbnailURL, streamURL: streamURL)
    }
}
