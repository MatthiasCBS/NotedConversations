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
    @State private var showExampleView: Bool = false;
    var body: some Scene {
        WindowGroup {
            if showNewView {
                NewView(showNewView: $showNewView, showExampleView: $showExampleView)
            } else if (showExampleView && !showNewView) {
                ExampleView(showNewView: $showNewView, showExampleView: $showExampleView)
            } else {
                HomeView(showNewView: $showNewView, showExampleView: $showExampleView);
            }
        }
    }
}
