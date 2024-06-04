//
//  ViewController.swift
//  Yunflix
//
//  Created by 권대윤 on 6/4/24.
//

import UIKit

import SnapKit

final class HomeViewController: UIViewController {
    
    //MARK: - Properties
    
    var movieNames: [String] = ["극한직업", "노량", "더퍼스트슬램덩크", "도둑들", "명량", "밀수", "범죄도시3", "베테랑", "부산행", "서울의봄", "스즈메의문단속", "신과함께인과연", "신과함께죄와벌", "아바타", "아바타물의길", "알라딘", "암살", "어벤져스엔드게임", "오펜하이머", "왕의남자", "육사오", "콘크리트유토피아", "태극기휘날리며", "택시운전사", "해운대"]
    
    //MARK: - UI Components
    
    private let backImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let mainImageView: UIImageView = {
        let iv = UIImageView()
        iv.layer.cornerRadius = 10
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .lightGray
        return iv
    }()
    
    private let keywordLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var playButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "play.fill"), for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 5
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 10
        buttonConfiguration.baseForegroundColor = .black
        btn.configuration = buttonConfiguration
        btn.setAttributedTitle(.init(string: "재생", attributes: [.font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.black]), for: .normal)
        
        btn.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var favoriteListButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "plus"), for: .normal)
        btn.backgroundColor = UIColor(red: 0.19, green: 0.19, blue: 0.18, alpha: 1.00)
        btn.layer.cornerRadius = 5
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.imagePadding = 10
        buttonConfiguration.baseForegroundColor = .white
        btn.configuration = buttonConfiguration
        btn.setAttributedTitle(.init(string: "내가 찜한 리스트", attributes: [.font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.white]), for: .normal)
        
        btn.addTarget(self, action: #selector(favoriteListButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    private let trendContentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    private let trendContentLeftImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        iv.backgroundColor = .lightGray
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let trendContentCenterImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        iv.backgroundColor = .lightGray
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let trendContentRightImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        iv.backgroundColor = .lightGray
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let trnedContentLeftTopMarkImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .clear
        return iv
    }()
    
    private let trnedContentCenterTopMarkImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .clear
        return iv
    }()
    
    private let trnedContentRightTopMarkImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .clear
        return iv
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavi()
        configureLayout()
        configureUI()
    }
    
    private func setupNavi() {
        navigationItem.title = "고래밥님"
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .black
        
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 20)]
        
        navigationController?.navigationBar.tintColor = .white
        
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
    }
    
    private func configureLayout() {
        view.addSubview(backImageView)
        backImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        view.addSubview(mainImageView)
        mainImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(450)
        }
        
        mainImageView.addSubview(keywordLabel)
        keywordLabel.snp.makeConstraints {
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(20)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(130)
        }
        
        view.addSubview(playButton)
        playButton.snp.makeConstraints {
            $0.width.equalTo(162)
            $0.height.equalTo(44)
            $0.bottom.equalTo(mainImageView.snp.bottom).offset(-25)
            $0.leading.equalTo(mainImageView.snp.leading).offset(10)
        }
        
        view.addSubview(favoriteListButton)
        favoriteListButton.snp.makeConstraints {
            $0.width.equalTo(162)
            $0.height.equalTo(44)
            $0.bottom.equalTo(mainImageView.snp.bottom).offset(-25)
            $0.trailing.equalTo(mainImageView.snp.trailing).offset(-10)
        }
        
        view.addSubview(trendContentLabel)
        trendContentLabel.snp.makeConstraints {
            $0.leading.equalTo(10)
            $0.top.equalTo(mainImageView.snp.bottom).offset(20)
            $0.height.equalTo(20)
        }
        
        let stackView = UIStackView(arrangedSubviews: [trendContentLeftImageView, trendContentCenterImageView, trendContentRightImageView])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(trendContentLabel.snp.bottom).offset(5)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
        }
        
        trendContentLeftImageView.addSubview(trnedContentLeftTopMarkImageView)
        trnedContentLeftTopMarkImageView.snp.makeConstraints {
            $0.top.trailing.equalTo(0)
            $0.width.equalTo(25)
            $0.height.equalTo(35)
        }
        
        trendContentCenterImageView.addSubview(trnedContentCenterTopMarkImageView)
        trnedContentCenterTopMarkImageView.snp.makeConstraints {
            $0.top.trailing.equalTo(0)
            $0.width.equalTo(25)
            $0.height.equalTo(35)
        }
        
        trendContentRightImageView.addSubview(trnedContentRightTopMarkImageView)
        trnedContentRightTopMarkImageView.snp.makeConstraints {
            $0.top.trailing.equalTo(0)
            $0.width.equalTo(25)
            $0.height.equalTo(35)
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .black
        
        backImageView.image = UIImage.background
        mainImageView.image = UIImage.노량
        keywordLabel.text = "응원하고픈 • 흥미진진 • 사극 • 전투 • 한국 작품"
        trendContentLabel.text = "지금 뜨는 콘텐츠"
        trendContentLeftImageView.image = UIImage.스즈메의문단속
        trendContentCenterImageView.image = UIImage.범죄도시3
        trendContentRightImageView.image = UIImage.아바타물의길
    }
    
    //MARK: - Functions
    
    private func randomMovieNameWithoutDuplicates(previousMovieNames: [String]) -> String {
        var randomMovieName = movieNames.randomElement() ?? ""
        
        while true {
            var count = 0
            
            for previousMovieName in previousMovieNames {
                if previousMovieName != randomMovieName {
                    count += 1
                }
            }
            
            if previousMovieNames.count == count {
                return randomMovieName
            }
            
            randomMovieName = movieNames.randomElement() ?? ""
        }
    }
    
    private func randomlyDisplayTopTenMark(with imageView: UIImageView) {
        let random: [Bool] = [true, false]
        
        let isShowTopTenMark = random.randomElement() ?? false
        if isShowTopTenMark {
            imageView.image = UIImage.top10Badge
        } else {
            imageView.image = nil
        }
    }
    
    @objc func playButtonTapped() {
        var previousMovieNames: [String] = []
        
        let movieNameForMain = movieNames.randomElement() ?? ""
        mainImageView.image = UIImage(named: movieNameForMain)
        previousMovieNames.append(movieNameForMain)
        
        let movieNameForComingUpContentLeft = randomMovieNameWithoutDuplicates(previousMovieNames: previousMovieNames)
        trendContentLeftImageView.image = UIImage(named: movieNameForComingUpContentLeft)
        previousMovieNames.append(movieNameForComingUpContentLeft)
        
        let movieNameForComingUpContentCenter = randomMovieNameWithoutDuplicates(previousMovieNames: previousMovieNames)
        trendContentCenterImageView.image = UIImage(named: movieNameForComingUpContentCenter)
        previousMovieNames.append(movieNameForComingUpContentCenter)
        
        let movieNameForComingUpContentRight = randomMovieNameWithoutDuplicates(previousMovieNames: previousMovieNames)
        trendContentRightImageView.image = UIImage(named: movieNameForComingUpContentRight)
        
        randomlyDisplayTopTenMark(with: trnedContentLeftTopMarkImageView)
        randomlyDisplayTopTenMark(with: trnedContentCenterTopMarkImageView)
        randomlyDisplayTopTenMark(with: trnedContentRightTopMarkImageView)
    }
    
    @objc func favoriteListButtonTapped() {
        print(#function)
    }
}

