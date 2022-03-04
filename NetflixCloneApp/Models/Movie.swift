//
//  Moview.swift
//  NetflixCloneApp
//
//  Created by Rodrigo Hernández Ortiz on 18/02/22.
//

import UIKit

struct Movie: Hashable {
    let title: String
    let headerImage: UIImage?
    let thumbnail: UIImage?
    let description: String?

    let identifier = UUID().uuidString

    init(title: String, headerImage: UIImage? = nil, thumbnail: UIImage? = nil, description: String? = nil) {
        self.title = title
        self.headerImage = headerImage
        self.thumbnail = thumbnail
        self.description = description
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }

    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}


