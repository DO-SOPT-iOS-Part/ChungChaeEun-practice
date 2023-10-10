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
    
    @IBOutlet weak var PWResultLabel: UILabel!
    @IBOutlet weak var IDResultLabel: UILabel!
    
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
    }
    
    private func bindText() {
        self.IDResultLabel.text = "ID: \(idText)"
        self.PWResultLabel.text = "PW: \(pwText)"
    }
    
    func setLabelText(id: String, pw: String) {
        self.idText = id
        self.pwText = pw
    }
}
