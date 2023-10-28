//
//  UIStackView+.swift
//  DO_SOPT_33_Seminar
//
//  Created by 정채은 on 10/28/23.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
