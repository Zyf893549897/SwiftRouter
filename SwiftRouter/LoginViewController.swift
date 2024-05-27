//Created  in 2024

import UIKit

class LoginViewController: UIViewController {
    var idstr: String = ""
    var onCompletion: ((String) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        
        view.addSubview(button)
      
    }
    @objc func buttonAction() {
        onCompletion?("fanfan")
    }
    lazy var button: UIButton = {
        let button = UIButton.init()
        button.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()

}
