//
//  NetworkManager.swift
//  movielist-training
//
//  Created by Izzan Oktiadi on 06/10/20.
//

import Foundation
import Combine

class NetworkManager: ObservableObject {
    @Published var movies = MovieList(results: [])
    @Published var loading = false
    private let api_key = "" //Your own apikey
    private let api_url_base = "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key="
    
    var didChange = PassthroughSubject<Data, Never>()
    
    init() {
        loading = true
        loadDataNormal()
    }
    
    private func loadDataNormal() {
        guard let url = URL(string: "\(api_url_base)\(api_key)") else { return }
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            guard let data = data else { return }
            let movies = try! JSONDecoder().decode(MovieList.self, from: data)
            DispatchQueue.main.async {
                self.movies = movies
                self.loading = false
            }
        }.resume()
    }
}

