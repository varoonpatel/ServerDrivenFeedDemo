import Foundation

struct FeedResponseDTO: Decodable {
    let items: [FeedItemType]
    let pagination: FeedPaginationDTO
}

struct FeedPaginationDTO: Decodable {
    let nextCursor: String?
    let hasMore: Bool
    let limit: Int?
}

enum FeedType: String, Decodable {
    case text
    case image
    case multipleImages
    case video
    case news
}

struct AuthorDTO: Decodable {
    let id: String
    let name: String
    let username: String?
    let avatarURL: URL

    func toDomain() -> Author {
        Author(id: id, name: name, avatarURL: avatarURL, username: username)
    }
}

struct EngagementDTO: Decodable {
    let likes: Int
    let comments: Int
    let shares: Int

    func toDomain() -> Engagement {
        Engagement(likes: likes, comments: comments, shares: shares)
    }
}

struct MediaDTO: Decodable {
    let id: String
    let type: String
    let url: URL
    let thumbnailURL: URL?
    let width: Int
    let height: Int
    let duration: Double?

    func toImageDomain() -> ImageData {
        ImageData(
            id: id,
            url: url,
            width: CGFloat(width),
            height: CGFloat(height)
        )
    }

    func toVideoDomain() -> VideoData {
        VideoData(
            id: id,
            thumbnailURL: thumbnailURL,
            streamURL: url,
            width: CGFloat(width),
            height: CGFloat(height),
            duration: duration
        )
    }
}

struct FeedContentDTO: Decodable {
    let text: String?
    let headline: String?
    let summary: String?
    let url: URL?
}

struct FeedItemDTO: Decodable {
    let id: String
    let type: FeedType
    let createdAt: Date
    let author: AuthorDTO
    let content: FeedContentDTO
    let media: [MediaDTO]?
    let engagement: EngagementDTO
}

enum FeedItemType: Decodable {
    case item(FeedItemDTO)

    enum CodingKeys: String, CodingKey { case type }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        _ = try container.decode(FeedType.self, forKey: .type)
        self = .item(try FeedItemDTO(from: decoder))
    }
}
