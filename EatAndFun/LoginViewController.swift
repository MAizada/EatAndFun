
import UIKit

final class LoginViewController: UIViewController {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var loginSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter email or username"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot Password", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var orLabel: UILabel = {
        let label = UILabel()
        label.text = "OR"
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
        view.backgroundColor = .red
        view.addSubview(eatLabel)
        view.addSubview(logoImageView)
        view.addSubview(funLabel)
        view.addSubview(pizzaImageView)
        view.addSubview(burgerImageView)
        view.addSubview(loginBackgroundView)
        loginBackgroundView.addSubview(loginSlider)
        loginBackgroundView.addSubview(emailTextField)
        loginBackgroundView.addSubview(passwordTextField)
        loginBackgroundView.addSubview(forgotPasswordButton)
        loginBackgroundView.addSubview(loginButton)
        loginBackgroundView.addSubview(orLabel)
        loginBackgroundView.addSubview(googleIconImageView)
        loginBackgroundView.addSubview(facebookIconImageView)
    }
    
    private func setupConstraints() {
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
            loginBackgroundView.widthAnchor.constraint(equalToConstant: 300),
            loginBackgroundView.heightAnchor.constraint(equalToConstant: 400)
        ])
        
        NSLayoutConstraint.activate([
            loginSlider.centerXAnchor.constraint(equalTo: loginBackgroundView.centerXAnchor),
            loginSlider.topAnchor.constraint(equalTo: loginBackgroundView.topAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: loginSlider.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: loginBackgroundView.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: loginBackgroundView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: loginBackgroundView.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: loginBackgroundView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            forgotPasswordButton.leadingAnchor.constraint(equalTo: loginBackgroundView.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: loginBackgroundView.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: loginBackgroundView.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
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
