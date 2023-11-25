//
//  PanGestureViewController.swift
//  DO_SOPT_33_Seminar
//
//  Created by 정채은 on 11/25/23.
//

import UIKit

import Lottie
import SnapKit
import Then

class PanGestureViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
    }
    
    private func setLayout() {
        self.view.addSubviews(lottieView,
                              imageView)
        
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        
        lottieView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(200)
        }
    }
    
    @objc private func didImageViewMoved(_ sender: UIPanGestureRecognizer) {
         let transition = sender.translation(in: imageView)
         let changedX = imageView.center.x + transition.x
         let changedY = imageView.center.y + transition.y
         self.imageView.center = .init(x: changedX,
                                      y: changedY)
         self.lottieView.center = .init(x: changedX,
                                        y: changedY)
         sender.setTranslation(.zero, in: imageView)
         
         if sender.state == .began {
             self.isDraging(state: true)
         }
         else if sender.state == .ended {
             self.isDraging(state: false)
         }
     }
    
    private let lottieView = LottieAnimationView(name: "dragAnimation").then {
        $0.loopMode = .loop
    }
    
    private lazy var imageView = UIImageView(image: UIImage(named: "image5")).then {
        $0.isUserInteractionEnabled = true
        let gesture = UIPanGestureRecognizer(target: self,
                                             action: #selector(didImageViewMoved(_:)))
        $0.addGestureRecognizer(gesture)
    }
    
    private func isDraging(state: Bool) {
        if state {
            self.lottieView.isHidden = false
            self.lottieView.play()
        } else {
            self.lottieView.isHidden = true
            self.lottieView.pause()
        }
    }
}
