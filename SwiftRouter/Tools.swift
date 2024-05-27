//Created  in 2024

import Foundation
import UIKit

let currentVC = Tools().currentViewController
class Tools: NSObject {
    // 当前控制器
    var currentViewController: UIViewController? {
        guard let rootViewController = UIApplication.shared.keyWindow?.rootViewController else {
            return nil
        }
        return findCurrentShowingViewController(from: rootViewController)
    }
    // 返回第一个 window 下的当前控制器
    var currentWindow: UIViewController? {
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
            return nil
        }
        return findCurrentShowingViewController(from: rootViewController)
    }
    func findCurrentShowingViewController(from vc: UIViewController) -> UIViewController {
        if let presentedVC = vc.presentedViewController {
            // 当前视图是被 presented 出来的
            return findCurrentShowingViewController(from: presentedVC)
        } else if let tabBarController = vc as? UITabBarController {
            // 根视图为 UITabBarController
            if let selectedVC = tabBarController.selectedViewController {
                return findCurrentShowingViewController(from: selectedVC)
            }
        } else if let navigationController = vc as? UINavigationController {
            // 根视图为 UINavigationController
            if let visibleVC = navigationController.visibleViewController {
                return findCurrentShowingViewController(from: visibleVC)
            }
        }
        // 根视图为非导航类
        return vc
    }

}
