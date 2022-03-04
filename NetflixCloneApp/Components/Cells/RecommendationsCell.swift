//
//  RecommendationsCell.swift
//  NetflixCloneApp
//
//  Created by Rodrigo Hernández Ortiz on 18/02/22.
//

import UIKit

class RecommendationsCell: UICollectionViewCell, MovieCell {

    static let reuseIdentifier = String(describing: RecommendationsCell.self)

    @IBOutlet var movieImage: UIImageView!

    func showMovie(movie: Movie?) {

        movieImage.image = movie?.thumbnail

    }

    
}

