//
//  ExplorerViewController.swift
//  TestEcommerceConcept
//
//  Created by Линар Нигматзянов on 24/08/2022.
//

import UIKit
import SnapKit
import Kingfisher

final class ExplorerViewController: UIViewController {
    
    private let selectCategoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Select Category"
        label.font = Fonts.MarkBold25
        label.textColor = Colors.myBlue
        return label
    }()
    private let viewAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("view all", for: .normal)
        button.titleLabel?.font = Fonts.Mark15
        button.setTitleColor(Colors.myOrange, for: .normal)
        button.setTitleColor(Colors.myBlue, for: .highlighted)
        return button
    }()
    private let hotSalesLabel: UILabel = {
        let label = UILabel()
        label.text = "Hot sales"
        label.font = Fonts.MarkBold25
        label.textColor = Colors.myBlue
        return label
    }()
    private let seeMoreHotSaleButton: UIButton = {
        let button = UIButton()
        button.setTitle("see more", for: .normal)
        button.titleLabel?.font = Fonts.Mark15
        button.setTitleColor(Colors.myOrange, for: .normal)
        button.setTitleColor(Colors.myBlue, for: .highlighted)
        return button
    }()
    private let qrCodeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "buttonSearch"), for: .normal)
        button.backgroundColor = Colors.myOrange
        button.layer.cornerRadius = 20
        return button
    }()
    private let bestSellerLabel: UILabel = {
        let label = UILabel()
        label.text = "Best Seller"
        label.font = Fonts.MarkBold25
        label.textColor = Colors.myBlue
        return label
    }()
    private let seeMoreBestSellersButton: UIButton = {
        let button = UIButton()
        button.setTitle("see more", for: .normal)
        button.titleLabel?.font = Fonts.Mark15
        button.setTitleColor(Colors.myOrange, for: .normal)
        button.setTitleColor(Colors.myBlue, for: .highlighted)
        return button
    }()
    lazy var filterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "filter"), for: .normal)
        button.setImage(UIImage(named: "filterTap"), for: .highlighted)
        button.addTarget(self, action: #selector(tapFilterButton), for: .touchUpInside)
        return button
    }()
    
    private var categoryCollectionView: UICollectionView!
    private var hotSalesCollectionView : UICollectionView!
    private var bestSellerCollectionView : UICollectionView!
    private let pageControl = UIPageControl()
    private let mainScrollView = UIScrollView()
    private let mainView = UIView()
    private let searchBar = UISearchBar()
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        request()
        requestBestSellers()
        createCategoryCollectionView()
        createHotSalesCollectionView()
        createbestSellerCollectionView()
        addSubview()
        createSearchBar()
        setupUI()
        setConstraints()
        configPageControl()
        configMainScrollView()
        
    }
    
    @objc func tapFilterButton() {
        let filterVC = FilterViewController()
        if let presentationController = filterVC.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium()] /// change to [.medium(), .large()] for a half *and* full screen sheet
        }
        self.present(filterVC, animated: true)
    }
    
    private func configMainScrollView () {
        let deviceType = UIDevice.current.modelName
        switch deviceType {
        case "iPhone10,4", "iPhone10,5":
            mainScrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height * 1.8)
        default:
            mainScrollView.contentSize = CGSizeMake(view.frame.size.width, view.frame.size.height + 350)
        }
        
        mainScrollView.showsVerticalScrollIndicator = false
        mainScrollView.delegate = self
        mainScrollView.keyboardDismissMode = .onDrag
        
    }
    private func configPageControl() {
        pageControl.hidesForSinglePage = true
        pageControl.isUserInteractionEnabled = false
        
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        if scrollView == mainScrollView {
            searchBar.endEditing(true)
        }
        
    }
    
    // MARK: - addSubview
    private func addSubview() {
        mainScrollView.addSubview(mainView)
        view.addSubview(mainScrollView)
        mainView.addSubview(categoryCollectionView)
        mainView.addSubview(hotSalesCollectionView)
        mainView.addSubview(bestSellerCollectionView)
        mainView.addSubview(viewAllButton)
        mainView.addSubview(selectCategoryLabel)
        mainView.addSubview(searchBar)
        mainView.addSubview(qrCodeButton)
        mainView.addSubview(hotSalesLabel)
        mainView.addSubview(seeMoreHotSaleButton)
        mainView.addSubview(pageControl)
        mainView.addSubview(seeMoreBestSellersButton)
        mainView.addSubview(bestSellerLabel)
        mainView.addSubview(filterButton)
    }
    // MARK: - request
    private func request() {
        ApiCaller.shared.makeAPIRequest(with: "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175", Ecommerce.self) { result in
            switch result {
            case .success(let data) :
                DispatchQueue.main.async {
                    arrayhome = data.homeStore
                    self.pageControl.numberOfPages = arrayhome.count
                    self.hotSalesCollectionView?.reloadData()
                    
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func requestBestSellers() {
        ApiCaller.shared.makeAPIRequest(with: "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175", Ecommerce.self) { result in
            switch result {
            case .success(let data) :
                
                DispatchQueue.main.async {
                    arrayBestSeller = data.bestSeller
                    self.bestSellerCollectionView?.reloadData()
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func setupUI() {
        view.backgroundColor = Colors.background
    }
    private func createSearchBar() {
        searchBar.placeholder = "Search"
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.leftView?.tintColor = Colors.myOrange
        searchBar.searchTextPositionAdjustment.horizontal = 40
        searchBar.searchTextField.borderStyle = .none
        searchBar.searchTextField.layer.cornerRadius = 15
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.textColor = .black
        searchBar.delegate = self
    }
    // create and config Category Collection View
    private func createCategoryCollectionView () {
        let layout = UICollectionViewFlowLayout()
        categoryCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0 , height: 0), collectionViewLayout: layout)
        categoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        categoryCollectionView.backgroundColor = Colors.background
        categoryCollectionView.showsHorizontalScrollIndicator = false
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 23
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    
    // create and config hotSales Collection View
    private func createHotSalesCollectionView () {
        let layoutHotCV = UICollectionViewFlowLayout()
        hotSalesCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0 , height: 0), collectionViewLayout: layoutHotCV)
        hotSalesCollectionView.register(HotSalesCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        hotSalesCollectionView.showsHorizontalScrollIndicator = false
        layoutHotCV.scrollDirection = .horizontal
        hotSalesCollectionView.backgroundColor = .clear
        hotSalesCollectionView.layer.cornerRadius = 15
        layoutHotCV.minimumLineSpacing = 0
        hotSalesCollectionView.clipsToBounds = true
        hotSalesCollectionView.isPagingEnabled = true
        hotSalesCollectionView.delegate = self
        hotSalesCollectionView.dataSource = self
        
        
    }
    // create and config hotSales Collection View
    private func createbestSellerCollectionView () {
        let layout = UICollectionViewFlowLayout()
        bestSellerCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0 , height: 0), collectionViewLayout: layout)
        bestSellerCollectionView.register(BestSellerCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        bestSellerCollectionView.showsHorizontalScrollIndicator = false
        layout.scrollDirection = .vertical
        bestSellerCollectionView.backgroundColor = Colors.background
        bestSellerCollectionView.layer.cornerRadius = 5
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.minimumLineSpacing = 15
        layout.minimumInteritemSpacing = 15
        bestSellerCollectionView.delegate = self
        bestSellerCollectionView.dataSource = self
        
    }
    // MARK: - setConstraints
    private func setConstraints() {
        //selectCategoryLabel setConstraints
        selectCategoryLabel.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(280)
            make.leftMargin.equalTo(mainView.snp_leftMargin).offset(20)
            make.topMargin.equalTo(mainScrollView.safeAreaLayoutGuide).offset(15)
        }
        //viewAllButton setConstraints
        viewAllButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(100)
            make.right.equalTo(mainView.snp_rightMargin)
            make.centerY.equalTo(selectCategoryLabel.snp.centerY)
            
        }
        //categoryCollectionView setConstraints
        categoryCollectionView.snp.makeConstraints { make in
            make.width.equalTo(mainScrollView.snp.width)
            make.height.equalTo(125)
            make.leftMargin.equalTo(mainView.snp_leftMargin).offset(10)
            make.top.equalTo(mainView.safeAreaLayoutGuide.snp.top).offset(75)
        }
        
        //searchBar setConstraints
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(categoryCollectionView.snp_bottomMargin).offset(35)
            make.leftMargin.equalTo(mainView.snp.left).offset(30)
            make.rightMargin.equalTo(qrCodeButton.snp_leftMargin).offset(-20)
        }
        //qrCodeButton setConstraints
        qrCodeButton.snp.makeConstraints { make in
            make.width.equalTo(40)
            make.height.equalTo(40)
            make.rightMargin.equalTo(mainView.snp_rightMargin).offset(-10)
            make.centerY.equalTo(searchBar.snp.centerY)
        }
        //hotSalesLabel setConstraints
        hotSalesLabel.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(200)
            make.leftMargin.equalTo(mainView.snp_leftMargin).offset(20)
            make.topMargin.equalTo(searchBar.snp_bottomMargin)
        }
        
        //seeMoreHotSaleButton setConstraints
        seeMoreHotSaleButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(100)
            make.right.equalTo(mainView.snp.right).offset(-10)
            make.centerY.equalTo(hotSalesLabel.snp.centerY)
        }
        
        //hotSalesCollectionView setConstraints
        hotSalesCollectionView.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.leftMargin.equalTo(mainView.snp_leftMargin).offset(10)
            make.rightMargin.equalTo(mainView.snp_rightMargin).offset(-10)
            make.top.equalTo(hotSalesLabel.snp.bottom)
        }
        //bestSellerCollectionView setConstraints
        bestSellerCollectionView.snp.makeConstraints { make in
            make.height.equalTo(550)
            make.leftMargin.equalTo(mainView.snp_leftMargin).offset(10)
            make.rightMargin.equalTo(mainView.snp_rightMargin).offset(-10)
            make.top.equalTo(bestSellerLabel.snp.bottom)
            make.bottom.equalTo(mainView.snp.bottom)
        }
        //pageControl setConstraints
        pageControl.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.height.equalTo(50)
            make.centerX.equalTo(hotSalesCollectionView.snp.centerX)
            make.top.equalTo(hotSalesCollectionView.snp_bottomMargin).offset(-30)
            
        }
        //mainScrollView setConstraints
        mainScrollView.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        //mainView setConstraints
        mainView.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width)
            make.top.equalTo(mainScrollView.snp.top)
            make.bottom.equalTo(mainView.snp.bottom)
            make.left.equalTo(mainScrollView.snp.left)
        }
        
        //bestSellerLabel setConstraints
        bestSellerLabel.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.width.equalTo(200)
            make.leftMargin.equalTo(mainView.snp_leftMargin).offset(20)
            make.topMargin.equalTo(hotSalesCollectionView.snp_bottomMargin)
        }
        
        //seeMoreBestSellersButton setConstraints
        seeMoreBestSellersButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(100)
            make.right.equalTo(mainView.snp.right).offset(-10)
            make.centerY.equalTo(bestSellerLabel.snp.centerY)
            
        }
        //filterButton setConstraints
        filterButton.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.width.equalTo(25)
            make.right.equalTo(mainView.snp_rightMargin).offset(-20)
            make.bottom.equalTo(viewAllButton.snp.top)
        }
        
    }
    
}
// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ExplorerViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case hotSalesCollectionView:
            return arrayhome.count
        case categoryCollectionView:
            return categoryArray.count
        case bestSellerCollectionView:
            return arrayBestSeller.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch  collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CategoryCollectionViewCell
            cell.labelCategory.text = categoryArray[indexPath.row].name
            let imageCell = categoryArray[indexPath.row].imageName
            cell.imageCell.image = UIImage(named: imageCell)?.withRenderingMode(.alwaysTemplate)
            return cell
        case hotSalesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! HotSalesCollectionViewCell
            let imageURL = arrayhome[indexPath.row].picture
            if let hiddenLabel = arrayhome[indexPath.row].isNew {
                cell.newLabel.isHidden = !hiddenLabel
            }
            
            cell.imageView.kf.indicatorType = .activity
            cell.imageView.kf.setImage(with: URL(string: imageURL))
            cell.nameLabel.text = arrayhome[indexPath.row].title
            cell.subtitleLabel.text = arrayhome[indexPath.row].subtitle
            cell.isBuyButton.isHidden = !arrayhome[indexPath.row].isBuy
            return cell
            
        case bestSellerCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! BestSellerCollectionViewCell
            let imageURL = arrayBestSeller[indexPath.row].picture
            cell.imageView.kf.indicatorType = .activity
            cell.imageView.kf.setImage(with: URL(string: imageURL))
            cell.priceLabel.text = "$" + String(arrayBestSeller[indexPath.row].priceWithoutDiscount)
            cell.priceWithDiscountLabel.text = "$" + String(arrayBestSeller[indexPath.row].discountPrice)
            cell.nameLabel.text = arrayBestSeller[indexPath.row].title
            cell.favoriteButton.isSelected = arrayBestSeller[indexPath.row].isFavorites
            return cell
            
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case categoryCollectionView:
            if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell {
                cell.show()
            }
            
        case bestSellerCollectionView:
            let detailsVC = ProductDetailsViewController()
            detailsVC.modalPresentationStyle = .fullScreen
            if let presentationController = detailsVC.presentationController as? UISheetPresentationController {
                presentationController.detents = [.large()] /// change to [.medium(), .large()] for a half *and* full screen sheet
            }
            
            self.present(detailsVC, animated: true)
        default:
            break
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCollectionViewCell {
            cell.hide()
        }
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension ExplorerViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case categoryCollectionView:
            return CGSize(width: 71, height: 71)
        case hotSalesCollectionView:
            return CGSize(width: hotSalesCollectionView.frame.width, height: hotSalesCollectionView.frame.height)
        case bestSellerCollectionView:
            return CGSize(width: mainView.bounds.width / 2 - 30, height: 250)
        default:
            return CGSize()
        }
        
    }
}

// MARK: - UISearchBarDelegate
extension ExplorerViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        
    }
}
// MARK: - extension scrollViewDidScroll
extension ExplorerViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == mainScrollView {
            if scrollView.contentOffset.x != 0 {
                scrollView.contentOffset.x = 0
            }
        }
        
    }
    
}

