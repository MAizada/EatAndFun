
import UIKit

final class LoginViewController: UIViewController {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var redView: UIView = {
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
        label.font = UIFont.systemFont(ofSize: 54)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var funLabel: UILabel = {
        let label = UILabel()
        label.text = "Fun"
        label.font = UIFont.systemFont(ofSize: 54)
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
        return view
    }()
    
    private lazy var loginSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Log In", "Sign Up"])
        let fontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)]
           segmentedControl.setTitleTextAttributes(fontAttributes, for: .normal)
      
        segmentedControl.setBackgroundImage(imageWithColor(color: ColorExtension.darkRed), for: .selected, barMetrics: .default)
        segmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        
        segmentedControl.setBackgroundImage(imageWithColor(color: ColorExtension.lightYellow), for: .normal, barMetrics: .default)
        segmentedControl.setTitleTextAttributes([.foregroundColor: ColorExtension.darkRed], for: .normal)
        
        DispatchQueue.main.async {
            for i in 0..<segmentedControl.numberOfSegments {
                let segmentView = segmentedControl.subviews[i]
                segmentView.layer.cornerRadius = 15
                segmentView.layer.masksToBounds = true
            }
        }
        segmentedControl.selectedSegmentIndex = 0
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
            separatorView.heightAnchor.constraint(equalToConstant: 1.0) // Высота линии границы
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
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.backgroundColor = ColorExtension.darkRed
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(redView)
        view.addSubview(eatLabel)
        view.addSubview(logoImageView)
        view.addSubview(funLabel)
        view.addSubview(pizzaImageView)
        view.addSubview(burgerImageView)
        view.addSubview(loginBackgroundView)
        loginBackgroundView.addSubview(loginSegmentedControl)
        loginBackgroundView.addSubview(emailTextField)
        loginBackgroundView.addSubview(passwordTextField)
        loginBackgroundView.addSubview(forgotPasswordButton)
        loginBackgroundView.addSubview(loginButton)
        loginBackgroundView.addSubview(orLabel)
        loginBackgroundView.addSubview(googleIconImageView)
        loginBackgroundView.addSubview(facebookIconImageView)
    }
    
   //MARK: -
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 32)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.topAnchor, constant: -60),
            redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
            redView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            redView.heightAnchor.constraint(equalToConstant: 350)
        ])
        
        NSLayoutConstraint.activate([
            eatLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            eatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 90)
        ])
        
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: 110),
            logoImageView.heightAnchor.constraint(equalToConstant: 110),
            logoImageView.leadingAnchor.constraint(equalTo: eatLabel.trailingAnchor, constant: -20),
            logoImageView.centerYAnchor.constraint(equalTo: eatLabel.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            funLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            funLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            pizzaImageView.widthAnchor.constraint(equalToConstant: 250),
            pizzaImageView.heightAnchor.constraint(equalToConstant: 150),
            pizzaImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            pizzaImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            burgerImageView.widthAnchor.constraint(equalToConstant: 116),
            burgerImageView.heightAnchor.constraint(equalToConstant: 124),
            burgerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            burgerImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            loginBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginBackgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginBackgroundView.widthAnchor.constraint(equalToConstant: 316),
            loginBackgroundView.heightAnchor.constraint(equalToConstant: 434)
        ])
        
        NSLayoutConstraint.activate([
            loginSegmentedControl.centerXAnchor.constraint(equalTo: loginBackgroundView.centerXAnchor),
            loginSegmentedControl.topAnchor.constraint(equalTo: loginBackgroundView.topAnchor, constant: 20),
            loginSegmentedControl.widthAnchor.constraint(equalToConstant: 225),
            loginSegmentedControl.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: loginSegmentedControl.bottomAnchor, constant: 40),
            emailTextField.leadingAnchor.constraint(equalTo: loginBackgroundView.leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: loginBackgroundView.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordTextField.leadingAnchor.constraint(equalTo: loginBackgroundView.leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: loginBackgroundView.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: loginBackgroundView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: loginBackgroundView.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 128),
            loginButton.heightAnchor.constraint(equalToConstant: 28)
        ])
        
        NSLayoutConstraint.activate([
            orLabel.centerXAnchor.constraint(equalTo: loginBackgroundView.centerXAnchor),
            orLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            googleIconImageView.centerXAnchor.constraint(equalTo: loginBackgroundView.centerXAnchor, constant: -40),
            googleIconImageView.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 10),
            googleIconImageView.widthAnchor.constraint(equalToConstant: 21),
            googleIconImageView.heightAnchor.constraint(equalToConstant: 21)
        ])
        
        NSLayoutConstraint.activate([
            facebookIconImageView.centerXAnchor.constraint(equalTo: loginBackgroundView.centerXAnchor, constant: 40),
            facebookIconImageView.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 10),
            facebookIconImageView.widthAnchor.constraint(equalToConstant: 21),
            facebookIconImageView.heightAnchor.constraint(equalToConstant: 21)
        ])
    }
}
