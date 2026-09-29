//
//  FeedComponentType.swift
//  SwiftUITypedFeed
//
//  Created by Varun on 2026-08-24.
//

enum FeedComponentType {
    case textPost
    case imagePost
    case videoPost
    case multiImagePost
    case externalLinkPost
}

extension FeedItem {
    var componentType: FeedComponentType {
        switch self {
        case .textPost:
            return .textPost
        case .imagePost:
            return .imagePost
        case .videoPost:
            return .videoPost
        case .multiImagePost:
            return .multiImagePost
        case .externalLinkPost:
            return .externalLinkPost
        }
    }
}
