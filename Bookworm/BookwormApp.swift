//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Mehmet Alp Sönmez on 12/06/2024.
//
import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
