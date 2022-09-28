//
//  HotSalesCollectionViewCell.swift
//  TestEcommerceConcept
//
//  Created by Линар Нигматзянов on 18/09/2022.
//

import UIKit
import SnapKit

final class HotSalesCollectionViewCell: UICollectionViewCell {
    static let identifier = "Cell"
    
    private let mainView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()
    
    public let imageView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        return image
    }()
    
    public let newLabel: UILabel = {
        let label = UILabel()
        label.layer.cornerRadius = 20
        label.layer.masksToBounds = true
        label.backgroundColor = Colors.myOrange
        label.textColor = .white
        label.font = Fonts.MarkBold15
        label.textAlignment = .center
        label.text = "New"
        return label
    }()
    
    public let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = Fonts.MarkBold25
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    public let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = Fonts.MarkBold15
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    public let isBuyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Buy now!", for: .normal)
        button.setTitleColor(Colors.myBlue, for: .normal)
        button.setTitleColor(Colors.myOrange, for: .highlighted)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = Fonts.MarkBold15?.withSize(10)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubview()
        setConstraints()
        newLabel.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - setSubview
    private func setSubview() {
        addSubview(mainView)
        mainView.addSubview(imageView)
        mainView.addSubview(newLabel)
        mainView.addSubview(nameLabel)
        mainView.addSubview(subtitleLabel)
        mainView.addSubview(isBuyButton)
    }
    // MARK: - setConstraints
    private func  setConstraints() {
        mainView.snp.makeConstraints { make in
            make.leftMargin.equalToSuperview()
            make.rightMargin.equalToSuperview()
            make.topMargin.equalToSuperview()
            make.bottomMargin.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(mainView.snp.height)
            make.width.equalTo(mainView.snp.width)
        }
        
        newLabel.snp.makeConstraints { make in
            make.width.equalTo(40)
            make.height.equalTo(40)
            make.leftMargin.equalTo(mainView.snp_leftMargin).offset(20)
            make.topMargin.equalTo(mainView.snp_topMargin).offset(20)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(100)
            make.top.equalTo(newLabel.snp_bottomMargin).offset(20)
            make.leftMargin.equalTo(mainView.snp_leftMargin).offset(20)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(100)
            make.top.equalTo(nameLabel.snp_topMargin).offset(20)
            make.leftMargin.equalTo(mainView.snp_leftMargin).offset(20)
        }
        
        isBuyButton.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(20)
            make.top.equalTo(subtitleLabel.snp.bottom).offset(-30)
            make.left.equalTo(mainView.snp_leftMargin).offset(10)
        }
        
    }
}
