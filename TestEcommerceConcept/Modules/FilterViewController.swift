//
//  FilterViewController.swift
//  TestEcommerceConcept
//
//  Created by Линар Нигматзянов on 23/09/2022.
//

import UIKit
import SnapKit
import iOSDropDown

final class FilterViewController: UIViewController {
   
    private lazy var xButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "xButton"), for: .normal)
        button.backgroundColor = Colors.myBlue
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(tapXbutton), for: .touchUpInside)
        return button
    }()
    
    private let doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.lightGray, for: .highlighted)
        button.titleLabel?.font = Fonts.MarkBold20
        button.backgroundColor = Colors.myOrange
        button.layer.cornerRadius = 15
        return button
    }()
    private let filterLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Filter options"
        label.textColor = Colors.myBlue
        label.font = Fonts.MarkBold20
        return label
    }()
    
    private let brandLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Brand"
        label.textColor = Colors.myBlue
        label.font = Fonts.Mark15?.withSize(20)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Price"
        label.textColor = Colors.myBlue
        label.font = Fonts.Mark15?.withSize(20)
        return label
    }()
    
    private let sizeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Size"
        label.textColor = Colors.myBlue
        label.font = Fonts.Mark15?.withSize(20)
        return label
    }()
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.layer.cornerRadius = 50
        addSubview()
        setConstraints()
        configDropDownBrand()
        configDropDownPrice()
        configDropDownSize()
    }
    
    @objc func tapXbutton() {
        dismiss(animated: true)
    }
    
    private func configDropDownBrand() {
        let dropDownBrand = DropDown(frame: CGRect(x: 40, y: 165, width: view.bounds.width - 70, height: 40))
        dropDownBrand.optionArray = ["Samsung", "iPhone", "Xiaomi"]
        dropDownBrand.textColor = Colors.myBlue
        dropDownBrand.font = Fonts.Mark15
        dropDownBrand.arrowColor = .lightGray
        dropDownBrand.arrowSize = 15
        dropDownBrand.selectedRowColor = .lightGray
        dropDownBrand.borderStyle = .roundedRect
        dropDownBrand.text = "Samsung"
        view.addSubview(dropDownBrand)
    }
    
    private func configDropDownPrice() {
        let dropDownPrice = DropDown(frame: CGRect(x: 40, y: 240, width: view.bounds.width - 70, height: 40))
        dropDownPrice.optionArray = ["$300-500$", "$500-$1000", "$1000-$2000", "$2000-$3000"]
        dropDownPrice.textColor = Colors.myBlue
        dropDownPrice.font = Fonts.Mark15
        dropDownPrice.arrowColor = .lightGray
        dropDownPrice.arrowSize = 15
        dropDownPrice.selectedRowColor = .lightGray
        dropDownPrice.borderStyle = .roundedRect
        dropDownPrice.text = "$300-$500"
        view.addSubview(dropDownPrice)
    }
    
    private func configDropDownSize() {
        let dropDownSize = DropDown(frame: CGRect(x: 40, y: 315, width: view.bounds.width - 70, height: 40))
        dropDownSize.optionArray = ["4.5 to 5.5 inches", "5.5 to 6 inches", "6.5 to 7 inches", "7.5 to 8 inches"]
        dropDownSize.textColor = Colors.myBlue
        dropDownSize.font = Fonts.Mark15
        dropDownSize.arrowColor = .lightGray
        dropDownSize.arrowSize = 15
        dropDownSize.selectedRowColor = .lightGray
        dropDownSize.borderStyle = .roundedRect
        dropDownSize.text = "4.5 to 5.5 inches"
        view.addSubview(dropDownSize)
    }
    // MARK: - addSubview
    private func addSubview() {
        view.addSubview(xButton)
        view.addSubview(doneButton)
        view.addSubview(filterLabel)
        view.addSubview(brandLabel)
        view.addSubview(priceLabel)
        view.addSubview(sizeLabel)
   
    }
    // MARK: - setConstraints
    private func setConstraints() {
        xButton.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.left.equalTo(view.snp.left).offset(40)
            make.top.equalTo(view.snp.top).offset(40)
        }
        
        doneButton.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.left.equalTo(filterLabel.snp.right).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.top.equalTo(view.snp.top).offset(40)
        }
        filterLabel.snp.makeConstraints { make in
            make.left.equalTo(xButton.snp.right)
            make.top.equalTo(view.snp.top).offset(40)
            make.right.equalTo(doneButton.snp.left).offset(20)
            make.centerY.equalTo(xButton.snp.centerY)
            
        }
        priceLabel.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(40)
            make.top.equalTo(brandLabel.snp.bottom).offset(45)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        sizeLabel.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(40)
            make.top.equalTo(priceLabel.snp.bottom).offset(40)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
        brandLabel.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(40)
            make.top.equalTo(xButton.snp.bottom).offset(45)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
        
    }

}
