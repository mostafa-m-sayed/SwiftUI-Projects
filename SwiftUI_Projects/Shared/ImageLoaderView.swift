//
//  ImageLoaderView.swift
//  SwiftUI_Projects
//
//  Created by Mostafa Sayed on 09/12/2025.
//

import SwiftUI
import SDWebImageSwiftUI
struct ImageLoaderView: View {
    var urlString = Constants.randomImageURL
    var resizeMode: ContentMode = .fill
    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay {
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizeMode)
                    .allowsHitTesting(false)
                    
            }
            .clipped()
    }
}

#Preview {
    ImageLoaderView()
        .cornerRadius(30)
        .padding(40)
        .padding(.vertical, 60)
}
