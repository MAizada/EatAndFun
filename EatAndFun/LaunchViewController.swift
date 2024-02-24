
import UIKit

final class LaunchViewController: UIViewController {
    
    private lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.red.cgColor, UIColor.orange.cgColor]
        layer.startPoint = CGPoint(x: 0.5, y: 1.0)
        layer.endPoint = CGPoint(x: 0.5, y: 0.0)
        layer.frame = view.bounds
        return layer
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var eatLabel: UILabel = {
        let label = UILabel()
        label.text = "Eat."
        label.font = UIFont.systemFont(ofSize: 64)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var funLabel: UILabel = {
        let label = UILabel()
        label.text = "Fun"
        label.font = UIFont.systemFont(ofSize: 64)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var foodMealImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "foodMeal"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradientLayer()
        setupViews()
        setupConstraints()
    }
    
    private func setupGradientLayer() {
        view.backgroundColor = .red
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setupViews() {
        view.addSubview(eatLabel)
        view.addSubview(logoImageView)
        view.addSubview(funLabel)
        view.addSubview(foodMealImageView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            eatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            eatLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: 120),
            logoImageView.heightAnchor.constraint(equalToConstant: 120),
            logoImageView.leadingAnchor.constraint(equalTo: eatLabel.trailingAnchor, constant: -20),
            logoImageView.centerYAnchor.constraint(equalTo: eatLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            funLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            funLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: -50)
        ])
        
        NSLayoutConstraint.activate([
            foodMealImageView.widthAnchor.constraint(equalToConstant: 312),
            foodMealImageView.heightAnchor.constraint(equalToConstant: 242),
            foodMealImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            foodMealImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    
}

