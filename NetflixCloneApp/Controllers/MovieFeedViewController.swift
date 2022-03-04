//
//  ViewController.swift
//  NetflixCloneApp
//
//  Created by Rodrigo Hernández Ortiz on 17/02/22.
//

import UIKit

typealias MoviesDataSource = UICollectionViewDiffableDataSource<MovieManager.Section, Movie>

class MovieFeedViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    private var dataSource: MoviesDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }

    private func configureCollectionView() {
        // Configure CollectionView
        setNavigationBarImage()

        collectionView.register(TitleHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleHeaderView.reuseIdentifier)

        collectionView.delegate = self

        //Configure collectionView Layout
        collectionView.collectionViewLayout = configureCollectionViewLayout()

        //Configure datasource
        configureDataSource()

        //ConfigureSnapshot
        configureSnapshot()

        self.navigationController?.hidesBarsOnSwipe = true


    }

    private func setNavigationBarImage() {
        let logo = UIImage(named: "logo")

        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView


    }

}

// MARK: - Collection View -
extension MovieFeedViewController {
    func configureCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let sectionProvider = { (sectionIndex: Int, layoutEnviroment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            var section: NSCollectionLayoutSection?

            switch sectionIndex {
            case 0:
                section = self.getHighlightSection()
            case 1:
                section = self.getPreviewSection()
            case 2:
                section = self.getRecommendationsSection()
            default:
                section = self.getRecommendationsSection() // Add Other Sections
            }

            return section

        }

        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
    }

    private func getHighlightSection() -> NSCollectionLayoutSection? {

        // Create Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        // Create Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        // Create Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        return section

    }

    private func getPreviewSection() -> NSCollectionLayoutSection? {

        // Create Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        // Create Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        // Create Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        section.boundarySupplementaryItems = getHeader()

        return section

    }

    private func getRecommendationsSection() -> NSCollectionLayoutSection? {

        // Create Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)

        // Create Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(0.22))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        // Create Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        section.boundarySupplementaryItems = getHeader()

        return section

    }

    private func getHeader() -> [NSCollectionLayoutBoundarySupplementaryItem]  {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)

        return [sectionHeader]
    }
}

// MARK: - Diffable Data Source -
extension MovieFeedViewController {

    func configureDataSource() {
        dataSource = MoviesDataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, movie: Movie) -> UICollectionViewCell? in

            let reuseIdentifier: String

            switch indexPath.section {
                case 0: reuseIdentifier = HighlightCell.reuseIdentifier
                case 1: reuseIdentifier = PreviewCell.reuseIdentifier
                case 2: reuseIdentifier = RecommendationsCell.reuseIdentifier
                default: reuseIdentifier = RecommendationsCell.reuseIdentifier
            }
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? MovieCell else { fatalError() }

            let section = MovieManager.Section.allCases[indexPath.section]
            cell.showMovie(movie: MovieManager.movies[section]?[indexPath.item])

            return cell

        }

        dataSource.supplementaryViewProvider = { [weak self] (collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? in

            if let self = self, let headerSupplementaryView =
                collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleHeaderView.reuseIdentifier , for: indexPath) as? TitleHeaderView {

                let section = self.dataSource.snapshot().sectionIdentifiers[indexPath.section]
                headerSupplementaryView.textLabel.text = section.rawValue

                return headerSupplementaryView
            }
            return nil
        }

    }

    func configureSnapshot() {
        var currentSnapshot = NSDiffableDataSourceSnapshot<MovieManager.Section, Movie>()

        MovieManager.Section.allCases.forEach{ collection in
            currentSnapshot.appendSections([collection])
            if let movies = MovieManager.movies[collection] {
                currentSnapshot.appendItems(movies)
            }
        }

        dataSource.apply(currentSnapshot, animatingDifferences: false)
    }

}

extension MovieFeedViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = dataSource.itemIdentifier(for: indexPath)
        print(movie?.title ?? "Title is nil")
    }
}
