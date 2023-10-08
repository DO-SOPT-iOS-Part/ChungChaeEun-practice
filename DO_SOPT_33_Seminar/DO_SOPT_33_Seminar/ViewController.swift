//
//  ViewController.swift
//  DO_SOPT_33_Seminar
//
//  Created by 정채은 on 10/7/23.
//

import UIKit

class ViewController: UIViewController {
    private var idText: String = ""
    private var passwordText: String = ""
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    @IBAction func idTextFieldChanged(_ sender: Any) {
//        guard let textField = sender as? UITextField else {return}
//        if let idText = textField.text {
//            self.idText = idText
//        }
//        print("아이디 입력 완료")
//    }
    
    @IBAction func idTextFieldChanged(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let idText = textField.text {
            self.idText = idText
        }
        print("아이디 입력 완료")
    }
    
    @IBAction func loginTextFieldChanged(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let passwordText = textField.text {
            self.passwordText = passwordText
        }
        print("비밀번호 입력 완료")
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        print("\(idText)\n\(passwordText)")
        
        pushToResultVC()
    }
    
    func pushToResultVC() {
        guard let resultViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
        self.navigationController?.pushViewController(resultViewController, animated: true)
    }
}

