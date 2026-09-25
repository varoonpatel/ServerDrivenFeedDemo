import Foundation

enum FeedItemMapper {
    static func map(from feedItem: FeedItemType) -> FeedItem? {
        guard case let .item(dto) = feedItem else { return nil }
        let images = (dto.media ?? []).filter { $0.type == "image" }.map { $0.toImageDomain() }
        let videos = (dto.media ?? []).filter { $0.type == "video" }.map { $0.toVideoDomain() }
        let engagement = dto.engagement.toDomain()

        switch dto.type {
        case .text:
            return .textPost(
                TextPost(
                    id: dto.id,
                    author: dto.author.toDomain(),
                    content: dto.content.text ?? "",
                    createdAt: dto.createdAt,
                    engagement: engagement
                )
            )
        case .image:
            guard let image = images.first else { return nil }
            return .imagePost(
                ImagePost(
                    id: dto.id,
                    author: dto.author.toDomain(),
                    imageData: image,
                    createdAt: dto.createdAt,
                    engagement: engagement
                )
            )
        case .multipleImages:
            return .multiImagePost(
                MultiImagePost(
                    id: dto.id,
                    author: dto.author.toDomain(),
                    images: images,
                    createdAt: dto.createdAt,
                    engagement: engagement
                )
            )
        case .video:
            guard let video = videos.first else { return nil }
            return .videoPost(
                VideoPost(
                    id: dto.id,
                    author: dto.author.toDomain(),
                    videoData: video,
                    createdAt: dto.createdAt,
                    engagement: engagement
                )
            )
        case .news:
            guard let headline = dto.content.headline, let summary = dto.content.summary, let url = dto.content.url else { return nil }
            return .newsPost(
                NewsPost(
                    id: dto.id,
                    author: dto.author.toDomain(),
                    headline: headline,
                    summary: summary,
                    url: url,
                    imageData: images.first,
                    createdAt: dto.createdAt,
                    engagement: engagement
                )
            )
        }
    }
}
