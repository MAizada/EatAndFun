
import UIKit

class MainScreenViewController: UIViewController {
    
    // MARK: -
    
    private var selectedCategory: String?
    private var selectedSubcategories: [String] = []
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorExtension.lightRed
        view.layer.cornerRadius = 150
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "backroundImage3"))
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var menuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(menuButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var profileButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "person"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var chooseLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose the\nFOOD you LOVE"
        label.font = UIFont(name: "Rowdies", size: 24)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search for a food item"
        searchBar.barTintColor = ColorExtension.lightYellow
        
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            
            textField.attributedPlaceholder = NSAttributedString(string: "Search for a food item", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            
            textField.leftView = nil
            textField.layer.cornerRadius = 25
            textField.layer.masksToBounds = true
        }
        searchBar.layer.borderColor = UIColor.white.cgColor
        searchBar.layer.borderWidth = 1.0
        searchBar.layer.cornerRadius = 25
        searchBar.layer.masksToBounds = true
        searchBar.searchTextField.textColor = .white
        searchBar.searchTextField.tintColor = .white
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private lazy var categoriesLabel: UILabel = {
        let label = UILabel()
        label.text = "Categories"
        label.font = UIFont(name: "Rowdies", size: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var categoriesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 15
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
        return collectionView
    }()
    
    private lazy var burgersLabel: UILabel = {
        let label = UILabel()
        label.text = "Burgers"
        label.font = UIFont(name: "Rowdies", size: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pizzaLabel: UILabel = {
        let label = UILabel()
        label.text = "Pizza"
        label.font = UIFont(name: "Rowdies", size: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var drinksLabel: UILabel = {
        let label = UILabel()
        label.text = "Drinks"
        label.font = UIFont(name: "Rowdies", size: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
    }
    
    // MARK: -
    private func setupViews() {
        [backgroundView, backgroundImage, menuButton, profileButton, chooseLabel, searchBar, categoriesLabel, categoriesCollectionView, burgersLabel, pizzaLabel, drinksLabel].forEach { view.addSubview($0) }
    }
    
    // MARK: -
    @objc private func menuButtonTapped() {
        print("Menu button tapped!")
    }
    
    @objc private func profileButtonTapped() {
        print("Profile button tapped!")
    }
    
    // MARK: -
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: -60),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            backgroundView.heightAnchor.constraint(equalToConstant: 350)
        ])
        
        NSLayoutConstraint.activate([
            backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImage.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            menuButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            menuButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            menuButton.widthAnchor.constraint(equalToConstant: 30),
            menuButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            profileButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            profileButton.widthAnchor.constraint(equalToConstant: 30),
            profileButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            chooseLabel.topAnchor.constraint(equalTo: menuButton.bottomAnchor, constant: 16),
            chooseLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: chooseLabel.bottomAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            categoriesLabel.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 20),
            categoriesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            categoriesCollectionView.topAnchor.constraint(equalTo: categoriesLabel.bottomAnchor, constant: 10),
            categoriesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            burgersLabel.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor, constant: 5),
            burgersLabel.centerXAnchor.constraint(equalTo: categoriesCollectionView.leadingAnchor, constant: 55)
        ])
        
        NSLayoutConstraint.activate([
            pizzaLabel.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor, constant: 5),
            pizzaLabel.centerXAnchor.constraint(equalTo: categoriesCollectionView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            drinksLabel.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor, constant: 5),
            drinksLabel.centerXAnchor.constraint(equalTo: categoriesCollectionView.trailingAnchor, constant: -55)
        ])
    }
}

extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as! CategoryCell
        
        switch indexPath.section {
        case 0:
            cell.imageView.image = UIImage(named: "burgerBlack")
        case 1:
            cell.imageView.image = UIImage(named: "pizzaBlack")
        case 2:
            cell.imageView.image = UIImage(named: "drinksBlack")
        default:
            break
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            selectedCategory = "Burgers"
            selectedSubcategories = ["Cheeseburger", "Veggie Burger", "Chicken Burger"]
        case 1:
            selectedCategory = "Pizza"
            selectedSubcategories = ["Margherita", "Pepperoni", "Vegetarian"]
        case 2:
            selectedCategory = "Drinks"
            selectedSubcategories = ["Cola", "Orange Juice", "Water"]
        default:
            break
        }

        categoriesCollectionView.reloadData()
    }

}
