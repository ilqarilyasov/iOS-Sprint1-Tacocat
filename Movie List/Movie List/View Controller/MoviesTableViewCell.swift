//
//  MoviesTableViewCell.swift
//  Movie List
//
//  Created by Ilgar Ilyasov on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

protocol MoviesTableViewCellDelegate: class {
    func heySeenUnseenButtonTapped(on cell: MoviesTableViewCell)
}

class MoviesTableViewCell: UITableViewCell, MovieControllerDelegate {
   
    var movieController: MovieController?
    var movie: Movie? {
        didSet { updateViews() }
    }
    weak var delegate: MoviesTableViewCellDelegate?
    
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var seenUnseenButton: UIButton!
    
    @IBAction func seenUnseenButtonTapped(_ sender: Any) {
        delegate?.heySeenUnseenButtonTapped(on: self)
    }
    
    func updateViews(){
        guard let movie = movie else { return }
        movieLabel.text = movie.movie
        
        if movie.hasSeen == true {
            seenUnseenButton.setTitle("Seen", for: .normal)
        } else {
            seenUnseenButton.setTitle("Unseen", for: .normal)
        }
    }
}
