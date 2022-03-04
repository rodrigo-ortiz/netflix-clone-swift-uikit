//
//  MovieCell.swift
//  NetflixCloneApp
//
//  Created by Rodrigo Hernández Ortiz on 18/02/22.
//

import UIKit

protocol MovieCell: UICollectionViewCell {
    func showMovie(movie: Movie?)
}
