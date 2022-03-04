//
//  PreviewCell.swift
//  NetflixCloneApp
//
//  Created by Rodrigo Hernández Ortiz on 18/02/22.
//

import UIKit

class PreviewCell: UICollectionViewCell, MovieCell {

    static let reuseIdentifier = String(describing: PreviewCell.self)

    @IBOutlet var image: UIImageView!
    @IBOutlet var title: UILabel!
    var gradientAdded = false

    func showMovie(movie: Movie?) {

        image.makeRounded(borderColor: CGColor(red: 255, green: 255, blue: 240, alpha: 1))

        if !gradientAdded {
            gradientAdded = true
            image.addGradient()
        }

        image.image = movie?.thumbnail
        title.text = movie?.title
    }
    
}
