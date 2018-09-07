//
//  MoviesViewController.swift
//  Movie List
//
//  Created by Ilgar Ilyasov on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, MovieControllerDelegate, UITableViewDelegate, UITableViewDataSource, MoviesTableViewCellDelegate {
    
    var movieController: MovieController?
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableViewOutlet.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieController?.movies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableCell", for: indexPath) as? MoviesTableViewCell else { return UITableViewCell()}
        let movie = movieController?.movies[indexPath.row]
        cell.movieLabel.text = movie?.movie
        cell.delegate = self
        
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        self.movieController?.deleteMovie(index: indexPath.row)
        self.tableViewOutlet.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func heySeenUnseenButtonTapped(on cell: MoviesTableViewCell) {
        guard let indexPath = tableViewOutlet.indexPath(for: cell),
              let movie = movieController?.movies[indexPath.row] else { return }
        
        movieController?.seenUnseen(movie: movie)
    }
}
