//Created  in 2024

import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        view.addSubview(button)
        
    }
    @objc func buttonAction() {
//        // 不带参数
//        ZYFRouter.openURL(RouterURLString.to_ViewController)
//        // 带参数
//        ZYFRouter.openURL(RouterURLString.to_ViewController,context: ["id":"123"])
        // 带参数 带返回值
        ZYFRouter.openURL(RouterURLString.to_ViewController(idStr: "123",type: .open), context: ["id": "123", "onCompletion": { (returnedValue: String) in
            // 处理返回值
            print("Returned value: \(returnedValue)")
        }], openType: .push)
    }
    lazy var button: UIButton = {
        let button = UIButton.init()
        button.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
}

