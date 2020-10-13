//
//  MovieDetails.swift
//  movielist-training
//
//  Created by Izzan Oktiadi on 06/10/20.
//

import SwiftUI
import URLImage

struct MovieDetails: View {
    let base_url: String = "https://image.tmdb.org/t/p/original/"
    var movie: Movie
    var body: some View {
        VStack {
            URLImage(URL(string: "\(base_url)\(movie.poster_path)")!, delay: 0.25) {
                proxy in
                proxy.image.resizable()
                    .frame(width: UIScreen.main.bounds.height/8*3, height: UIScreen.main.bounds.height/2)
            }
            HStack {
                Text("Description").foregroundColor(.gray)
                Spacer()
            }
            Text(movie.overview).lineLimit(nil)
            Spacer()
        }.navigationBarTitle(Text(movie.title), displayMode: .inline)
        .padding()
    }
}
