//
//  ViewController.swift
//  TestEcommerceConcept
//
//  Created by Линар Нигматзянов on 23/08/2022.
//

import UIKit
import SnapKit
import Kingfisher
final class CartViewController: UIViewController {
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "backButton")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
        return button
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.MarkBold20?.withSize(15)
        label.textColor = Colors.myBlue
        label.text = "Add address"
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        return label
    }()
    
    private let addressButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "addAddressicon")
        button.setImage(image, for: .normal)
        button.backgroundColor = Colors.myOrange
        button.layer.cornerRadius = 10
        return button
    }()
    
    private let myCartLabel: UILabel = {
        let label = UILabel()
        label.text = "My Cart"
        label.font = Fonts.MarkBold25?.withSize(30)
        label.textColor = Colors.myBlue
        return label
    }()
    
    private let bottomView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 35
        view.backgroundColor = Colors.myBlue
        return view
    }()
    private let imageView1: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        image.layer.cornerRadius = 10
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.kf.indicatorType = .activity
        image.isHidden = true
        return image
    }()
    private let imageTitleLabel1: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .white
        label.font = Fonts.MarkBold20
        return label
    }()
    private let priceLabel1: UILabel = {
        let label = UILabel()
        label.textColor = Colors.myOrange
        label.font = Fonts.MarkBold20
        return label
    }()
    private let imageView2: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        image.layer.cornerRadius = 10
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.kf.indicatorType = .activity
        image.isHidden = true
        return image
    }()
    private let imageTitleLabel2: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .white
        label.font = Fonts.MarkBold20
        return label
    }()
    private let priceLabel2: UILabel = {
        let label = UILabel()
        label.textColor = Colors.myOrange
        label.font = Fonts.MarkBold20
        return label
    }()
    
    lazy var decreaseAmountButtonOne: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "decreaseButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 11).isActive = true
        button.widthAnchor.constraint(equalToConstant: 11).isActive = true
        button.addTarget(self, action: #selector(decreaseItemsInCartByOne), for: .touchUpInside)
        return button
    }()
    lazy var increaseAmountButtonOne: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "increaseButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 11).isActive = true
        button.widthAnchor.constraint(equalToConstant: 11).isActive = true
        button.addTarget(self, action: #selector(increaseItemsInCartByOne), for: .touchUpInside)
        return button
    }()
    lazy var amountLabelOfFirstPhone: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = Fonts.MarkBold20
        label.textColor = UIColor.white
        return label
        
    }()
    let changeAmountView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2081801295, green: 0.2133497298, blue: 0.3324833512, alpha: 1)
        view.layer.cornerRadius = 14
        return view
        
    }()
    lazy var deleteItemButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "deleteIcon"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 23).isActive = true
        button.widthAnchor.constraint(equalToConstant: 23).isActive = true
        return button
    }()
    lazy var decreaseAmountButtonTwo: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "decreaseButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 11).isActive = true
        button.widthAnchor.constraint(equalToConstant: 11).isActive = true
        button.addTarget(self, action: #selector(decreaseItemsInCartBySecond), for: .touchUpInside)
        return button
    }()
    lazy var increaseAmountButtonTwo: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "increaseButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 11).isActive = true
        button.widthAnchor.constraint(equalToConstant: 11).isActive = true
        button.addTarget(self, action: #selector(increaseItemsInCartBySecond), for: .touchUpInside)
        return button
    }()
    lazy var amountLabelOfSecondPhone: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = Fonts.MarkBold20
        label.textColor = UIColor.white
        return label
    }()
    let changeAmountViewSecond: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2081801295, green: 0.2133497298, blue: 0.3324833512, alpha: 1)
        view.layer.cornerRadius = 14
        return view
        
    }()
    lazy var deleteItemButtonSecond: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "deleteIcon"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 23).isActive = true
        button.widthAnchor.constraint(equalToConstant: 23).isActive = true
        return button
    }()
    private let firstLineView: UIView =  {
        let view = UIView()
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 3).isActive = true
        view.alpha = 0.25
        return view
    }()
    private let secondLineView: UIView =  {
        let view = UIView()
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.alpha = 0.25
        return view
    }()
    private let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Total"
        label.textColor = .white
        label.font = Fonts.Mark15
        return label
    }()
    private let deliveryLabel: UILabel = {
        let label = UILabel()
        label.text = "Delivery"
        label.textColor = .white
        label.font = Fonts.Mark15
        return label
    }()
    private let totalCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = Fonts.MarkBold15
        return label
    }()
    
    private let deliveryCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = Fonts.MarkBold15
        return label
    }()
    private var checkoutButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = Fonts.MarkBold20
        button.setTitle("Checkout", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.orange, for: .highlighted)
        button.layer.cornerRadius = 12
        button.backgroundColor = Colors.myOrange
        return button
    }()
    var countPhone1: Int = 1 {
        didSet {
            amountLabelOfFirstPhone.text = String(countPhone1)
        }
    }
    var countPhone2: Int = 1 {
        didSet {
            amountLabelOfSecondPhone.text = String(countPhone2)
        }
    }
    
    @objc func decreaseItemsInCartByOne() {
        if countPhone1 > 0 {
            countPhone1 -= 1
        }
        
    }
    
    @objc func increaseItemsInCartByOne() {
        countPhone1 += 1
    }
    
    @objc func decreaseItemsInCartBySecond() {
        if countPhone2 > 0 {
            countPhone2 -= 1
        }
        
    }
    @objc func increaseItemsInCartBySecond() {
        countPhone2 += 1
    }
    
    @objc func tapBackButton () {
        dismiss(animated: true)
    }
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setSubview()
        setConstraints()
        request()
    }
  
    // MARK: - setSubview
    private func setSubview() {
        view.addSubview(backButton)
        view.addSubview(addressLabel)
        view.addSubview(addressButton)
        view.addSubview(myCartLabel)
        view.addSubview(bottomView)
        bottomView.addSubview(imageView1)
        bottomView.addSubview(imageTitleLabel1)
        bottomView.addSubview(priceLabel1)
        bottomView.addSubview(imageView2)
        bottomView.addSubview(imageTitleLabel2)
        bottomView.addSubview(priceLabel2)
        bottomView.addSubview(firstLineView)
        bottomView.addSubview(totalLabel)
        bottomView.addSubview(deliveryLabel)
        bottomView.addSubview(deliveryCountLabel)
        bottomView.addSubview(totalCountLabel)
        bottomView.addSubview(secondLineView)
        bottomView.addSubview(checkoutButton)
        view.addSubview(changeAmountView)
        view.addSubview(changeAmountViewSecond)
        changeAmountView.addSubview(decreaseAmountButtonOne)
        changeAmountView.addSubview(increaseAmountButtonOne)
        changeAmountView.addSubview(amountLabelOfFirstPhone)
        changeAmountView.addSubview(deleteItemButton)
        changeAmountViewSecond.addSubview(decreaseAmountButtonTwo)
        changeAmountViewSecond.addSubview(increaseAmountButtonTwo)
        changeAmountViewSecond.addSubview(amountLabelOfSecondPhone)
        changeAmountViewSecond.addSubview(deleteItemButtonSecond)
    }
    // MARK: - request
    private func request() {
        ApiCaller.shared.makeAPIRequest(with: "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149", CartModel.self) { result in
            switch result {
            case .success(let data) :
                DispatchQueue.main.async {
                    arrayCart = [data]
                    self.imageView1.kf.setImage(with: URL(string: arrayCart[0].basket[0].images))
                    self.imageView1.isHidden = false
                    self.imageTitleLabel1.text = arrayCart[0].basket[0].title
                    self.priceLabel1.text = "$" + String(arrayCart[0].basket[0].price)
                    self.imageView2.kf.setImage(with: URL(string: arrayCart[0].basket[1].images))
                    self.imageView2.isHidden = false
                    self.imageTitleLabel2.text = arrayCart[0].basket[1].title
                    self.priceLabel2.text = "$" + String(arrayCart[0].basket[1].price)
                    self.totalCountLabel.text = "$" + String(arrayCart[0].total) + " us"
                    self.deliveryCountLabel.text = String(arrayCart[0].delivery)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    // MARK: - setConstraints
    private func setConstraints() {
        backButton.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(40)
            make.top.equalTo(view.snp.top).offset(80)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        addressLabel.snp.makeConstraints { make in
            make.centerY.equalTo(backButton.snp.centerY)
            make.top.equalTo(view.snp.top)
            make.rightMargin.equalTo(addressButton.snp_leftMargin).offset(-10)
        }
        addressButton.snp.makeConstraints { make in
            make.width.equalTo(40)
            make.height.equalTo(40)
            make.right.equalTo(view.snp.right).offset(-20)
            make.centerY.equalTo(addressLabel.snp.centerY)
        }
        
        myCartLabel.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(200)
            make.left.equalTo(view.snp.left).offset(40)
            make.top.equalTo(backButton.snp.bottom).offset(30)
        }
        
        bottomView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(view.snp.bottom)
            make.top.equalTo(myCartLabel.snp.bottom).offset(20)
        }
        imageView1.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.leftMargin.equalTo(bottomView.snp_leftMargin).offset(40)
            make.topMargin.equalTo(bottomView.snp_topMargin).offset(80)
        }
        imageTitleLabel1.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(205)
            make.leftMargin.equalTo(imageView1.snp_rightMargin).offset(30)
            make.topMargin.equalTo(bottomView.snp_topMargin).offset(55)
        }
        priceLabel1.snp.makeConstraints { make in
            make.leftMargin.equalTo(imageView1.snp_rightMargin).offset(30)
            make.topMargin.equalTo(imageTitleLabel1.snp_bottomMargin).offset(5)
            make.width.equalTo(100)
        }
        imageView2.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.leftMargin.equalTo(bottomView.snp_leftMargin).offset(40)
            make.topMargin.equalTo(imageView1.snp_bottomMargin).offset(60)
        }
        imageTitleLabel2.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(205)
            make.leftMargin.equalTo(imageView2.snp_rightMargin).offset(30)
            make.topMargin.equalTo(priceLabel1.snp_topMargin).offset(45)
        }
        priceLabel2.snp.makeConstraints { make in
            make.leftMargin.equalTo(imageView2.snp_rightMargin).offset(30)
            make.topMargin.equalTo(imageTitleLabel2.snp_bottomMargin).offset(5)
            make.width.equalTo(100)
        }
        // changeAmountView1
        changeAmountView.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.width.equalTo(28)
            make.centerY.equalTo(imageView1.snp.centerY)
            make.trailingMargin.equalTo(bottomView.snp.trailingMargin).offset(-50)
        }
        decreaseAmountButtonOne.snp.makeConstraints { make in
            make.topMargin.equalTo(changeAmountView.snp_topMargin).offset(5)
            make.centerX.equalTo(changeAmountView.snp.centerX)
        }
        increaseAmountButtonOne.snp.makeConstraints { make in
            make.bottomMargin.equalTo(changeAmountView.snp_bottomMargin).offset(-5)
            make.centerX.equalTo(changeAmountView.snp.centerX)
        }
        amountLabelOfFirstPhone.snp.makeConstraints { make in
            make.centerX.equalTo(changeAmountView.snp.centerX)
            make.centerY.equalTo(changeAmountView.snp.centerY)
        }
        deleteItemButton.snp.makeConstraints { make in
            make.centerY.equalTo(changeAmountView.snp.centerY)
            make.rightMargin.equalTo(bottomView.snp_rightMargin).offset(-20)
        }
        // changeAmountView2
        changeAmountViewSecond.snp.makeConstraints { make in
            make.height.equalTo(70)
            make.width.equalTo(28)
            make.centerY.equalTo(imageView2.snp.centerY)
            make.trailingMargin.equalTo(bottomView.snp.trailingMargin).offset(-50)
        }
        decreaseAmountButtonTwo.snp.makeConstraints { make in
            make.topMargin.equalTo(changeAmountViewSecond.snp_topMargin).offset(5)
            make.centerX.equalTo(changeAmountViewSecond.snp.centerX)
        }
        
        increaseAmountButtonTwo.snp.makeConstraints { make in
            make.bottomMargin.equalTo(changeAmountViewSecond.snp_bottomMargin).offset(-5)
            make.centerX.equalTo(changeAmountViewSecond.snp.centerX)
        }
        
        amountLabelOfSecondPhone.snp.makeConstraints { make in
            make.centerX.equalTo(changeAmountViewSecond.snp.centerX)
            make.centerY.equalTo(changeAmountViewSecond.snp.centerY)
        }
        
        deleteItemButtonSecond.snp.makeConstraints { make in
            make.centerY.equalTo(changeAmountViewSecond.snp.centerY)
            make.rightMargin.equalTo(bottomView.snp_rightMargin).offset(-20)
        }
        
        firstLineView.snp.makeConstraints { make in
            make.left.equalTo(bottomView.snp.left)
            make.right.equalTo(bottomView.snp.right)
            make.centerY.equalTo(bottomView.snp.centerY).offset(100)
        }
        
        totalLabel.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.topMargin.equalTo(firstLineView.snp_bottomMargin).offset(30)
            make.leftMargin.equalTo(bottomView.snp_leftMargin).offset(50)
            
        }
        deliveryLabel.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.topMargin.equalTo(totalLabel.snp_bottomMargin).offset(30)
            make.leftMargin.equalTo(bottomView.snp_leftMargin).offset(50)
            
        }
        totalCountLabel.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.topMargin.equalTo(firstLineView.snp_bottomMargin).offset(30)
            make.rightMargin.equalTo(bottomView.snp_rightMargin)
            
        }
        deliveryCountLabel.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.topMargin.equalTo(totalCountLabel.snp_bottomMargin).offset(30)
            make.rightMargin.equalTo(bottomView.snp_rightMargin)
            
        }
        secondLineView.snp.makeConstraints { make in
            make.left.equalTo(bottomView.snp.left)
            make.right.equalTo(bottomView.snp.right)
            make.top.equalTo(deliveryCountLabel.snp.bottom).offset(30)
        }
        checkoutButton.snp.makeConstraints { make in
            make.left.equalTo(bottomView.snp.left).offset(40)
            make.height.equalTo(50)
            make.right.equalTo(bottomView.snp.right).offset(-40)
            make.top.equalTo(secondLineView.snp.bottom).offset(20)
        }
    }
}

