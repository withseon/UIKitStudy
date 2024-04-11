//
//  ProductCollectionViewCell.swift
//  SampleUIKit
//
//  Created by 정인선 on 11/21/23.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProductCollectioniViewCell"
    
    private let imageView: UIImageView = {
        let imageview = UIImageView()
        imageview.backgroundColor = .gray
        imageview.layer.cornerRadius = 10
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    private let brandLabel: UILabel = {
        let label = UILabel()
        label.text = "브랜드명"
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "상품명"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "가격"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tagLabel: UILabel = {
        let label = UILabel()
        label.text = "구매가/즉시구매가"
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        contentView.addSubview(brandLabel)
        NSLayoutConstraint.activate([
            brandLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            brandLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            brandLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])
        
        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: brandLabel.bottomAnchor)
        ])
        
        contentView.addSubview(priceLabel)
        NSLayoutConstraint.activate([
//            priceLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16)
        ])
        
        contentView.addSubview(tagLabel)
        NSLayoutConstraint.activate([
            tagLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            tagLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tagLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    ProductCollectionViewCell()
}
