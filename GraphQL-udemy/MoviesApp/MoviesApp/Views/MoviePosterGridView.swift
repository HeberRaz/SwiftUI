//
//  MoviePosterGridView.swift
//  MoviesApp
//
//  Created by Heber Alvarez on 20/12/23.
//

import SwiftUI

struct MoviePosterGridView: View {
    let posters: [PosterViewModel]
    @Binding var selectedPoster: String
    @State var springValue = 0

    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], content: {
            ForEach(posters, id: \.id) { poster in
                VStack {
                    URLImage(url: poster.poster)
                        .frame(width: 100, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .onTapGesture {
                            withAnimation(.none) {
                                selectedPoster = poster.poster
                                springValue += 1
                            }
                        }
                        .shadow(color: .gray, radius: 6, x: 8, y: 8)
                        .shadow(color: .white, radius: 6, x: -8, y: -8)
                        .overlay(
                            ZStack {
                                Rectangle()
                                    .fill(Color.secondary)
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.white)
                            }
                                .frame(maxHeight: isSelected(poster: poster.poster) ? 44 : 0)
                                .clipped()
                                .animation(.spring, value: springValue)
                            , alignment: .bottom
                        )
                }
            }
        })
    }

    func isSelected(poster: String) -> Bool {
        return selectedPoster == poster
    }
}

struct MoviePosterGridView_Previews: PreviewProvider {
    static var previews: some View {
        let movie = Movie(title: "Batman", year: "2002", poster: "https://m.media-amazon.com/images/M/MV5BMTdjZTliODYtNWExMi00NjQ1LWIzN2MtN2Q5NTg5NTk3NzliL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg", imdbId: "tt4853102")

        return MoviePosterGridView(posters: [.init(movie: movie)], selectedPoster: .constant(""))
    }
}
