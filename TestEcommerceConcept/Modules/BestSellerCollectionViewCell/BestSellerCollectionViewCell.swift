//
//  BestSellerCollectionViewCell.swift
//  TestEcommerceConcept
//
//  Created by Линар Нигматзянов on 20/09/2022.
//

import UIKit
import SnapKit

final class BestSellerCollectionViewCell: UICollectionViewCell {
    static let identifier = "Cell"
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.shadowRadius = 8
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 4, height: 7)
        return view
    }()
    
    public let imageView : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    
    public let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.myBlue
        label.font = Fonts.MarkBold20
        label.textAlignment = .left
        return label
    }()
    
    public let priceWithDiscountLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.myGray
        label.font = Fonts.Mark15
        label.textAlignment = .left
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: "Text")
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        label.attributedText = attributeString
        return label
    }()
    
    public let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.myBlue
        label.font = Fonts.Mark15
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let favoriteView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 17.5
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 4, height: 7)
        view.clipsToBounds = false
        view.backgroundColor = .white
        return view
    }()
    
    public lazy var favoriteButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "heart")
        button.setImage(image, for: .normal)
        button.setImage(UIImage(named: "heart2"), for: .selected)
        button.addTarget(self, action: #selector(tapFavoriteButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubview()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapFavoriteButton() {
        favoriteButton.isSelected.toggle()
    }
    // MARK: - setSubview
    private func setSubview() {
        addSubview(mainView)
        mainView.addSubview(imageView)
        mainView.addSubview(priceLabel)
        mainView.addSubview(priceWithDiscountLabel)
        mainView.addSubview(nameLabel)
        mainView.addSubview(favoriteView)
        favoriteView.addSubview(favoriteButton)
    }
    // MARK: - setSubview
    private func setConstraints() {
        mainView.snp.makeConstraints { make in
            make.leftMargin.equalToSuperview()
            make.rightMargin.equalToSuperview()
            make.topMargin.equalToSuperview()
            make.bottomMargin.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.left.equalTo(mainView.snp.left)
            make.right.equalTo(mainView.snp.right)
            make.top.equalToSuperview().offset(5)
            make.height.equalTo(195)
            make.centerX.equalTo(mainView.snp_centerXWithinMargins)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.left.equalTo(mainView.snp.left).offset(20)
            make.width.equalTo(60)
        }
        
        priceWithDiscountLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.left.equalTo(priceLabel.snp.right).offset(5)
            make.width.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(priceWithDiscountLabel.snp.bottom).offset(5)
            make.left.equalTo(mainView.snp.left).offset(20)
            make.right.equalTo(mainView.snp.right).offset(-5)
        }
        
        favoriteView.snp.makeConstraints { make in
            make.right.equalTo(mainView.snp.right).offset(-15)
            make.top.equalTo(mainView.snp.top).offset(15)
            make.width.equalTo(35)
            make.height.equalTo(35)
        }
        
        favoriteButton.snp.makeConstraints { make in
            make.width.equalTo(20)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
    }
}
