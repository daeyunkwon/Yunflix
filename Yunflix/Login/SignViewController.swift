//
//  SignViewController.swift
//  Yunflix
//
//  Created by 권대윤 on 6/4/24.
//

import UIKit

import SnapKit

final class SignViewController: UIViewController {
    
    //MARK: - UI Components
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .systemRed
        return label
    }()
    
    private let emailTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "이메일 주소 또는 전화번호", attributes: [.foregroundColor: UIColor.white])
        tf.textColor = .white
        tf.textAlignment = .center
        tf.returnKeyType = .done
        tf.keyboardType = .emailAddress
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.font = .systemFont(ofSize: 14)
        tf.backgroundColor = .darkGray
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [.foregroundColor: UIColor.white])
        tf.textColor = .white
        tf.textAlignment = .center
        tf.returnKeyType = .done
        tf.keyboardType = .default
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.font = .systemFont(ofSize: 14)
        tf.backgroundColor = .darkGray
        tf.borderStyle = .roundedRect
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let nicknameTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "닉네임", attributes: [.foregroundColor: UIColor.white])
        tf.textColor = .white
        tf.textAlignment = .center
        tf.returnKeyType = .done
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.font = .systemFont(ofSize: 14)
        tf.backgroundColor = .darkGray
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    private let locationTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "위치", attributes: [.foregroundColor: UIColor.white])
        tf.textColor = .white
        tf.textAlignment = .center
        tf.returnKeyType = .done
        tf.autocapitalizationType = .none
        tf.borderStyle = .roundedRect
        tf.autocorrectionType = .no
        tf.font = .systemFont(ofSize: 14)
        tf.backgroundColor = .darkGray
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    private let recommendationCodeTextField: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "추천 코드 입력", attributes: [.foregroundColor: UIColor.white])
        tf.textColor = .white
        tf.textAlignment = .center
        tf.returnKeyType = .done
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.font = .systemFont(ofSize: 14)
        tf.backgroundColor = .darkGray
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    private lazy var signButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setAttributedTitle(NSAttributedString(string: "회원가입", attributes: [.font: UIFont.boldSystemFont(ofSize: 16)]), for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 14)
        btn.setTitleColor(.black, for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(signButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    private let switchButton: UISwitch = {
        let sb = UISwitch()
        sb.setOn(false, animated: true)
        sb.onTintColor = .systemRed
        sb.thumbTintColor = .white
        return sb
    }()
    
    private let addInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    

    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureUI()
    }
    
    private func configureLayout() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.height.equalTo(36)
            make.centerX.equalTo(view.snp.centerX)
        }
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, nicknameTextField, locationTextField, recommendationCodeTextField, signButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(300)
        }
        
        view.addSubview(addInfoLabel)
        addInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)

        }
        
        view.addSubview(switchButton)
        switchButton.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
    }
    
    private func configureUI() {
        view.backgroundColor = .black
        titleLabel.text = "YUNFLIX"
        addInfoLabel.text = "추가 정보 입력"
    }
    
    //MARK: - Functions

    @objc func signButtonTapped() {
        self.view.endEditing(true)
        
        guard let email = emailTextField.text, email != "" else {
            print("이메일이 유효하지 않아 가입 거부 되었습니다.")
            return
        }
        
        guard let password = passwordTextField.text, password.count > 5 else {
            print("비밀번호가 유효하지 않아 가입 거부 되었습니다.")
            return
        }
        
        guard let nickName = nicknameTextField.text, nickName != "" else {
            print("닉네임이 유효하지 않아 가입 거부 되었습니다.")
            return
        }
        
        guard let location = locationTextField.text, location != "" else {
            print("위치 정보가 유효하지 않아 가입 거부 되었습니다.")
            return
        }
        
        guard let recommendationCode = recommendationCodeTextField.text, recommendationCode != "", Int(recommendationCode) != nil else {
            print("추천 코드가 유효하지 않아 가입 거부 되었습니다.")
            return
        }
        
        print("회원가입성공")
    }
}

