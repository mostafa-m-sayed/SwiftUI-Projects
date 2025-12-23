//
//  SpotifyCategoryCell.swift
//  SwiftUI_Projects
//
//  Created by Mostafa Sayed on 16/12/2025.
//

import SwiftUI

struct SpotifyCategoryCell: View {
    var title: String = "Music"
    var isSelected: Bool
    var body: some View {
        Text(title)
            .frame(minWidth: 35)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .font(.callout.bold())
            .foregroundStyle(isSelected ? .spotifyBlack : .spotifyWhite)
            .background(isSelected ? Color.spotifyGreen : Color.spotifyDarkGray)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
    }
}

#Preview {
    ZStack {
        Color.spotifyBlack.ignoresSafeArea()

        VStack(spacing: 20) {
            SpotifyCategoryCell(isSelected: false)
            SpotifyCategoryCell(title: "Podcasts", isSelected: true)
            SpotifyCategoryCell(isSelected: true)
        }
        
    }
    
    
}
