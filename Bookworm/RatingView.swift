//
//  RatingView.swift
//  Bookworm
//
//  Created by Mehmet Alp Sönmez on 12/06/2024.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    
    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColour = Color.gray
    var onColour = Color.yellow
    
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                Button {
                    print("tapped \(number)")
                    rating = number
                } label: {
                    image(for: number)
                        .foregroundStyle(number > rating ? offColour : onColour)
                }
            }
        }
        .buttonStyle(.plain)
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(5))
}
