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
   
    weak var delegate: MoviesTableViewCellDelegate?
    var movieController: MovieController?
    var movie: Movie?

    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var seenUnseenButton: UIButton!
    
    @IBAction func seenUnseenButtonTapped(_ sender: Any) {
        guard let movie = movie else { return }
        let title = movie.hasSeen ? "Seen" : "Unseen"
        seenUnseenButton.setTitle(title, for: .normal)
    }
}
