//
//  CategoryViewController.swift
//  Game_Bomb
//
//  Created by user on 13.02.2025.
//

import UIKit

struct ElementKind {
    static let badge = "badge"
    static let background = "background"
}

final class CategoryViewController: UIViewController {
    
    //MARK: - Private Property
    private var collectionView: UICollectionView!
    private let reuseIdentifier = "category"
   // private var modelArray: [Model] = []
    private let contentManager: IContentManager
    private var isChecked: Bool
  
    
    //MARK: - Init
    init(contentModel: IContentManager) {
        self.contentManager = contentModel
        self.isChecked = false
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        //getQuestions()
        setupBackground()
        configureCollectionView()
    }
    

    
//    private func getQuestions() {
//        guard let manager = contentManager else {return}
//        modelArray = manager.getModel()
//    }
}


//MARK: - Setup Views
private extension CategoryViewController {
    func setupView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())

                let layout = createLayout()
        
                layout.register(
                    SectionBackgroundDecorationView.self,
                    forDecorationViewOfKind: ElementKind.background
                )
                collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(
            CollectionCategoryCell.self,
            forCellWithReuseIdentifier: reuseIdentifier
        )
        
        collectionView.register(
            BadgeView.self,
            forSupplementaryViewOfKind: ElementKind.badge,
            withReuseIdentifier: BadgeView.reuseIdentifier
        )
        
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
    }
    
    func setupBackground() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(resource: .bg)
        backgroundImage.contentMode = .scaleAspectFill
        self.view.addSubview(backgroundImage)
        self.view.sendSubviewToBack(backgroundImage)
    }
}


//MARK: - Settings layout
private extension CategoryViewController {
    func createLayout() -> UICollectionViewLayout {
        
        let supplementaryItem = createSupplementaryItems()
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .absolute(200)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize, supplementaryItems: [supplementaryItem])
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        
        //Создаем группу
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(220)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        group.interItemSpacing = .fixed(30)
        
                let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: ElementKind.background)
                sectionBackgroundDecoration.contentInsets = NSDirectionalEdgeInsets(
                    top: 5,
                    leading: 5,
                    bottom: 5,
                    trailing: 5
                )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 24,
            bottom: 10,
            trailing: 24
        )
         section.decorationItems = [sectionBackgroundDecoration]
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    func createSupplementaryItems() -> NSCollectionLayoutSupplementaryItem {
        let supplementaryItemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(24),
            heightDimension: .absolute(24)
        )
        
        let constraints = NSCollectionLayoutAnchor(
            edges: [.top, .leading],
            absoluteOffset: CGPoint(x: 8, y: 8)
        )
        
        let supplementaryItem = NSCollectionLayoutSupplementaryItem(
            layoutSize: supplementaryItemSize,
            elementKind: ElementKind.badge,
            containerAnchor: constraints
        )
        return supplementaryItem
    }
    
    
    func configureCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

//MARK: - UICollectionViewDataSource
extension CategoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        contentManager.getModel().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CollectionCategoryCell else { return UICollectionViewCell()}

        
        let content = contentManager.getModel()[indexPath.row]
     
//        if content.isMark == true {
//            cell.cellTapped()
//        }
        
        cell.configure(model: content)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == ElementKind.badge {
            let badge = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BadgeView.reuseIdentifier, for: indexPath) as! BadgeView
            
            badge.configureBadge(with: UIImageView(image: UIImage(systemName: "checkmark.circle")))
            
            badge.isHidden = true

            return badge
        }
        return UICollectionReusableView()
    }

}



extension CategoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionCategoryCell else { return }
        cell.cellTapped()
        
       // let questionVC = CategoryRulesViewController()//тут экран с вопросом заменить
       //
       //        let modelData = contentManager.getModel()[indexPath.row]
       //
       //
       //        questionVC.configure(text: modelData)
       //
       //        navigationController?.pushViewController(questionVC, animated: true)
    }
}
