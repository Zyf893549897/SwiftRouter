//Created  in 2024

import Foundation
import URLNavigator

let ZYFRouter = SignRouter.shared

enum RouterType: Int {
    case push
    case present
    case other
}
// url 路径地址
class RouterURLString: NSObject {
    static let to_ViewController = "myapp://vc"
    static let to_LoginViewController = "myapp://login"
}
class SignRouter {
    static let shared = SignRouter()
    let navigator = Navigator()
    private init() {
        registerRoutes()
    }
    // 注册
    func registerRoutes() {
        // 方式一 用于注册一个 URL 路由，并返回一个视图控制器实例
        navigator.register(RouterURLString.to_ViewController) { url, values, context in
            guard let dic = context as? [String: Any] else {return nil}
            
            let login = LoginViewController()
            if let idStr = dic["id"] as? String {
                login.idstr = idStr
            }
            // 传递闭包
            if let onCompletion = dic["onCompletion"] as? ((String) -> Void) {
                login.onCompletion = onCompletion
            }
            return login
        }

        // 方式二 用于注册一个 URL 路由，并执行一个闭包来处理该 URL   以open方式打开
        navigator.handle(RouterURLString.to_ViewController) { url, values, context in
            guard let dic = context as? [String: Any] else {return true}
            
            let login = LoginViewController()
            if let idStr = dic["id"] as? String {
                login.idstr = idStr
            }
            // 传递闭包
            if let onCompletion = dic["onCompletion"] as? ((String) -> Void) {
                login.onCompletion = onCompletion
            }
            currentVC?.navigationController?.pushViewController(login, animated: true)
            return true
        }
    }
    
    /// 路由方法
    /// - Parameters:
    ///   - url: 路由地址
    ///   - context: 路由参数
    ///   - openType: 页面路由方式
    func openURL(_ url: String, context: Any? = nil,openType: RouterType = .push) {
        switch openType {
        case .push:
            navigator.push(url,context: context)
        case .present:
            // present()需要一个额外的参数：wrap。如果UINavigationController指定了类，新的视图控制器将用该类包装。默认值为nil。
            navigator.present(url,context: context/*,wrap: UINavigationController.self*/)
        case .other:
            navigator.open(url, context: context)
        }
    }
}



