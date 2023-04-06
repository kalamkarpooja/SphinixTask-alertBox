//
//  ProductViewController.swift
//  SphinixSolutionTask1
//
//  Created by Mac on 06/04/17.
//

import UIKit

class ProductViewController: UIViewController {

    var products = [Product]()
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet weak var productCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
           jsonParser()
           registerCell()
    }
    func registerCell(){
        let uinib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
        self.productCollectionView.register(uinib, forCellWithReuseIdentifier: "ProductCollectionViewCell")
    }
    func jsonParser(){
        let urlString = "https://dummyjson.com/products"
        let url = URL(string: urlString)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        URLSession.shared.dataTask(with: urlRequest){data ,response,error in
            print(String(data: data!, encoding: .utf8)!)
            print(response)
            let jsonDecoder = JSONDecoder()
            let welcome : WelCome = try! jsonDecoder.decode(WelCome.self, from: data!)
            self.products = welcome.products
            DispatchQueue.main.async {
                self.productCollectionView.reloadData()
            }
        }.resume()
    }
}
extension ProductViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.productCollectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        cell.title.text = products[indexPath.row].title
        cell.price.text = "₹ \(products[indexPath.row].price)"
        cell.rating.text = "* \(products[indexPath.row].rating)"
        let urlstring = products[indexPath.row].thumbnail
        let url = URL(string: urlstring)
        cell.img.sd_setImage(with: url)
        cell.layer.borderWidth = 6
        cell.layer.borderColor = .init(genericCMYKCyan: 2, magenta: 2, yellow: 2, black: 3, alpha: 3)
        cell.layer.cornerRadius = 18
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.size.width / 2 - 2 , height: collectionView.frame.size.height / 2 - 2)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        3
    }
    func collectionView(_collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,minimumInteritemSpacingForSectionAt section : Int) -> CGFloat{
        3
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "ProductDetailViewController") as! ProductDetailViewController
          detailVC.product = products[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

