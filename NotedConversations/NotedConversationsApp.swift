//
//  NotedConversationsApp.swift
//  NotedConversations
//
//  Created by Matthew Jacobson on 10/30/23.
//

import SwiftUI

@main
struct NotedConversationsApp: App {
    @State private var showHomeView: Bool = true;
    @State private var showNewView: Bool = false;
    @State private var showExampleView: Bool = false;
    @StateObject private var noteManager = NoteManager()
    var body: some Scene {
        WindowGroup {
            if showNewView {
                NewView(showHomeView: $showHomeView, noteManager: noteManager, showNewView: $showNewView, showExampleView: $showExampleView)
            } else if (showExampleView && !showNewView && !showHomeView) {
                ExampleView(showHomeView: $showHomeView, showNewView: $showNewView, showExampleView: $showExampleView)
            } else if (showHomeView && !showNewView && !showExampleView) {
                HomeView(showHomeView: $showHomeView, showNewView: $showNewView, showExampleView: $showExampleView, noteManager: noteManager);
            }
        }
    }
}
