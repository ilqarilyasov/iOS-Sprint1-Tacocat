//
//  MovieController.swift
//  Movie List
//
//  Created by Ilgar Ilyasov on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class MovieController {
    private(set) var movies: [Movie] = []
    
    func createMovie(movie: String, hasSeen: Bool = false) {
        let newMovie = Movie(movie: movie, hasSeen: hasSeen)
        movies.append(newMovie)
    }
    
    func deleteMovie(index: Int) {
        movies.remove(at: index)
    }
    
    func seenUnseenStatus(movie: Movie) {
        if movie.hasSeen == true {
            movie.hasSeen = false
        } else {
            movie.hasSeen = true
        }
    }
}
