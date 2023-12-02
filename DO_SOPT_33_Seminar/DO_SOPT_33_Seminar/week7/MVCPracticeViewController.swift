//
//  MVCPracticeViewController.swift
//  DO_SOPT_33_Seminar
//
//  Created by 정채은 on 12/2/23.
//

import UIKit

import SnapKit
import Then

class MVCPracticeViewController: UIViewController {
    var soptModel: [SoptMember] = [SoptMember(name: "류희재", age: 4),
                                   SoptMember(name: "강민수", age: 24),
                                   SoptMember(name: "고아라", age: 23),
                                   SoptMember(name: "곽성준", age: 24),
                                   SoptMember(name: "신지원", age: 24),
                                   SoptMember(name: "김가현", age: 23),
                                   SoptMember(name: "김다예", age: 24),
                                   SoptMember(name: "김민주", age: 23),
                                   SoptMember(name: "김보연", age: 23),
                                   SoptMember(name: "김선우", age: 23),
                                   SoptMember(name: "김연수", age: 25),
                                   SoptMember(name: "김태경", age: 25),
                                   SoptMember(name: "박윤빈", age: 22),
                                   SoptMember(name: "박준혁", age: 27),
                                   SoptMember(name: "방민지", age: 26),
                                   SoptMember(name: "변상우", age: 25),
                                   SoptMember(name: "변희주", age: 23),
                                   SoptMember(name: "윤영서", age: 22),
                                   SoptMember(name: "윤희슬", age: 24),
                                   SoptMember(name: "이민재", age: 24),
                                   SoptMember(name: "이우제", age: 24),
                                   SoptMember(name: "이윤학", age: 25),
                                   SoptMember(name: "이자민", age: 24),
                                   SoptMember(name: "이조은", age: 23),
                                   SoptMember(name: "이지희", age: 24),
                                   SoptMember(name: "전효원", age: 23),
                                   SoptMember(name: "정채은", age: 23),
                                   SoptMember(name: "최서연", age: 23),
                                   SoptMember(name: "최효리", age: 23)]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
    }
    
    private func setLayout() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    
    private lazy var tableView = UITableView(frame: .zero, style: .plain).then {
        $0.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        $0.dataSource = self
        $0.delegate = self
    }
}
extension MVCPracticeViewController: UITableViewDelegate{}
extension MVCPracticeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return soptModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        cell.setData(name: soptModel[indexPath.row].name,
                     age: soptModel[indexPath.row].age)
        
        cell.buttonTapCompletion = { [weak self] value in
            guard let self else {return}
            self.soptModel[indexPath.row].age = value
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        return cell
    }
}
