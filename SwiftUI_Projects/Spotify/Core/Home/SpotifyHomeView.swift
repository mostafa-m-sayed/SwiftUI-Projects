//
//  SpotifyHomeView.swift
//  SwiftUI_Projects
//
//  Created by Mostafa Sayed on 16/12/2025.
//

import SwiftUI

struct SpotifyHomeView: View {
    @State private var currentUser: User?
    @State private var selectedCategory: Category = .all
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders]) {
                    Section {
                        ForEach(0..<20) { _ in
                            Rectangle()
                                .fill(Color.red)
                                .frame(width: 100, height: 100)
                        }
                    } header: {
                        categoryHeader
                    }
                }
                .padding(.top, 16)
            }
            .clipped()
        }
        .task {
            await getData()
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
    }

    private var categoryHeader: some View {
        HStack(spacing: 0) {
            ZStack { // reserve space for profile image
                if let user = currentUser {
                    ImageLoaderView(urlString: user.image)
                        .background(Color.spotifyWhite)
                        .clipShape(.circle)
                }
            }
            .frame(width: 35, height: 35)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        SpotifyCategoryCell(title: category.rawValue.capitalized, isSelected: selectedCategory == category)
                            .onTapGesture {
                                selectedCategory = category
                            }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .padding(.vertical, 24)
        .padding(.leading, 8)
        .background(Color.spotifyBlack)
    }
    
    
    private func getData() async {
        do {
            currentUser = try await DatabaseHelper().getUsers().randomElement()
        } catch {
            print("Error fetching data: \(error)")
        }
    }
}

#Preview {
    SpotifyHomeView()
}
