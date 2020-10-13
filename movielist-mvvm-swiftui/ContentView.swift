//
//  ContentView.swift
//  movielist-mvvm-swiftui
//
//  Created by Izzan Oktiadi on 13/10/20.
//

import Foundation
import SwiftUI

struct ContentView : View {
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView {
            VStack {
                if networkManager.loading {
                    Text("Loading ...")
                } else {
                    List(networkManager.movies.results) { movie in
                        NavigationLink(destination: MovieDetails(movie: movie)){
                            MovieRow(movie: movie)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Movies"))
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
