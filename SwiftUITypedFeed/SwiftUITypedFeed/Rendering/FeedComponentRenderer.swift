//
//  FeedComponentRenderer.swift
//  SwiftUITypedFeed
//
//  Created by Varun on 2026-08-24.
//

import SwiftUI

protocol FeedComponentRenderer {
    func render(item: FeedItem) -> AnyView
}
