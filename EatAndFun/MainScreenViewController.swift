
import UIKit

final class MainScreenViewController: UIViewController {
    
    // MARK: - UI
    
    private var selectedCategory: String?
    private var selectedSubcategories: [Subcategory] = []
    
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
    
    private lazy var subcategoriesCollectionView: UICollectionView = {
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
        collectionView.register(SubcategoryCell.self, forCellWithReuseIdentifier: SubcategoryCell.reuseIdentifier)
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
        
        selectedCategory = "Burgers"
        updateSubcategories()
    }
    
    // MARK: -
    
    private func setupViews() {
        [backgroundView, backgroundImage, menuButton, profileButton, chooseLabel, searchBar, categoriesLabel, categoriesCollectionView, subcategoriesCollectionView, burgersLabel, pizzaLabel, drinksLabel].forEach { view.addSubview($0) }
        
        categoriesCollectionView.layer.shadowColor = UIColor.black.cgColor
        categoriesCollectionView.layer.shadowOpacity = 0.5
        categoriesCollectionView.layer.shadowOffset = CGSize(width: 0, height: 2)
        categoriesCollectionView.layer.shadowRadius = 5
        
        subcategoriesCollectionView.layer.shadowColor = UIColor.black.cgColor
        subcategoriesCollectionView.layer.shadowOpacity = 0.5
        subcategoriesCollectionView.layer.shadowOffset = CGSize(width: 0, height: 2)
        subcategoriesCollectionView.layer.shadowRadius = 5
    }
    
    // MARK: -
    
    @objc private func menuButtonTapped() {
        print("Menu button tapped!")
    }
    
    @objc private func profileButtonTapped() {
        print("Profile button tapped!")
    }
    
    private func updateSubcategories() {
        switch selectedCategory {
        case "Burgers":
            selectedSubcategories = [
                Subcategory(title: "Chicken Burger", description: "*****", price: "4.7$", imageName: "burger3"),
                Subcategory(title: "Double Cheesy Burger", description: "*****", price: "5.3$", imageName: "burger1"),
                Subcategory(title: "Double Meat Burger", description: "*****", price: "5.5$", imageName: "doubleMeatBurger")
            ]
        case "Pizza":
            selectedSubcategories = [
                Subcategory(title: "Margherita", description: "Classic Margherita Pizza", price: "8.8$", imageName: "margherita"),
                Subcategory(title: "Pepperoni", description: "Spicy Pepperoni Pizza", price: "9.2$", imageName: "pepperoni"),
                Subcategory(title: "Vegetarian", description: "Vegetarian Delight Pizza", price: "9.2$", imageName: "vegetarian")
            ]
        case "Drinks":
            selectedSubcategories = [
                Subcategory(title: "Cola", description: "Refreshing Cola", price: "1.5$", imageName: "cola"),
                Subcategory(title: "Orange Juice", description: "Fresh Orange Juice", price: "2$", imageName: "orangeJuice"),
                Subcategory(title: "Water", description: "Pure Water", price: "0.9$", imageName: "water")
            ]
        default:
            break
        }
        
        subcategoriesCollectionView.reloadData()
    }
    
    
    // MARK: -
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: -60),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            backgroundView.heightAnchor.constraint(equalToConstant: 350),
            
            backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            menuButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            menuButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            menuButton.widthAnchor.constraint(equalToConstant: 30),
            menuButton.heightAnchor.constraint(equalToConstant: 30),
            
            profileButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            profileButton.widthAnchor.constraint(equalToConstant: 30),
            profileButton.heightAnchor.constraint(equalToConstant: 30),
            
            chooseLabel.topAnchor.constraint(equalTo: menuButton.bottomAnchor, constant: 16),
            chooseLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            searchBar.topAnchor.constraint(equalTo: chooseLabel.bottomAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            
            categoriesLabel.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 20),
            categoriesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            categoriesCollectionView.topAnchor.constraint(equalTo: categoriesLabel.bottomAnchor, constant: 10),
            categoriesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            categoriesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            categoriesCollectionView.heightAnchor.constraint(equalToConstant: 100),
            
            subcategoriesCollectionView.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor, constant: 50),
            subcategoriesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            subcategoriesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            subcategoriesCollectionView.heightAnchor.constraint(equalToConstant: 240),
            
            burgersLabel.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor, constant: 5),
            burgersLabel.centerXAnchor.constraint(equalTo: categoriesCollectionView.leadingAnchor, constant: 55),
            
            pizzaLabel.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor, constant: 5),
            pizzaLabel.centerXAnchor.constraint(equalTo: categoriesCollectionView.centerXAnchor),
            
            drinksLabel.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor, constant: 5),
            drinksLabel.centerXAnchor.constraint(equalTo: categoriesCollectionView.trailingAnchor, constant: -55)
        ])
    }
}

extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == categoriesCollectionView {
            return 3
        } else if collectionView == subcategoriesCollectionView {
            return 1
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoriesCollectionView {
            return 1
        } else if collectionView == subcategoriesCollectionView {
            return 3
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            if collectionView == categoriesCollectionView {
                let spacing: CGFloat = 10
                return UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
            }
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoriesCollectionView {
            return CGSize(width: 100, height: 80)
        } else if collectionView == subcategoriesCollectionView {
            return CGSize(width: 140, height: 120)
        }
        return CGSize(width: 120, height: 80)
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoriesCollectionView {
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
        } else if collectionView == subcategoriesCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubcategoryCell.reuseIdentifier, for: indexPath) as! SubcategoryCell
            guard indexPath.row < selectedSubcategories.count else {
                return cell
            }
            let subcategory = selectedSubcategories[indexPath.row]
            cell.configure(with: subcategory)
            return cell
        }

        return UICollectionViewCell()
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoriesCollectionView {
            switch indexPath.section {
            case 0:
                selectedCategory = "Burgers"
            case 1:
                selectedCategory = "Pizza"
            case 2:
                selectedCategory = "Drinks"
            default:
                break
            }
            
            updateSubcategories()
        }
    }
}
