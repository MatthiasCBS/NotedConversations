//
//  NotedConversationsApp.swift
//  NotedConversations
//
//  Created by Matthew Jacobson on 10/30/23.
//

import SwiftUI

@main
struct NotedConversationsApp: App {
    @State private var showNewView: Bool = false;
    var body: some Scene {
        WindowGroup {
            if showNewView {
                NewView(showNewView: $showNewView)
            } else {
                HomeView(showNewView: $showNewView);
            }
        }
    }
}
