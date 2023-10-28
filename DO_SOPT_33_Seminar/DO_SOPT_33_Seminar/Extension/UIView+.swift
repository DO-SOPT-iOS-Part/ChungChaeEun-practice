//
//  UIView.swift
//  DO_SOPT_33_Seminar
//
//  Created by 정채은 on 10/28/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
