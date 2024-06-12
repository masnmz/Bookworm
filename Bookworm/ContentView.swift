//
//  ContentView.swift
//  Bookworm
//
//  Created by Mehmet Alp Sönmez on 12/06/2024.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColours = [Color.red, Color.yellow]
    var offColours = [Color(white: 0.6), Color(white: 0.41)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColours : offColours, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
        
    }
}

struct ContentView: View {
    @State private var rememberMe = false
    var body: some View {
        VStack {
            PushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "ON" : "OFF")
        }
    }
}

#Preview {
    ContentView()
}
