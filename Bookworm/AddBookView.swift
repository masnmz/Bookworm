//
//  AddBookView.swift
//  Bookworm
//
//  Created by Mehmet Alp Sönmez on 12/06/2024.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                .listRowBackground(Color.lightBackground)
                
                Section("Write a Review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }
                .listRowBackground(Color.lightBackground)
                
                Section {
                    Button("Save") {
                        var newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        if review.isEmpty {
                            review = newBook.noReview(review: review)
                            newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        }
                        modelContext.insert(newBook)
                        dismiss()
                    }
                }
                .listRowBackground(Color.lightBackground)
                .disabled(validBook(title: title, author: author) == false)
            }
            .navigationTitle("Add Book")
            .scrollContentBackground(.hidden)
            .background(Color.darkBackGround)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    }
    func validBook(title: String, author: String) -> Bool {
        if title.isEmpty || author.isEmpty || title.count < 2 || author.count < 2 {
            return false
        }
        return true
    }
}

#Preview {
    AddBookView()
}
