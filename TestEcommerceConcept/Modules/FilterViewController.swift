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
    let deviceType = UIDevice.current.modelName
    
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
    
    
    private func configDropDown (x: CGFloat, y: CGFloat, optionArray: [String], text: String ) {
        let dropDown = DropDown(frame: CGRect(x: x, y: y, width: view.bounds.width - 70, height: 40))
        dropDown.optionArray = optionArray
        dropDown.textColor = Colors.myBlue
        dropDown.font = Fonts.Mark15
        dropDown.arrowColor = .lightGray
        dropDown.arrowSize = 15
        dropDown.selectedRowColor = .lightGray
        dropDown.borderStyle = .roundedRect
        dropDown.text = text
        view.addSubview(dropDown)
    }
    private func configDropDownBrand() {
        switch deviceType {
        case "iPhone10,4", "iPhone10,5":
         configDropDown(x: 40, y: 145, optionArray: ["Samsung", "iPhone", "Xiaomi"], text: "Samsung")
        default:
            configDropDown(x: 40, y: 165, optionArray: ["Samsung", "iPhone", "Xiaomi"], text: "Samsung")
        }
    }
    private func configDropDownPrice() {
        switch deviceType {
        case "iPhone10,4", "iPhone10,5":
            configDropDown(x: 40, y: 220, optionArray: ["$300-500$", "$500-$1000", "$1000-$2000", "$2000-$3000"], text: "$300-$500")
        default:
            configDropDown(x: 40, y: 240, optionArray: ["$300-500$", "$500-$1000", "$1000-$2000", "$2000-$3000"], text: "$300-$500")
        }
    }
    private func configDropDownSize() {
        switch deviceType {
        case "iPhone10,4", "iPhone10,5":
            configDropDown(x: 40, y: 290, optionArray: ["4.5 to 5.5 inches", "5.5 to 6 inches", "6.5 to 7 inches", "7.5 to 8 inches"], text: "4.5 to 5.5 inches")
        default:
            configDropDown(x: 40, y: 315, optionArray: ["4.5 to 5.5 inches", "5.5 to 6 inches", "6.5 to 7 inches", "7.5 to 8 inches"], text: "4.5 to 5.5 inches")
        }
        
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
        
        switch deviceType {
        case "iPhone10,4", "iPhone10,5":
            brandLabel.snp.makeConstraints { make in
                make.left.equalTo(view.snp.left).offset(40)
                make.top.equalTo(xButton.snp.bottom).offset(25)
                make.width.equalTo(100)
                make.height.equalTo(30)
            }
        default:
           break
        }
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
