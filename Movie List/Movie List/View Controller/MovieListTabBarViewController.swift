//
//  MovieListTabBarViewController.swift
//  Movie List
//
//  Created by Ilgar Ilyasov on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MovieListTabBarViewController: UITabBarController {

    let movieController = MovieController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passMovieControllerToChildViewControllers()
    }
    
    func passMovieControllerToChildViewControllers(){
        guard let viewControllers = viewControllers else { return }
        
        for viewController in viewControllers {
            if let viewController = viewController as? MovieControllerDelegate {
                viewController.movieController = movieController
            }
        }
    }
}
