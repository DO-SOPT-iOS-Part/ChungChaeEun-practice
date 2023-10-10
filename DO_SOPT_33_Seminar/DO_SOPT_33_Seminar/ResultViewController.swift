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
    
    @IBOutlet weak var IDResultLabel: UILabel!
    @IBOutlet weak var PWResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindText()
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
    
    func setLabelText(id: String, pw: String) {
        self.idText = id
        self.pwText = pw
    }
}

