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
    private let contentDataManager: IContentDataManager!
    private let buttonTap = UIButton()
    
    
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
        setupButton()
    }
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
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        view.addSubview(buttonTap)
    }
    
    func showMyViewControllerInACustomizedSheet() {
        let viewControllerToPresent = CategoryRulesViewController()
        viewControllerToPresent.preferredContentSize = CGSize(width: view.frame.width, height: 650)

        if let sheet = viewControllerToPresent.sheetPresentationController {
            let customDetent = UISheetPresentationController.Detent.custom(identifier: .medium) { context in
                return min(650, context.maximumDetentValue)
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

    
    func setupButton() {
        buttonTap.titleLabel?.text = "Tap"
        buttonTap.tintColor = .black
        buttonTap.backgroundColor = .green
        buttonTap.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
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
            heightDimension: .absolute(200)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        
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
    
    
    func configureCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        buttonTap.translatesAutoresizingMaskIntoConstraints = false
        
       
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: buttonTap.topAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            buttonTap.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            buttonTap.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonTap.widthAnchor.constraint(equalToConstant: 100),
            buttonTap.heightAnchor.constraint(equalToConstant: 20),
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
