//
//  ProductDetailsViewController.swift
//  TestEcommerceConcept
//
//  Created by Линар Нигматзянов on 23/09/2022.
//

import UIKit
import SnapKit
import Kingfisher
final class ProductDetailsViewController: UIViewController {
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "backButton")
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var basketButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "basket")
        button.setImage(image, for: .normal)
        button.backgroundColor = Colors.myOrange
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(tapBasketButton), for: .touchUpInside)
        return button
    }()
    
    private let productDetailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Product Details"
        label.textColor = Colors.myBlue
        label.font = Fonts.Mark15?.withSize(20)
        return label
    }()
    
    private let cpuLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .lightGray
        label.font = Fonts.Mark15
        return label
    }()
    
    private let cameraLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .lightGray
        label.font = Fonts.Mark15
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let ramLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .lightGray
        label.font = Fonts.Mark15
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let ssdLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .lightGray
        label.font = Fonts.Mark15
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let imageView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .white
        image.layer.cornerRadius = 15
        image.layer.cornerRadius = 10
        image.layer.shadowRadius = 8
        image.layer.shadowOpacity = 0.1
        image.layer.shadowOffset = CGSize(width: 4, height: 7)
        return image
    }()
    private let cpuImageView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "cpu")
        return image
    }()
    
    private let cameraImageView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "camera")
        return image
    }()
    
    private let ramImageView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "ram")
        return image
    }()
    private let ssdImageView : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "ssd")
        return image
    }()
    
    private let bottomView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 50
        view.backgroundColor = .white
        return view
    }()
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.background
        request()
        setSubview()
        setConstraints()
        
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = Colors.myBlue
        label.font = Fonts.Mark15?.withSize(25)
        return label
    }()
    
    private let numberBasketLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .red
        label.textColor = .white
        label.isHidden = true
        label.layer.cornerRadius = 7.5
        label.clipsToBounds = true
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let selectColorCapacityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = Colors.myBlue
        label.text = "Select color and capacity"
        label.font = Fonts.MarkBold20
        return label
    }()
    
    private let favoriteView : UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.shadowRadius = 5
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 4, height: 7)
        view.clipsToBounds = false
        view.backgroundColor = Colors.myBlue
        return view
    }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "heart")?.withRenderingMode(.alwaysTemplate)
        button.tintColor = .white
        button.setImage(image, for: .normal)
        button.setImage(UIImage(named: "heart2"), for: .selected)
        button.addTarget(self, action: #selector(tapFavoriteButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var brownColor: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "selectColor")
        button.tag = 1
        button.backgroundColor = #colorLiteral(red: 0.545763433, green: 0.2393354475, blue: 0.002939352533, alpha: 1)
        button.layer.cornerRadius = 17.5
        button.setImage(image, for: .selected)
        button.addTarget(self, action: #selector(tapColorButtons), for: .touchUpInside)
        return button
    }()
    
    private lazy var deepBlueColor: UIButton = {
        let button = UIButton(type: .custom)
        button.tag = 2
        let image = UIImage(named: "selectColor")
        button.backgroundColor = Colors.myBlue
        button.layer.cornerRadius = 17.5
        button.setImage(image, for: .selected)
        button.addTarget(self, action: #selector(tapColorButtons), for: .touchUpInside)
        return button
    }()
    private lazy var shopButton: UIButton = {
        let button = UIButton()
        let senderNumber = 1
        button.titleLabel?.textAlignment = .center
        button.setTitle("Shop", for: .normal)
        button.titleLabel?.font = Fonts.MarkBold20
        button.setTitleColor(Colors.myBlue, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.addTarget(self, action: #selector(descriptionCategoryButtonPressed(_ :)), for: .touchUpInside)
        return button
    }()
    
    private lazy var capacityButton1: UIButton = {
        let button = UIButton()
        button.tag = 1
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = Fonts.MarkBold15
        button.setTitleColor(Colors.myGray, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = Colors.myOrange
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(capacityTapButtons), for: .touchUpInside)
        return button
    }()
    
    private lazy var capacityButton2: UIButton = {
        let button = UIButton()
        button.tag = 2
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = Fonts.MarkBold15
        button.setTitleColor(Colors.myGray, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(capacityTapButtons), for: .touchUpInside)
        return button
    }()
    
    private lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = Fonts.MarkBold25
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.orange, for: .highlighted)
        button.layer.cornerRadius = 10
        button.backgroundColor = Colors.myOrange
        button.addTarget(self, action: #selector(addToCartButtonTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var detailsButton: UIButton = {
        let button = UIButton()
        let senderNumber = 2
        button.titleLabel?.textAlignment = .center
        button.setTitle("Details", for: .normal)
        button.titleLabel?.font = Fonts.MarkBold20
        button.setTitleColor(UIColor.systemGray, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.addTarget(self, action: #selector(descriptionCategoryButtonPressed(_ :)), for: .touchUpInside)
        return button
    }()
    
    private lazy var featuresButton: UIButton = {
        let button = UIButton()
        let senderNumber = 3
        button.titleLabel?.textAlignment = .center
        button.setTitle("Features", for: .normal)
        button.titleLabel?.font = Fonts.MarkBold20
        button.addTarget(self, action: #selector(descriptionCategoryButtonPressed(_ :)), for: .touchUpInside)
        button.setTitleColor(UIColor.systemGray, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        return button
    }()
    
    private let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor  = Colors.myOrange
        view.layer.cornerRadius = 1
        return view
    }()
    
    private var countBasket = 0
    
    @objc func addToCartButtonTap() {
        countBasket += 1
        if countBasket > 0 {
            numberBasketLabel.isHidden = false
            numberBasketLabel.text = String(countBasket)
        }
    }
    @objc func capacityTapButtons(sender: UIButton) {
        if sender.tag == 2 {
            capacityButton2.backgroundColor = Colors.myOrange
            capacityButton2.setTitleColor(.white, for: .normal)
            capacityButton1.backgroundColor = .white
            capacityButton1.setTitleColor(Colors.myGray, for: .normal)
        } else {
            capacityButton1.backgroundColor = Colors.myOrange
            capacityButton1.setTitleColor(.white, for: .normal)
            capacityButton2.setTitleColor(Colors.myGray, for: .normal)
            capacityButton2.backgroundColor = .white
        }
    }
    
    
    @objc func descriptionCategoryButtonPressed(_ sender: Any) {
        guard let sender = sender as? UIButton else { fatalError() }
        guard let title = sender.titleLabel else { fatalError() }
        switch title.text {
        case "Shop":
            shopButton.setTitleColor(Colors.myBlue, for: .normal)
            shopButton.titleLabel?.font = Fonts.MarkBold20
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
                
                self.underlineView.transform = CGAffineTransform(translationX: self.shopButton.frame.minX - self.underlineView.frame.width / 2 + 20, y: 0)
                //self.underlineView.bounds = CGRect(x: 0, y: 0, width: self.shopButton.bounds.width, height: 3)
                self.underlineView.bounds = CGRect(x: 0, y: 0, width: (self.shopButton.titleLabel?.intrinsicContentSize.width)!, height: 3)
            }
            
            detailsButton.setTitleColor(UIColor.systemGray, for: .normal)
            detailsButton.titleLabel?.font = Fonts.MarkBold20
            featuresButton.setTitleColor(UIColor.systemGray, for: .normal)
            featuresButton.titleLabel?.font = Fonts.MarkBold20
            
        case "Details":
            detailsButton.setTitleColor(Colors.myBlue, for: .normal)
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
                
                self.underlineView.transform = CGAffineTransform(translationX: self.detailsButton.frame.minX - self.underlineView.frame.width / 2 + 15, y: 0)
                self.underlineView.bounds = CGRect(x: 0, y: 0, width: (self.detailsButton.titleLabel?.intrinsicContentSize.width)!, height: 3)
            }
            
            detailsButton.titleLabel?.font = Fonts.MarkBold20
            shopButton.setTitleColor(UIColor.systemGray, for: .normal)
            shopButton.titleLabel?.font = Fonts.MarkBold20
            featuresButton.setTitleColor(UIColor.systemGray, for: .normal)
            featuresButton.titleLabel?.font = Fonts.MarkBold20
            
        case "Features":
            featuresButton.setTitleColor(Colors.myBlue, for: .normal)
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
                self.underlineView.transform = CGAffineTransform(translationX: self.featuresButton.frame.minX - self.underlineView.frame.width / 2 + 35, y: 0)
                //self.underlineView.bounds = CGRect(x: 0, y: 0, width: self.featuresButton.bounds.width, height: 3)
                self.underlineView.bounds = CGRect(x: 0, y: 0, width: (self.featuresButton.titleLabel?.intrinsicContentSize.width)!, height: 3)
            }
            featuresButton.titleLabel?.font = Fonts.MarkBold20
            shopButton.setTitleColor(UIColor.systemGray, for: .normal)
            shopButton.titleLabel?.font = Fonts.MarkBold20
            detailsButton.setTitleColor(UIColor.systemGray, for: .normal)
            detailsButton.titleLabel?.font = Fonts.MarkBold20
            
        default: print("default")
        }
    }
    
    @objc func tapBackButton () {
        dismiss(animated: true)
    }
    
    @objc func tapBasketButton () {
        let cartVC = CartViewController()
        cartVC.modalPresentationStyle = .fullScreen
        if let presentationController = cartVC.presentationController as? UISheetPresentationController {
            presentationController.detents = [.large()] /// change to [.medium(), .large()] for a half *and* full screen sheet
        }
        
        self.present(cartVC, animated: true)
    }
    
    @objc func tapFavoriteButton() {
        favoriteButton.isSelected.toggle()
        
    }
    // MARK: - setSubview
    private func setSubview() {
        view.addSubview(backButton)
        view.addSubview(productDetailLabel)
        view.addSubview(backButton)
        view.addSubview(basketButton)
        view.addSubview(imageView)
        view.addSubview(bottomView)
        bottomView.addSubview(titleLabel)
        bottomView.addSubview(favoriteView)
        bottomView.addSubview(shopButton)
        bottomView.addSubview(detailsButton)
        bottomView.addSubview(featuresButton)
        bottomView.addSubview(underlineView)
        bottomView.addSubview(cpuImageView)
        bottomView.addSubview(ramImageView)
        bottomView.addSubview(ssdImageView)
        bottomView.addSubview(cameraImageView)
        bottomView.addSubview(cpuLabel)
        bottomView.addSubview(ramLabel)
        bottomView.addSubview(ssdLabel)
        bottomView.addSubview(cameraLabel)
        bottomView.addSubview(selectColorCapacityLabel)
        bottomView.addSubview(brownColor)
        bottomView.addSubview(deepBlueColor)
        bottomView.addSubview(capacityButton1)
        bottomView.addSubview(capacityButton2)
        bottomView.addSubview(addToCartButton)
        bottomView.addSubview(numberBasketLabel)
        favoriteView.addSubview(favoriteButton)
        
    }
    // MARK: - request
    private func request() {
        ApiCaller.shared.makeAPIRequest(with: "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5", DetailsVC.self) { result in
            switch result {
            case .success(let data) :
                DispatchQueue.main.async {
                    arrayDetails = [data]
                    let urlImage = arrayDetails.first?.images.first
                    self.imageView.kf.setImage(with: URL(string: urlImage ?? ""))
                    self.titleLabel.text = arrayDetails.first?.title
                    self.favoriteButton.isSelected = arrayDetails[0].isFavorites
                    self.cpuLabel.text = arrayDetails[0].cpu
                    self.cameraLabel.text = arrayDetails[0].camera
                    self.ramLabel.text = arrayDetails[0].ssd
                    self.ssdLabel.text = arrayDetails[0].sd
                    self.capacityButton1.setTitle(arrayDetails[0].capacity.first! + " GB", for: .normal)
                    self.capacityButton2.setTitle(arrayDetails[0].capacity.last! + " GB", for: .normal)
                    self.addToCartButton.setTitle("Add to Cart        " + "$" + String(arrayDetails[0].price), for: .normal)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc func tapColorButtons(sender: UIButton) {
        if sender.tag == 1 {
            brownColor.isSelected = true
            deepBlueColor.isSelected = false
        } else {
            deepBlueColor.isSelected = true
            brownColor.isSelected = false
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
        productDetailLabel.snp.makeConstraints { make in
            make.left.equalTo(backButton.snp.right)
            make.height.equalTo(50)
            make.right.equalTo(basketButton.snp.left).offset(20)
            make.centerY.equalTo(backButton.snp.centerY)
        }
        basketButton.snp.makeConstraints { make in
            make.width.equalTo(40)
            make.height.equalTo(40)
            make.left.equalTo(productDetailLabel.snp.right).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.centerY.equalTo(backButton.snp.centerY)
        }
        
        let deviceType = UIDevice.current.modelName
        switch deviceType {
        case "iPhone10,4", "iPhone10,5":
            imageView.snp.makeConstraints { make in
                make.left.equalTo(view.snp.left).offset(50)
                make.right.equalTo(view.snp.right).offset(-50)
                make.top.equalTo(productDetailLabel.snp.bottom).offset(20)
                make.height.equalTo(200)
                //make.bottom.equalTo(bottomView.snp.top).offset(-30)
            }
            
            bottomView.snp.makeConstraints { make in
                make.left.equalToSuperview()
                make.right.equalToSuperview()
                make.bottom.equalTo(view.snp.bottom)
                make.height.equalTo(350)
                
            }
        default:
            imageView.snp.makeConstraints { make in
                make.left.equalTo(view.snp.left).offset(50)
                make.right.equalTo(view.snp.right).offset(-50)
                make.top.equalTo(productDetailLabel.snp.bottom).offset(20)
                make.height.equalTo(300)
                make.bottom.equalTo(bottomView.snp.top).offset(-20)
            }
            
            bottomView.snp.makeConstraints { make in
                make.left.equalToSuperview()
                make.right.equalToSuperview()
                make.bottom.equalTo(view.snp.bottom)
                make.height.equalTo(400)
                
            }
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(bottomView.snp.left).offset(30)
            make.top.equalTo(bottomView.snp.top).offset(20)
            make.right.equalTo(favoriteView.snp.right).offset(50)
        }
        
        favoriteView.snp.makeConstraints { make in
            make.right.equalTo(bottomView.snp.right).offset(-35)
            make.top.equalTo(bottomView.snp.top).offset(15)
            make.width.equalTo(35)
            make.height.equalTo(35)
        }
        
        favoriteButton.snp.makeConstraints { make in
            make.width.equalTo(20)
            make.height.equalTo(20)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        shopButton.snp.makeConstraints { make in
            make.left.equalTo(bottomView.snp.left).offset(20)
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.top.equalTo(titleLabel.snp.bottom)
            
        }
        
        detailsButton.snp.makeConstraints { make in
            make.left.equalTo(shopButton.snp.right).offset(30)
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.top.equalTo(titleLabel.snp.bottom)
            
        }
        
        featuresButton.snp.makeConstraints { make in
            make.left.equalTo(detailsButton.snp.right).offset(30)
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.top.equalTo(titleLabel.snp.bottom)
            make.right.equalTo(bottomView.snp.right).offset(-20)
            
        }
        underlineView.snp.makeConstraints { make in
            make.width.equalTo(50)
            make.height.equalTo(3)
            make.leading.equalTo(bottomView.snp.leading).offset(40)
            make.top.equalTo(shopButton.snp.bottom).offset(-5)
            
        }
        
        cpuImageView.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.left.equalTo(bottomView.snp.left).offset(50)
            make.top.equalTo(shopButton.snp.bottom).offset(20)
        }
        
        cameraImageView.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.left.equalTo(cpuImageView.snp.right).offset(65)
            make.top.equalTo(shopButton.snp.bottom).offset(20)
        }
        
        ramImageView.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.left.equalTo(cameraImageView.snp.right).offset(60)
            make.top.equalTo(shopButton.snp.bottom).offset(20)
        }
        
        ssdImageView.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.left.equalTo(ramImageView.snp.right).offset(60)
            make.top.equalTo(shopButton.snp.bottom).offset(20)
            make.right.equalTo(bottomView.snp.right).offset(-20)
        }
        
        cpuLabel.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(20)
            make.top.equalTo(cpuImageView.snp.bottom).offset(5)
            make.centerX.equalTo(cpuImageView.snp.centerX)
        }
        
        cameraLabel.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(20)
            make.top.equalTo(cameraImageView.snp.bottom).offset(5)
            make.centerX.equalTo(cameraImageView.snp.centerX)
        }
        ramLabel.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(20)
            make.top.equalTo(ramImageView.snp.bottom).offset(5)
            make.centerX.equalTo(ramImageView.snp.centerX)
        }
        ssdLabel.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(20)
            make.top.equalTo(ssdImageView.snp.bottom).offset(5)
            make.centerX.equalTo(ssdImageView.snp.centerX)
        }
        
        selectColorCapacityLabel.snp.makeConstraints { make in
            make.left.equalTo(bottomView.snp.left).offset(30)
            make.top.equalTo(cpuLabel.snp.bottom).offset(10)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        brownColor.snp.makeConstraints { make in
            make.top.equalTo(selectColorCapacityLabel.snp.bottom).offset(5)
            make.left.equalTo(bottomView.snp.left).offset(30)
            make.width.equalTo(35)
            make.height.equalTo(35)
        }
        deepBlueColor.snp.makeConstraints { make in
            make.top.equalTo(selectColorCapacityLabel.snp.bottom).offset(5)
            make.left.equalTo(brownColor.snp.right).offset(15)
            make.width.equalTo(35)
            make.height.equalTo(35)
        }
        
        capacityButton1.snp.makeConstraints { make in
            make.left.equalTo(deepBlueColor.snp.right).offset(50)
            make.centerY.equalTo(deepBlueColor.snp.centerY)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        capacityButton2.snp.makeConstraints { make in
            make.left.equalTo(capacityButton1.snp.right).offset(10)
            make.centerY.equalTo(capacityButton1.snp.centerY)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
        
        addToCartButton.snp.makeConstraints { make in
            make.left.equalTo(bottomView.snp.left).offset(30)
            make.height.equalTo(50)
            make.right.equalTo(bottomView.snp.right).offset(-30)
            make.top.equalTo(brownColor.snp.bottom).offset(10)
        }
        
        numberBasketLabel.snp.makeConstraints { make in
            make.width.equalTo(15)
            make.height.equalTo(15)
            make.right.equalTo(basketButton.snp.right).offset(5)
            make.bottom.equalTo(basketButton.snp.top).offset(7)
        }
        
    }
    
}
