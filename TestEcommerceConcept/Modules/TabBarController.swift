//
//  TabBarController.swift
//  TestEcommerceConcept
//
//  Created by Линар Нигматзянов on 23/08/2022.
//

import UIKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        viewControllers = [
            generateVC(viewController: ExplorerViewController(), title: "", image: UIImage(named: "Explorer")),
            generateVC(viewController: ExplorerViewController(), title: "", image: UIImage(named: "basket")),
            generateVC(viewController: FavoriteViewController(), title: "", image: UIImage(named: "favorite")),
            generateVC(viewController: UIViewController(), title: "", image: UIImage(named: "profile"))
        ]
        setTabbarAppearance()
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        let vc = UINavigationController(rootViewController: viewController)
        vc.tabBarItem.title = title
        vc.tabBarItem.image = image
        return vc
        
    }
    
    private func setTabbarAppearance() {
        UITabBar.setTransparentTabbar()
        let deviceType = UIDevice.current.modelName
        switch deviceType {
        case "iPhone10,4", "iPhone10,5":
            let width = tabBar.bounds.width - 20
            let height = tabBar.bounds.height
            let roundLayer = CAShapeLayer()
            let bezierPath = UIBezierPath(roundedRect: CGRect(x: 10, y: tabBar.bounds.minY - 1 , width: width , height: height), cornerRadius: height / 2)
            roundLayer.path = bezierPath.cgPath
            tabBar.layer.insertSublayer(roundLayer, at: 0)
            tabBar.itemWidth = width
            tabBar.itemPositioning = .automatic
            tabBar.tintColor = .white
            tabBar.unselectedItemTintColor = .white
            roundLayer.fillColor = #colorLiteral(red: 0.003921568627, green: 0, blue: 0.2078431373, alpha: 1)
            
        default:
            let width = tabBar.bounds.width - 20
            let height = tabBar.bounds.height + 30
            let roundLayer = CAShapeLayer()
            let bezierPath = UIBezierPath(roundedRect: CGRect(x: 10, y: tabBar.bounds.minY - 14, width: width , height: height), cornerRadius: height / 2)
            roundLayer.path = bezierPath.cgPath
            tabBar.layer.insertSublayer(roundLayer, at: 0)
            tabBar.itemWidth = width / 5
            tabBar.itemPositioning = .automatic
            tabBar.itemSpacing = 10
            roundLayer.fillColor = #colorLiteral(red: 0.003921568627, green: 0, blue: 0.2078431373, alpha: 1)
            tabBar.tintColor = .white
            tabBar.unselectedItemTintColor = .white
            
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        if tabBarIndex == 1 {
            tapBasketButton()
        }
        
    }
    
    func tapBasketButton () {
        let cartVC = CartViewController()
        cartVC.modalPresentationStyle = .fullScreen
        if let presentationController = cartVC.presentationController as? UISheetPresentationController {
            presentationController.detents = [.large()]
        }
        self.present(cartVC, animated: true)
    }
    
}
// MARK: - setTransparentTabbar
extension UITabBar {
    
    static func setTransparentTabbar() {
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage     = UIImage()
    }
}
