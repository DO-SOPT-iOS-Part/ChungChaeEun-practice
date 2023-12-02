//
//  CustomTableViewCell.swift
//  DO_SOPT_33_Seminar
//
//  Created by 정채은 on 12/2/23.
//

import UIKit

import SnapKit
import Then

class CustomTableViewCell: UITableViewCell {
    static let identifier: String = "CustomTVC"
    var buttonTapCompletion: ((Int) -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(name: String,
                 age: Int) {
        self.nameLabel.text = name
        self.ageLabel.text = "\(age)"
    }
    
    @objc private func buttonTap(_ sender: UIStepper) {
        guard let buttonTapCompletion else {return}
        buttonTapCompletion(Int.random(in: 1...49))
    }
    
    private func setLayout() {
        [nameLabel, ageLabel, randomAgeButton].forEach {
            self.contentView.addSubview($0)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.top.bottom.equalToSuperview().inset(12)
        }
        
        randomAgeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalTo(nameLabel)
        }
        
        ageLabel.snp.makeConstraints {
            $0.trailing.equalTo(randomAgeButton.snp.leading).offset(-12)
            $0.centerY.equalTo(nameLabel)
        }
    }
    
    private let nameLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textColor = .black
    }
    private let ageLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
    }
    private lazy var randomAgeButton = UIButton().then {
        $0.setTitle("나이 재설정", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.addTarget(self,
                     action: #selector(buttonTap(_:)),
                     for: .touchUpInside)
    }
}
