//
//  TitleHeaderView.swift
//  NetflixCloneApp
//
//  Created by Rodrigo Hernández Ortiz on 19/02/22.
//

import UIKit

class TitleHeaderView: UICollectionReusableView {

    static let reuseIdentifier = String(describing: TitleHeaderView.self)

    let textLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    private func configure() {
        addSubview(textLabel)
        textLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        textLabel.textColor = .white
        textLabel.translatesAutoresizingMaskIntoConstraints = false

        let inset: CGFloat = 10
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant:  inset),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -inset),
            textLabel.topAnchor.constraint(equalTo: topAnchor, constant:  inset),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant:  -inset)
        ])
    }
}
