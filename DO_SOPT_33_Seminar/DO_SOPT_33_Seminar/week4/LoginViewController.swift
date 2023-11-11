//
//  LoginViewController.swift
//  DO_SOPT_33_Seminar
//
//  Created by 정채은 on 11/11/23.
//
import UIKit
import SnapKit
import Then

class LoginViewController: UIViewController {
    private var userName: String = ""
    private var password: String = ""
    private var nickName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    @objc private func infoViewButtonTap() {
        let infoVC = InfoViewController()
        self.present(infoVC, animated: true)
    }
    
    @objc private func registerButtonTap() {
        Task {
            do {
                let status = try await RegisterService.shared.PostRegisterData(userName: self.userName,
                                                                               password: self.password,
                                                                               nickName: self.nickName)
                if status == 201 {
                    let alert = UIAlertController(title: "계정생성 성공", message: "와하하", preferredStyle: UIAlertController.Style.alert)
                    let okAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
                    alert.addAction(okAction)
                    self.present(alert, animated: true)
                } else {
                    checkUserName()
                }
                print(status)
            } catch {
                print(error)
            }
        }
    }
    
    private func checkUserName()  {
        Task {
            do {
                let isExist = try await CheckService.shared.GetRegisterData(username: self.userName)
                
                if isExist == true {
                    let alert = UIAlertController(title: "중복된 계정", message: "이미 있는 아이디예요", preferredStyle: UIAlertController.Style.alert)
                    let okAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
                    alert.addAction(okAction)
                    self.present(alert, animated: true)
                } else {
                    let alert = UIAlertController(title: "계정생성 실패", message: "알 수 없는 오류가 발생했어요.", preferredStyle: UIAlertController.Style.alert)
                    let okAction =  UIAlertAction(title: "확인", style: UIAlertAction.Style.default)
                    alert.addAction(okAction)
                    self.present(alert, animated: true)
                }
            } catch {
                print(error)
            }
        }
    }
    
    @objc private func textFieldDidEditing(_ textField: UITextField) {
        switch textField {
        case idTextField:
            userName = textField.text ?? ""
        case passwordTextField:
            password = textField.text ?? ""
        default:
            nickName = textField.text ?? ""
        }
    }
    
    private func setLayout() {
        self.view.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(40)
            $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(200)
        }
        
        [idTextField, passwordTextField, nickNameTextField, registerButton, infoViewButton].forEach {
            self.stackView.addArrangedSubview($0)
        }
    }
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 20
    }
    
    private lazy var idTextField = UITextField().then {
        $0.addTarget(self,
                     action: #selector(textFieldDidEditing(_:)),
                     for: .allEvents)
        $0.backgroundColor = .lightGray
        $0.placeholder = "아이디를 입력하슈"
    }
    
    private lazy var passwordTextField = UITextField().then {
        $0.addTarget(self,
                     action: #selector(textFieldDidEditing(_:)),
                     for: .allEvents)
        $0.backgroundColor = .lightGray
        $0.placeholder = "패스워드를 입력하슈"
    }
    
    private lazy var nickNameTextField = UITextField().then {
        $0.addTarget(self,
                     action: #selector(textFieldDidEditing(_:)),
                     for: .allEvents)
        $0.backgroundColor = .lightGray
        $0.placeholder = "닉네임을 입력하슈"
    }
    
    private lazy var registerButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(registerButtonTap),
                     for: .touchUpInside)
        $0.backgroundColor = .blue
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.textColor = .white
    }
    
    private lazy var infoViewButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(infoViewButtonTap),
                     for: .touchUpInside)
        $0.backgroundColor = .blue
        $0.setTitle("회원정보 조회", for: .normal)
        $0.titleLabel?.textColor = .white
    }
}
