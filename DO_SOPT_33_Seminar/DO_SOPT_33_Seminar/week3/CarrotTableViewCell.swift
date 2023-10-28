//
//  CarrotTableViewCell.swift
//  DO_SOPT_33_Seminar
//
//  Created by 정채은 on 10/28/23.
//

import UIKit

import SnapKit
import Then

class CarrotTableViewCell: UITableViewCell {
    
    static let identifier: String = "CarrotTableViewCell"
    
    var likeTapCompletion: ((Bool) -> Void)?
    
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 8
    }
    
    private let productImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    private let productNameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.numberOfLines = 2
        $0.textColor = .white
    }
    
    private let locationLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .systemGray
    }
    
    private let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18, weight: .black)
        $0.textColor = .white
    }
    
    private lazy var likeButton = UIButton().then {
        $0.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        $0.setImage(UIImage(systemName: "heart"), for: .normal)
        $0.setImage(UIImage(systemName: "heart.fill"), for: .selected)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        self.backgroundColor = .init(red: 33.0 / 255.0,
                                     green: 33.0 / 255.0,
                                     blue: 33.0 / 255.0,
                                     alpha: 1.0)
        
        productImageView.layer.cornerRadius = 5
        productImageView.clipsToBounds = true
    }
    
    private func setLayout() {
        
        self.contentView.addSubviews(productImageView,
                                     stackView,
                                     likeButton)
        
        productImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(128)
        }
        
        stackView.snp.makeConstraints {
            $0.leading.equalTo(productImageView.snp.trailing).offset(16)
            $0.top.trailing.equalToSuperview().inset(16)
        }
        
        likeButton.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom)
            $0.trailing.bottom.equalToSuperview().inset(16)
        }
        
        self.stackView.addArrangedSubviews(productNameLabel,
                                           locationLabel,
                                           priceLabel)
    }
    
    @objc private func likeButtonTapped() {
        likeButton.isSelected.toggle()
        guard let likeTapCompletion else {return}
        likeTapCompletion(likeButton.isSelected)
    }
    
    func bindData(data: ItemListData) {
        self.productImageView.image = UIImage(named: data.image)
        self.productNameLabel.text = data.item
        self.priceLabel.text = data.price
        self.locationLabel.text = data.location
        self.likeButton.isSelected = data.isLike
    }
}
