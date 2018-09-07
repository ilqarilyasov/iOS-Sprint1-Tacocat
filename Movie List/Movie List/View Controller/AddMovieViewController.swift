//
//  AddMovieViewController.swift
//  Movie List
//
//  Created by Ilgar Ilyasov on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController, MovieControllerDelegate {
    
    var movieController: MovieController?

    @IBOutlet weak var movieTitleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addMovieButtonTapped(_ sender: Any) {
        guard let title = movieTitleTextField.text else { return }
        
        movieController?.createMovie(movie: title, hasSeen: false)
    }
}
