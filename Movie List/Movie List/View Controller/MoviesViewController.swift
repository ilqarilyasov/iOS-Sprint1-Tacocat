//
//  MoviesViewController.swift
//  Movie List
//
//  Created by Ilgar Ilyasov on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MovieControllerDelegate,  MoviesTableViewCellDelegate {
    
    var movieController: MovieController?
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.dataSource = self
        tableViewOutlet.delegate = self
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
        guard let movie = movieController?.movies[indexPath.row] else { return cell}
        
        cell.movie = movie
        cell.delegate = self
        
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        movieController?.deleteMovie(index: indexPath.row)
        tableViewOutlet.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func heySeenUnseenButtonTapped(on cell: MoviesTableViewCell) {
        guard let indexPath = tableViewOutlet.indexPath(for: cell),
              let movie = movieController?.movies[indexPath.row] else { return }
        
        movieController?.seenUnseenStatus(movie: movie)
        tableViewOutlet.reloadRows(at: [indexPath], with: .automatic)
    }
}
