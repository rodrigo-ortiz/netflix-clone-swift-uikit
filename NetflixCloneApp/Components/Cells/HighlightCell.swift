//
//  HighlightCell.swift
//  NetflixCloneApp
//
//  Created by Rodrigo Hernández Ortiz on 18/02/22.
//

import UIKit

class HighlightCell: UICollectionViewCell, MovieCell {

    static let reuseIdentifier = String(describing: HighlightCell.self)

    @IBOutlet var image: UIImageView!
    @IBOutlet var button: UIButton!

    func showMovie(movie: Movie?) {
        image.image = movie?.headerImage
        button.setTitle(movie?.description, for: .normal)
    }
}
