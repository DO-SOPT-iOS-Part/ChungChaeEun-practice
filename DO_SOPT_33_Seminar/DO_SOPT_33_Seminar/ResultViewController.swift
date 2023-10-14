//
//  ResultViewController.swift
//  DO_SOPT_33_Seminar
//
//  Created by 정채은 on 10/7/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    var idText = ""
    var pwText = ""
    var getDataDelegate: GetDataProtocol?
    var loginDataCompletion: (([String]) -> Void)?
    var isPink = true
    
    @IBOutlet weak var IDResultLabel: UILabel!
    @IBOutlet weak var PWResultLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindText()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setColorStyle()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
        }
        
        getDataDelegate?.getLoginData(id: self.idText, password: self.pwText)
        
//        guard let loginDataCompletion else {return}
//        loginDataCompletion([self.idText, self.pwText])
    }
    
    private func bindText() {
        self.IDResultLabel.text = "Nice to Meet You, \(idText)!"
        self.PWResultLabel.text = "and your password is \(pwText), right?"
    }
    
    private func setColorStyle() {
        if isPink {
            self.IDResultLabel.textColor = ViewController.chaentopiaPink
            self.PWResultLabel.textColor = ViewController.chaentopiaPink
            self.logoutButton.backgroundColor = ViewController.chaentopiaPink
        } else {
            self.IDResultLabel.textColor = ViewController.chaentopiaBlue
            self.PWResultLabel.textColor = ViewController.chaentopiaBlue
            self.logoutButton.backgroundColor = ViewController.chaentopiaBlue
        }
    }
    
    func setLabelText(id: String, pw: String) {
        self.idText = id
        self.pwText = pw
    }
}

