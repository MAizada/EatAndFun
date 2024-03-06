
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        
        let launchViewController = LaunchViewController()
        window?.rootViewController = launchViewController
     
        window?.makeKeyAndVisible()
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(showLoginViewController), userInfo: nil, repeats: false)
    }

    @objc func showLoginViewController() {
        let loginViewController = LoginViewController()
        let navigationController = UINavigationController(rootViewController: loginViewController)
        window?.rootViewController = navigationController
    }
}
