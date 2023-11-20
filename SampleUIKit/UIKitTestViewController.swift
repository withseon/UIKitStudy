//
//  UIKitTestViewController.swift
//  SampleUIKit
//
//  Created by 정인선 on 11/17/23.
//

import UIKit

class UIKitTestViewController: UIViewController {
    override func viewDidLoad() {
        
        // MARK: - superView, sefeArea 변수 초기화 및 백그라운드 시스템 컬러 맞춰주기
        let superView = self.view!
        superView.backgroundColor = .systemBackground
        let safeArea = superView.safeAreaLayoutGuide
        
        // MARK: - 상단 검색뷰 (서치뷰 + 버튼)
        let searchView: UISearchBar = {
            let searchBar = UISearchBar()
            searchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
            searchBar.searchBarStyle = .minimal
            searchBar.translatesAutoresizingMaskIntoConstraints = false
            return searchBar
        }()
        
        superView.addSubview(searchView)
        
        let alarmButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "bell"), for: .normal)
            button.setPreferredSymbolConfiguration(.init(pointSize: 20, weight: .light, scale: .large), forImageIn: .normal)
            button.tintColor = .black
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        superView.addSubview(alarmButton)
        
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            searchView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            searchView.trailingAnchor.constraint(equalTo: alarmButton.leadingAnchor, constant: -8),
            
            alarmButton.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            alarmButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16)
        ])
        
        // MARK: - 카테고리 스크롤 뷰 (horizontal)
        let categoryScrollView: UIScrollView = {
            let scrollView = UIScrollView()
            // 스크롤 가리기
            scrollView.showsHorizontalScrollIndicator = false
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
        
        superView.addSubview(categoryScrollView)
        
        // categoryScrollView 제약조건
        NSLayoutConstraint.activate([
            categoryScrollView.topAnchor.constraint(equalTo: searchView.bottomAnchor),
            categoryScrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            categoryScrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            categoryScrollView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
        let categoryContentView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        categoryScrollView.addSubview(categoryContentView)
        
        // contentView 제약조건. scrollView의 contentLayoutGuide에 맞춤
        NSLayoutConstraint.activate([
            categoryContentView.topAnchor.constraint(equalTo: categoryScrollView.contentLayoutGuide.topAnchor),
            categoryContentView.bottomAnchor.constraint(equalTo: categoryScrollView.contentLayoutGuide.bottomAnchor),
            categoryContentView.leadingAnchor.constraint(equalTo: categoryScrollView.contentLayoutGuide.leadingAnchor),
            categoryContentView.trailingAnchor.constraint(equalTo: categoryScrollView.contentLayoutGuide.trailingAnchor)
        ])
        
        // 수평 스크롤이므로, contentView의 높이를 scrollView 높이에 맞추고, 너비는 safeArea의 너비보다 크거나 같게 해줌
        // priority 값을 조정하여 scroll 될 수 있게
        categoryContentView.heightAnchor.constraint(equalTo: categoryScrollView.frameLayoutGuide.heightAnchor).isActive = true
        let categoryContentViewWidth = categoryContentView.widthAnchor.constraint(greaterThanOrEqualTo: safeArea.widthAnchor)
        //content hugging priority(Horizontal)
//        categoryContentViewWidth.priority = .defaultLow
        categoryContentViewWidth.isActive = true
        
        
        let categories = ["KBO현역", "추천", "랭킹", "발매정보", "럭셔리", "남성", "여성", "발견"]
        
        categories.forEach { category in
            let cateButton: UIButton = {
                let button = UIButton()
                button.setTitle(category, for: .normal)
                button.setTitleColor(.black, for: .normal)
                button.translatesAutoresizingMaskIntoConstraints = false
                return button
            }()
            
            categoryContentView.addSubview(cateButton)
        }
        
        NSLayoutConstraint.activate([
//                categoryBtn1.leadingAnchor.constraint(equalTo: categoryContentView.leadingAnchor),
//                categoryBtn2.leadingAnchor.constraint(equalTo: categoryBtn1.trailingAnchor, constant: 16),
//                categoryBtn3.leadingAnchor.constraint(equalTo: categoryBtn2.trailingAnchor, constant: 16),
//                categoryBtn4.leadingAnchor.constraint(equalTo: categoryBtn3.trailingAnchor, constant: 16),
//                categoryBtn5.leadingAnchor.constraint(equalTo: categoryBtn4.trailingAnchor, constant: 16),
//                categoryBtn6.leadingAnchor.constraint(equalTo: categoryBtn5.trailingAnchor, constant: 16),
//                categoryBtn7.leadingAnchor.constraint(equalTo: categoryBtn6.trailingAnchor, constant: 16),
//                categoryBtn8.leadingAnchor.constraint(equalTo: categoryBtn7.trailingAnchor, constant: 16),
//                categoryBtn8.trailingAnchor.constraint(equalTo: categoryContentView.trailingAnchor)
        ])
        
        
        // MARK: - 메인 스크롤 뷰 (vertical)
        
        let mainScrollView: UIScrollView = {
            let scrollView = UIScrollView()
            // 스크롤 가리기
            scrollView.showsVerticalScrollIndicator = false
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
        
        superView.addSubview(mainScrollView)
        
        // mainScrollView 제약조건
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: categoryScrollView.bottomAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            mainScrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
        
        let mainContentView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        mainScrollView.addSubview(mainContentView)
        
        // mainContentView 제약조건. mainScrollView의 ContentLayoutGuide에 맞춤
        NSLayoutConstraint.activate([
            mainContentView.topAnchor.constraint(equalTo: mainScrollView.contentLayoutGuide.topAnchor),
            mainContentView.bottomAnchor.constraint(equalTo: mainScrollView.contentLayoutGuide.bottomAnchor),
            mainContentView.leadingAnchor.constraint(equalTo: mainScrollView.contentLayoutGuide.leadingAnchor),
            mainContentView.trailingAnchor.constraint(equalTo: mainScrollView.contentLayoutGuide.trailingAnchor)
        ])
        
        // 수직 스크롤
        mainContentView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor).isActive = true
        let mainContentViewHeight = mainContentView.heightAnchor.constraint(greaterThanOrEqualTo: safeArea.heightAnchor)
//        mainContentViewHeight.priority = .defaultLow
        mainContentViewHeight.isActive = true
        
        
        // MARK: - 메인 스크롤 뷰 내부에 있는 이미지 스크롤 뷰(horizontal)
        
        let imageScrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
        
        superView.addSubview(imageScrollView)
        
        // imageScrollView 제약조건을 mainContentView에 맞춤
        NSLayoutConstraint.activate([
            imageScrollView.topAnchor.constraint(equalTo: mainContentView.topAnchor),
            imageScrollView.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor),
            imageScrollView.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor),
            imageScrollView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        let imageContentView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        imageScrollView.addSubview(imageContentView)
        
        // imageContentView 제약조건. imageScrollView의 ContentLayoutGuide에 맞춤
        NSLayoutConstraint.activate([
            imageContentView.topAnchor.constraint(equalTo: imageScrollView.contentLayoutGuide.topAnchor),
            imageContentView.bottomAnchor.constraint(equalTo: imageScrollView.contentLayoutGuide.bottomAnchor),
            imageContentView.leadingAnchor.constraint(equalTo: imageScrollView.contentLayoutGuide.leadingAnchor),
            imageContentView.trailingAnchor.constraint(equalTo: imageScrollView.contentLayoutGuide.trailingAnchor),
        ])
        
        // 수평 스크롤
        imageContentView.heightAnchor.constraint(equalTo: imageScrollView.frameLayoutGuide.heightAnchor).isActive = true
        let imageContentViewWidth = imageContentView.widthAnchor.constraint(greaterThanOrEqualTo: safeArea.widthAnchor)
//        imageContentViewWidth.priority = .defaultLow
        imageContentViewWidth.isActive = true
        
        let mainImageView1: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "Hamster2")
            imageView.contentMode = .scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        imageContentView.addSubview(mainImageView1)
        
        let mainImageView2: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "Hamster4")
            imageView.contentMode = .scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        imageContentView.addSubview(mainImageView2)
        
        let mainImageView3: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "Hamster5")
            imageView.contentMode = .scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        imageContentView.addSubview(mainImageView3)
        
        NSLayoutConstraint.activate([
            mainImageView1.topAnchor.constraint(equalTo: imageContentView.topAnchor),
            mainImageView1.leadingAnchor.constraint(equalTo: imageContentView.leadingAnchor),
            mainImageView1.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            mainImageView1.heightAnchor.constraint(equalTo: imageContentView.heightAnchor),
            
            mainImageView2.topAnchor.constraint(equalTo: imageContentView.topAnchor),
            mainImageView2.leadingAnchor.constraint(equalTo: mainImageView1.trailingAnchor),
            mainImageView2.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            mainImageView2.heightAnchor.constraint(equalTo: imageContentView.heightAnchor),
            
            mainImageView3.topAnchor.constraint(equalTo: imageContentView.topAnchor),
            mainImageView3.leadingAnchor.constraint(equalTo: mainImageView2.trailingAnchor),
            mainImageView3.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            mainImageView3.heightAnchor.constraint(equalTo: imageContentView.heightAnchor),
            // 중요!!!!!!!!!!!!!!!!!!!!!
            mainImageView3.trailingAnchor.constraint(equalTo: imageContentView.trailingAnchor)
        ])
        
        // MARK: - 메인 스크롤 뷰 내부에 있는 버튼
        
        var mainButtons = [UIButton]()
        let btnTitle = ["블랙 드로우", "실시간 차트", "남성", "여성", "타임 특가", "정가 아래", "겨울 패딩\n총정리", "가성비\n윈터 아우터", "11월\n혜택 모음", "무조건\n포인트"]
        
        btnTitle.forEach { title in
            let mainBtn: UIButton = {
                let button = UIButton()
                button.setTitle(title, for: .normal)
                button.titleLabel?.font = UIFont(name: "Helvetica", size: 12)
                button.titleLabel?.numberOfLines = 2
                button.titleLabel?.textAlignment = .center
                button.setTitleColor(.darkGray, for: .normal)
                button.backgroundColor = .lightGray
                button.layer.cornerRadius = 30
                button.translatesAutoresizingMaskIntoConstraints = false
                return button
            }()
            
            NSLayoutConstraint.activate([
                mainBtn.heightAnchor.constraint(equalTo: mainBtn.widthAnchor, multiplier: 1.0)
            ])
            
            mainButtons.append(mainBtn)
        }
        
        let mainHStack1: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: Array(mainButtons[0...4]))
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.spacing = 8
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        mainContentView.addSubview(mainHStack1)
        
        NSLayoutConstraint.activate([
            mainHStack1.topAnchor.constraint(equalTo: imageScrollView.bottomAnchor, constant: 25),
            mainHStack1.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 16),
            mainHStack1.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -16)
        ])
        
        let mainHStack2: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: Array(mainButtons[5...9]))
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.spacing = 8
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        mainContentView.addSubview(mainHStack2)
        
        NSLayoutConstraint.activate([
            mainHStack2.topAnchor.constraint(equalTo: mainHStack1.bottomAnchor, constant: 8),
            mainHStack2.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 16),
            mainHStack2.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -16)
        ])

        
        // MARK: - 메인 스크롤 뷰 내부 Divde 이후 상품 뷰
        
        
        let dividerView: UIView = {
            let view = UIView()
            view.backgroundColor = .lightGray
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        mainContentView.addSubview(dividerView)
        
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: mainHStack2.bottomAnchor, constant: 25),
            dividerView.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor),
            dividerView.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor),
            dividerView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
        let titleDrop: UILabel = {
            let label = UILabel()
            label.text = "Just Dropped"
            label.font = UIFont(name: "Hevetica", size: 14)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        mainContentView.addSubview(titleDrop)
        
        NSLayoutConstraint.activate([
            titleDrop.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 25),
            titleDrop.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 16)
        ])
        
        let subtitleDrop: UILabel = {
            let label = UILabel()
            label.text = "발매 상품"
            label.font = UIFont.systemFont(ofSize: 12)
            label.textColor = .gray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        mainContentView.addSubview(subtitleDrop)
        
        NSLayoutConstraint.activate([
            subtitleDrop.topAnchor.constraint(equalTo: titleDrop.bottomAnchor),
            subtitleDrop.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 16)
        ])
        
        let moreDrop: UIButton = {
            let button = UIButton()
            button.setTitle("더보기", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
            button.setTitleColor(.gray, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
        mainContentView.addSubview(moreDrop)
        
        NSLayoutConstraint.activate([
            moreDrop.lastBaselineAnchor.constraint(equalTo: subtitleDrop.lastBaselineAnchor),
            moreDrop.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -16)
        ])
        
        
        let imageview1: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: "cheeseduck1")
            image.contentMode = .scaleAspectFit
            image.backgroundColor = .lightGray
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
        
        mainContentView.addSubview(imageview1)
        
        NSLayoutConstraint.activate([
            imageview1.topAnchor.constraint(equalTo: subtitleDrop.bottomAnchor, constant: 8),
            imageview1.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 16),
            imageview1.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -16),
            imageview1.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let imageview2: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: "cheeseduck1")
            image.contentMode = .scaleAspectFit
            image.backgroundColor = .lightGray
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
        
        mainContentView.addSubview(imageview2)
        
        NSLayoutConstraint.activate([
            imageview2.topAnchor.constraint(equalTo: imageview1.bottomAnchor, constant: 8),
            imageview2.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 16),
            imageview2.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -16),
            imageview2.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        let imageview3: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: "cheeseduck1")
            image.contentMode = .scaleAspectFit
            image.backgroundColor = .lightGray
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
        
        mainContentView.addSubview(imageview3)
        
        NSLayoutConstraint.activate([
            imageview3.topAnchor.constraint(equalTo: imageview2.bottomAnchor, constant: 8),
            imageview3.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 16),
            imageview3.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -16),
            imageview3.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        let imageview4: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: "cheeseduck1")
            image.contentMode = .scaleAspectFit
            image.backgroundColor = .lightGray
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
        
        mainContentView.addSubview(imageview4)
        
        NSLayoutConstraint.activate([
            imageview4.topAnchor.constraint(equalTo: imageview3.bottomAnchor, constant: 8),
            imageview4.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 16),
            imageview4.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -16),
            imageview4.heightAnchor.constraint(equalToConstant: 50),
            
            imageview4.bottomAnchor.constraint(equalTo: mainContentView.bottomAnchor)
        ])

    }
}

#Preview {
    UIKitTestViewController()
}
