//
//  CarrotHomeViewController.swift
//  DO_SOPT_33_Seminar
//
//  Created by 정채은 on 10/28/23.
//

import UIKit

import SnapKit
import Then

final class CarrotHomeViewController: UIViewController {
    
    var itemListData: [ItemListData] = [.init(image: "image1",
                                              item: "외장하드",
                                              location: "노원구 중계2.3동",
                                              price: "60,000원",
                                              isLike: false),
                                        .init(image: "image2",
                                              item: "게이밍 의자",
                                              location: "노원구 상계 8동",
                                              price: "30,000원",
                                              isLike: false),
                                        .init(image: "image3",
                                              item: "노트북 팝니다",
                                              location: "노원구 상계9동",
                                              price: "120,000원",
                                              isLike: true),
                                        .init(image: "image4",
                                              item: "닌텐도 이카드 리더기 이사가야해서 잡동사니 급처해요 아무나 사가주시면 너무 감사할거같은데 그쪽도 자겁치까를 아세요?",
                                              location: "의정부시 송산2동",
                                              price: "50,000원",
                                              isLike: true),
                                        .init(image: "image1",
                                              item: "외장하드",
                                              location: "노원구 중계2.3동",
                                              price: "60,000원",
                                              isLike: false),
                                        .init(image: "image2",
                                              item: "게이밍 의자",
                                              location: "노원구 상계 8동",
                                              price: "30,000원",
                                              isLike: false),
                                        .init(image: "image3",
                                              item: "노트북 팝니다",
                                              location: "노원구 상계9동",
                                              price: "120,000원",
                                              isLike: true),
                                        .init(image: "image4",
                                              item: "닌텐도 이카드 리더기 이사가야해서 잡동사니 급처해요 아무나 사가주시면 너무 감사할거같은데 그쪽도 자겁치까를 아세요?",
                                              location: "의정부시 송산2동",
                                              price: "50,000원",
                                              isLike: true)]
    
    private let carrotTableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .init(red: 33.0 / 255.0,
                                   green: 33.0 / 255.0,
                                   blue: 33.0 / 255.0,
                                   alpha: 1.0)
        $0.separatorColor = .lightGray
        $0.separatorStyle = .singleLine
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTableViewConfig()
    }
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        self.view.addSubview(carrotTableView)
        carrotTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setTableViewConfig() {
        self.carrotTableView.register(CarrotTableViewCell.self,
                                      forCellReuseIdentifier: CarrotTableViewCell.identifier)
        self.carrotTableView.delegate = self
        self.carrotTableView.dataSource = self
    }
    
}

extension CarrotHomeViewController: UITableViewDelegate { }

extension CarrotHomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarrotTableViewCell.identifier,
                                                       for: indexPath) as? CarrotTableViewCell else {return UITableViewCell()}
        cell.likeTapCompletion = { [weak self] state in
            guard let self else {return}
            itemListData[indexPath.row].isLike = state
        }
        
        cell.bindData(data: itemListData[indexPath.row])
        return cell
    }
}

