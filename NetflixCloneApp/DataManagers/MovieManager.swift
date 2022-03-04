//
//  MovieManager.swift
//  NetflixCloneApp
//
//  Created by Rodrigo Hernández Ortiz on 18/02/22.
//

import Foundation
import UIKit

struct MovieManager {
    enum Section: String, CaseIterable {
        case HIGHLIGHTS = "Hightlights"
        case PREVIEW = "Preview"
        case POPULAR = "Popular on Netflix"
        case ANIME = "Anime"
    }

    static var movies = [
        Section.HIGHLIGHTS: [
            Movie(
                title: "Ice Road",
                headerImage: UIImage(named: "ice"),
                description: "Watch Movie"
            ),
            Movie(
                title: "Jurassic World",
                headerImage: UIImage(named: "jurassic"),
                description: "Watch Movie"
            )
        ],
        Section.PREVIEW: [
            Movie(title: "Ant Man" , thumbnail: UIImage(named: "antman")),
            Movie(title: "Ant Man" , thumbnail: UIImage(named: "antman")),
            Movie(title: "Ant Man" , thumbnail: UIImage(named: "antman")),
            Movie(title: "Ant Man" , thumbnail: UIImage(named: "antman")),
            Movie(title: "Ant Man" , thumbnail: UIImage(named: "antman")),
            Movie(title: "Ant Man" , thumbnail: UIImage(named: "antman")),
            Movie(title: "Ant Man" , thumbnail: UIImage(named: "antman")),
            Movie(title: "Ant Man" , thumbnail: UIImage(named: "antman")),
            Movie(title: "Ant Man" , thumbnail: UIImage(named: "antman")),
            
        ],
        Section.POPULAR: [
            Movie(title: "Harry Potter" , thumbnail: UIImage(named: "jurassic")),
            Movie(title: "Harry Potter" , thumbnail: UIImage(named: "jurassic")),
            Movie(title: "Harry Potter" , thumbnail: UIImage(named: "jurassic")),
            Movie(title: "Harry Potter" , thumbnail: UIImage(named: "jurassic")),
            Movie(title: "Harry Potter" , thumbnail: UIImage(named: "jurassic")),
        ],
        Section.ANIME: [
            Movie(title: "Avatar" , thumbnail: UIImage(named: "jurassic")),
            Movie(title: "Avatar" , thumbnail: UIImage(named: "jurassic")),
            Movie(title: "Avatar" , thumbnail: UIImage(named: "jurassic")),
            Movie(title: "Avatar" , thumbnail: UIImage(named: "jurassic"))
            
        ]
    ]
}
