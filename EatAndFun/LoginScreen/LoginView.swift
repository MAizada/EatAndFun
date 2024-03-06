
import UIKit

class LoginView: UIView {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorExtension.lightRed
        view.layer.cornerRadius = 150
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView(image: UIImage(named: "backroundImage2"))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        return view
    }()
    
    private lazy var eatLabel: UILabel = {
        let label = UILabel()
        label.text = "Eat."
        label.font = UIFont.boldSystemFont(ofSize: 54)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var funLabel: UILabel = {
        let label = UILabel()
        label.text = "Fun"
        label.font = UIFont.boldSystemFont(ofSize: 54)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var pizzaImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "pizza"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var burgerImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "burger2"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var loginBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let imageView = UIImageView(image: UIImage(named: "backroundImage1"))
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        return view
    }()
    
    
    private lazy var segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Log In", "Sign Up"])
        let fontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
        segmentedControl.setTitleTextAttributes(fontAttributes, for: .normal)
        
        segmentedControl.setBackgroundImage(imageWithColor(color: ColorExtension.darkRed), for: .selected, barMetrics: .default)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        segmentedControl.setBackgroundImage(imageWithColor(color: ColorExtension.lightYellow), for: .normal, barMetrics: .default)
        segmentedControl.setTitleTextAttributes([.foregroundColor: ColorExtension.darkRed], for: .normal)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter email or username"
        
        let separatorView = UIView()
        separatorView.backgroundColor = .gray
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        textField.addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            separatorView.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: textField.bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1.0)
        ])
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        
        let separatorView = UIView()
        separatorView.backgroundColor = .gray
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        textField.addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            separatorView.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: textField.bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1.0)
        ])
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Confirm Password"
        textField.isSecureTextEntry = true
        textField.isHidden = true
        
        let separatorView = UIView()
        separatorView.backgroundColor = .gray
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        textField.addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            separatorView.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: textField.bottomAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 1.0)
        ])
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot Password?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.backgroundColor = ColorExtension.darkRed
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = "OR"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var googleIconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "googleIcon"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var facebookIconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "facebookIcon"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
}
