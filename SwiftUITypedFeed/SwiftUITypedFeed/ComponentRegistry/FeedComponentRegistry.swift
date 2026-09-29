//
//  FeedComponentRegistry.swift
//  SwiftUITypedFeed
//
//  Created by Varun on 2026-08-24.
//

final class FeedComponentRegistry {
    private var renderers: [FeedComponentType: any FeedComponentRenderer] = [:]
    
    func register(type: FeedComponentType, renderer: any FeedComponentRenderer) {
        renderers[type] = renderer
    }
    
    func render(for type: FeedComponentType) -> (any FeedComponentRenderer)? {
        renderers[type]
    }
}
