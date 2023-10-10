//
//  ViewController.swift
//  DO_SOPT_33_Seminar
//
//  Created by 정채은 on 10/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    static let chaentopiaBlue: UIColor = UIColor(red: 76/255, green: 151/255, blue: 196/255, alpha: 1.0)
    static let chaentopiaPink: UIColor = UIColor(red: 238/255, green: 125/255, blue: 177/255, alpha: 1.0)
    
    private var idText: String = ""
    private var passwordText: String = ""
    var isPink = true
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var modeLabel: UILabel!
    @IBOutlet weak var modeSwitch: UISwitch!
    
    @IBOutlet weak var recentIDLabel: UILabel!
    @IBOutlet weak var recentPWLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func idTextFieldChanged(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let idText = textField.text {
            self.idText = idText
        }
        print("아이디 입력 완료")
    }
    
    @IBAction func pwTextFieldChanged(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
        if let passwordText = textField.text {
            self.passwordText = passwordText
        }
        print("비밀번호 입력 완료")
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        print("로그인 버튼\n\(idText)\n\(passwordText)")
        
        pushToResultVC()
    }
    
    func pushToResultVC() {
        guard let resultViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
        resultViewController.setLabelText(id: idText, pw: passwordText)
        resultViewController.getDataDelegate = self
        
        /// 클로저 방식
//        resultViewController.loginDataCompletion = { data in
//            print("클로저로 받아온 email : \(data[0]), 클로저로 받아온 password : \(data[1])")
//        }
        resultViewController.isPink = self.isPink
        
        self.navigationController?.pushViewController(resultViewController, animated: true)
    }
    
    func presentToResultVC() {
        guard let resultViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else { return }
        resultViewController.setLabelText(id: idText, pw: passwordText)
        resultViewController.getDataDelegate = self
        /// 클로저 방식
//        resultViewController.loginDataCompletion = { data in
//            print("클로저로 받아온 email : \(data[0]), 클로저로 받아온 password : \(data[1])")
//        }
        
        resultViewController.isPink = self.isPink
        
        self.present(resultViewController, animated: true)
    }
    
    @IBAction func switchValueChanged(_ sender: Any) {

        if isPink {
            modeSwitch.onTintColor = ViewController.chaentopiaBlue
            loginLabel.textColor = ViewController.chaentopiaBlue
            loginButton.backgroundColor = ViewController.chaentopiaBlue
        } else {
            modeSwitch.onTintColor = ViewController.chaentopiaPink
            loginLabel.textColor = ViewController.chaentopiaPink
            loginButton.backgroundColor = ViewController.chaentopiaPink
        }
        
        self.isPink.toggle()
    }
}

extension ViewController: GetDataProtocol {
    func getLoginData(id: String, password: String) {
        self.recentIDLabel.text = "ID: \(id)"
        self.recentPWLabel.text = "PW: \(password)"
    }
}

