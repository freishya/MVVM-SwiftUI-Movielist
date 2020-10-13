//
//  MovieRow.swift
//  movielist-training
//
//  Created by Izzan Oktiadi on 06/10/20.
//

import SwiftUI
import URLImage

struct MovieRow: View {
    let base_url: String = "https://image.tmdb.org/t/p/original/"
    var movie: Movie
    var body: some View {
        HStack {
            URLImage(URL(string: "\(base_url)\(movie.poster_path)")!, delay: 0.25) {
                proxy in
                proxy.image.resizable()
                    .frame(width: 90, height: 120)
            }
            
            VStack {
                Spacer()
                HStack {
                    Text(movie.title)
                        .foregroundColor(.blue)
                        .lineLimit(nil)
                }
                HStack {
                    Text(movie.release_date).foregroundColor(.gray)
                    Spacer()
                    Text("Rate: \(movie.vote_average.format())")
                }
                HStack {
                    Text("Vote count: \(movie.vote_count)")
                        .foregroundColor(.gray)
                        .lineLimit(nil)
                    Spacer()
                }
                HStack {
                    Text("Popularity: \(movie.popularity)")
                        .foregroundColor(.gray)
                        .lineLimit(nil)
                    Spacer()
                }
                Spacer()
            }
        }.frame(height: 130)
    }
}

extension Float {
    func format() -> String {
        return String(format: "%.2f", self)
    }
}

#if DEBUG
struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
#endif
