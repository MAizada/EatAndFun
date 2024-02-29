
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

      func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
          guard let windowScene = (scene as? UIWindowScene) else { return }
          
          window = UIWindow(windowScene: windowScene)
          window?.windowScene = windowScene
          window?.makeKeyAndVisible()
          window?.rootViewController = LoginViewController()
      }
  }

//func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//    guard let windowScene = (scene as? UIWindowScene) else { return }
//
//    window = UIWindow(windowScene: windowScene)
//    window?.windowScene = windowScene
//
//    let loginViewController = LoginViewController()
//    let navigationController = UINavigationController(rootViewController: loginViewController)
//
//    window?.rootViewController = navigationController
//    window?.makeKeyAndVisible()
//}
