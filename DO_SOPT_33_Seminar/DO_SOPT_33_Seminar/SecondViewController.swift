//
//  SecondViewController.swift
//  DO_SOPT_33_Seminar
//
//  Created by 정채은 on 10/14/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    var firstDot: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 20, height: 20)))
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    var secondDot: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 20, height: 20)))
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    var defenseView: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 20, height: 120)))
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
        [firstDot, secondDot, defenseView].forEach { [weak self] view in
            guard let self else { return }
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate([firstDot.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40),
                                     firstDot.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
                                     firstDot.widthAnchor.constraint(equalToConstant: 20),
                                     firstDot.heightAnchor.constraint(equalToConstant: 20)])
        
        NSLayoutConstraint.activate([secondDot.topAnchor.constraint(equalTo: self.firstDot.bottomAnchor, constant: 40),
                                   secondDot.leadingAnchor.constraint(equalTo: self.firstDot.trailingAnchor, constant: 20),
                                   secondDot.widthAnchor.constraint(equalToConstant: 20),
                                   secondDot.heightAnchor.constraint(equalToConstant: 20)])
        
        NSLayoutConstraint.activate([defenseView.topAnchor.constraint(equalTo: self.secondDot.bottomAnchor, constant: 20),
                                     defenseView.leadingAnchor.constraint(equalTo: self.secondDot.trailingAnchor, constant: 20),
                                     defenseView.widthAnchor.constraint(equalToConstant: 120),
                                     defenseView.heightAnchor.constraint(equalToConstant: 20)])
    }
}
