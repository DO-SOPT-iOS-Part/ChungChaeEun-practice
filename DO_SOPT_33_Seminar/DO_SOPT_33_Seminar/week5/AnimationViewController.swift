//
//  AnimationViewController.swift
//  DO_SOPT_33_Seminar
//
//  Created by 정채은 on 11/25/23.
//

import UIKit

import SnapKit
import Then

class AnimationViewController: UIViewController {
    var clickCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.setLayout()
    }
    
    private func setLayout() {
        [activityIndicator, startButton, pauseButton].forEach {
            self.view.addSubview($0)
        }
        activityIndicator.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        activityIndicator.isHidden = true
        
        startButton.snp.makeConstraints {
            $0.bottom.leading.equalTo(self.view.safeAreaLayoutGuide)
            $0.width.equalTo(80)
            $0.height.equalTo(40)
        }
        
        pauseButton.snp.makeConstraints {
            $0.bottom.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.width.equalTo(80)
            $0.height.equalTo(40)
        }
    }
    
    private func setAnimation() {
        if self.clickCount > 5 {
            self.activityIndicator.startAnimating()
            self.activityIndicator.isHidden = false
            return
        }
        let randomX = CGFloat.random(in: 0 ... UIScreen.main.bounds.width - self.startButton.bounds.size.width)
        let randomY = CGFloat.random(in: 0 ... UIScreen.main.bounds.height - self.startButton.bounds.size.height)
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseIn]) {
            self.startButton.frame = .init(origin: .init(x: randomX, y: randomY),
                                           size: self.startButton.bounds.size)
        } completion: { _ in
            self.clickCount += 1
        }
    }
    
    
    private let activityIndicator = UIActivityIndicatorView().then {
        $0.color = .black
        $0.hidesWhenStopped = true
        $0.style = .medium
    }
    
    @objc private func startButtonTap() {
//        self.activityIndicator.startAnimating()
//        self.activityIndicator.isHidden = false
        setAnimation()
    }
    
    @objc private func pauseButtonTap() {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
    }
    
    private lazy var startButton = UIButton().then {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(startButtonTap))
        $0.addGestureRecognizer(gesture)
        $0.isUserInteractionEnabled = true
        $0.addTarget(self,
                     action: #selector(startButtonTap),
                     for: .touchUpInside)
        $0.setTitle("시작", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    private lazy var pauseButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(pauseButtonTap),
                     for: .touchUpInside)
        $0.setTitle("일시 정지", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
}
