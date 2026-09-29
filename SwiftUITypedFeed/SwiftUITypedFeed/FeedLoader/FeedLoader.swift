//
//  FeedLoader.swift
//  SwiftUITypedFeed
//
//  Created by Varun on 2026-08-24.
//

import Foundation

protocol FeedLoader {
    func load(cursor: String?) throws -> FeedPage
}

final class LocalFeedLoader: FeedLoader {
    
    func load(cursor: String?) throws -> FeedPage {
        let fileURL = Bundle.main.url(forResource: "FeedResponse", withExtension: "json")!
        let data = try Data(contentsOf: fileURL)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        let feedResponse = try jsonDecoder.decode(FeedResponseDTO.self, from: data)
        return FeedPageMapper.map(from: feedResponse)
    }
}
