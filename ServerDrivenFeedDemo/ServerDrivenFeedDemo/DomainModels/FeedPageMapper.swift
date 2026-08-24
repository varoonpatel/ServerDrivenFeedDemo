//
//  FeedPageMapper.swift
//  ServerDrivenFeedDemo
//
//  Created by Varun on 2026-08-21.
//

enum FeedPageMapper {
    static func map(from FeedResponseDTO: FeedResponseDTO) -> FeedPage {
        FeedPage(
            items: FeedResponseDTO.items.compactMap { FeedItemMapper.map(from: $0) },
            nextCursor: FeedResponseDTO.pagination.nextCursor,
            hasMore: FeedResponseDTO.pagination.hasMore
        )
    }
}
