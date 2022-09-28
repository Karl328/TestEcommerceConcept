//
//  categoryCollectionViewCell.swift
//  TestEcommerceConcept
//
//  Created by Линар Нигматзянов on 25/08/2022.
//

import UIKit
import SnapKit

final class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "Cell"
    
    public let labelCategory: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = Fonts.Mark15
        label.textColor = Colors.myBlue
        return label
    }()
    
    public var imageCell: UIImageView  = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = Colors.myGray
        return image
    }()
    
    private var categoryView: UIView  = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubview()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        categoryView.layer.cornerRadius = 35
        layer.shadowRadius = 8
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 4, height: 7)
        self.clipsToBounds = false
        
    }
    // MARK: - setSubview
    private func setSubview() {
        contentView.addSubview(categoryView)
        categoryView.addSubview(imageCell)
        categoryView.addSubview(labelCategory)
    }
    // MARK: - setConstraints
    private func setConstraints() {
        categoryView.snp.makeConstraints { make in
            make.width.equalTo(70)
            make.height.equalTo(70)
            make.leftMargin.equalTo(contentView.snp_leftMargin).offset(10)
        }
        
        imageCell.snp.makeConstraints { make in
            make.height.equalTo(30)
            make.width.equalTo(30)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        labelCategory.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(imageCell.snp.bottom).offset(10)
        }
    }
    
    func show() {
        categoryView.backgroundColor = Colors.myOrange
        labelCategory.textColor = Colors.myOrange
        imageCell.tintColor = .white
    }
    func hide() {
        categoryView.backgroundColor = .white
        labelCategory.textColor = Colors.myBlue
        imageCell.tintColor = Colors.myGray
    }
    
    
}
