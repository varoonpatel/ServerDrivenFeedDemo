//
//  FeedComponentType.swift
//  ServerDrivenFeedDemo
//
//  Created by Varun on 2026-08-24.
//

enum FeedComponentType {
    case textPost
    case imagePost
    case videoPost
    case multiImagePost
    case newsPost
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
        case .newsPost:
            return .newsPost
        }
    }
}
