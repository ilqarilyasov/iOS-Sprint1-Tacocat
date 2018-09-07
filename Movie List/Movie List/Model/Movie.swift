//
//  Movie.swift
//  Movie List
//
//  Created by Ilgar Ilyasov on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class Movie {
    
    let movie: String
    var hasSeen: Bool
    
    init(movie: String, hasSeen: Bool = false) {
        self.movie = movie
        self.hasSeen = hasSeen
    }
}
