//
//  ProductCollectionView.swift
//  SampleUIKit
//
//  Created by 정인선 on 11/22/23.
//

import UIKit

class ProductCollectionViewController: UIViewController {

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 20000
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalToConstant: view.frame.width),
            collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}

extension ProductCollectionViewController: UICollectionViewDelegate {
    // 셀 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/3, height: view.frame.width)
    }
}

extension ProductCollectionViewController: UICollectionViewDataSource {
    // 셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    // 셀 지정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell
        else {
            return ProductCollectionViewCell()
        }
        cell.backgroundColor = .clear
        return cell
    }
}

#Preview {
    ProductCollectionViewController()
}
