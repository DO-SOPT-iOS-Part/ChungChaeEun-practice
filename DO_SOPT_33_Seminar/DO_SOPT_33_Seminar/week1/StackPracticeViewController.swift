//
//  StackPracticeViewController.swift
//  DO_SOPT_33_Seminar
//
//  Created by 정채은 on 10/14/23.
//

import UIKit

class StackPracticeViewController: UIViewController {
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    private var firstStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    private var secondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }()
    
    private var yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private var firstEmptyView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private var blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private var secondEmptyView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private var thirdEmptyView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    private var fourthEmptyView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private var blueView: UIView = {
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
        
        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        [firstStackView, secondStackView].forEach {
            stackView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([stackView.topAnchor.constraint(equalTo: self.view.topAnchor),
                                     stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                                     stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                                     stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)])
        
        [yellowView, firstEmptyView, blackView, secondEmptyView].forEach {
            firstStackView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [thirdEmptyView, greenView, fourthEmptyView, blueView].forEach {
            secondStackView.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
