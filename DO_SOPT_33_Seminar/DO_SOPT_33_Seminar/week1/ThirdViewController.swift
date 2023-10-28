//
//  ThirdViewController.swift
//  DO_SOPT_33_Seminar
//
//  Created by 정채은 on 10/14/23.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    var secondView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    var thirdView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    var fourthView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
    }
    
    private func setLayout() {
        [firstView, secondView, thirdView, fourthView].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([firstView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     firstView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     firstView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                     firstView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)])
        
        NSLayoutConstraint.activate([secondView.topAnchor.constraint(equalTo: self.firstView.bottomAnchor),
                                     secondView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     secondView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                     secondView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)])
        
        NSLayoutConstraint.activate([thirdView.topAnchor.constraint(equalTo: self.secondView.bottomAnchor),
                                     thirdView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                                     thirdView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                     thirdView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)])
        
        NSLayoutConstraint.activate([fourthView.topAnchor.constraint(equalTo: self.thirdView.bottomAnchor),
                                     fourthView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     fourthView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                     fourthView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)])
        
        
    }
}
