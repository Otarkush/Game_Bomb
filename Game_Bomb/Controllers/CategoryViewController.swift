//
//  CategoryViewController.swift
//  Game_Bomb
//
//  Created by user on 13.02.2025.
//

import UIKit

struct ElementKind {
    static let background = "background"
}

final class CategoryViewController: UIViewController {
    
    //MARK: - Private Property
    private var collectionView: UICollectionView!
    private let reuseIdentifier = "category"
    private let navigationBar = CustomNavigationBar()
    private let contentDataManager: IContentDataManager!
    
    //MARK: - Init
    init(contentDataManager: IContentDataManager) {
        self.contentDataManager = contentDataManager
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupBackground()
        configureCollectionView()
        setupNavigationBar()
    }

}


//MARK: - Setup Views
private extension CategoryViewController {
    func setupView() {
        
        let layout = createLayout()
        
        layout.register(
            SectionBackgroundDecorationView.self,
            forDecorationViewOfKind: ElementKind.background
        )
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        collectionView.register(
            CollectionCategoryCell.self,
            forCellWithReuseIdentifier: reuseIdentifier
        )
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(navigationBar.view)
        view.addSubview(collectionView)
    }
    
    func showMyViewControllerInACustomizedSheet() {
        
        let viewControllerToPresent = CategoryRulesViewController()
        
        viewControllerToPresent.preferredContentSize = CGSize(width: view.frame.width, height: 700)

        if let sheet = viewControllerToPresent.sheetPresentationController {
            let customDetent = UISheetPresentationController.Detent.custom(identifier: .medium) { context in
                return min(700, context.maximumDetentValue)
            }
            sheet.detents = [customDetent]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
            sheet.prefersGrabberVisible = true
        }
        present(viewControllerToPresent, animated: true, completion: nil)
    }
    
    func setupNavigationBar() {
        navigationBar.titleOfLabel.text = "Категории"
        navigationBar.iconRight.setImage(UIImage(resource:.yellowQuestionMark), for: .normal)
        navigationBar.iconRight.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        addChild(navigationBar)
        navigationBar.didMove(toParent: self)
    }

    @objc private func tapButton() {
        showMyViewControllerInACustomizedSheet()
    }
    
    func setupBackground() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(resource: .bgCategory)
        backgroundImage.contentMode = .scaleAspectFill
        self.view.addSubview(backgroundImage)
        self.view.sendSubviewToBack(backgroundImage)
    }
}


//MARK: - Settings layout
private extension CategoryViewController {
    func createLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .absolute(165)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        
        //Создаем группу
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(185)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        group.interItemSpacing = .fixed(24)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 24,
            bottom: 0,
            trailing: 24
        )
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    
    func configureCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            navigationBar.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            navigationBar.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.view.heightAnchor.constraint(equalToConstant: 60),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: navigationBar.view.bottomAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    
}

//MARK: - UICollectionViewDataSource
extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        contentDataManager.getModelData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CollectionCategoryCell else { return UICollectionViewCell()}
        
        let content = contentDataManager.getModelData()[indexPath.row]
        
        cell.configure(model: content)
        
        return cell
    }
}


extension CategoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionCategoryCell else { return }
        
        let item = self.contentDataManager.getModelData()[indexPath.row]
        self.contentDataManager.toggleSelected(item)
        cell.cellTapped()
    }
}
