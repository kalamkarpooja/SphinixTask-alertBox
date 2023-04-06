//
//  ProductDetailViewController.swift
//  SphinixSolutionTask1
//
//  Created by Mac on 06/04/23.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var img: UIImageView!
    var product : Product?
    override func viewDidLoad() {
        super.viewDidLoad()
        ratingLabel.text = "\(product!.rating)"
        priceLabel.text = "₹ \(product!.price)"
        brandLabel.text = product!.brand
        categoryLabel.text = product!.category
        descLabel.text = product!.description
        titleLabel.text = product!.title
        let urlstring = product!.thumbnail
        let url = URL(string: urlstring)
        img.sd_setImage(with: url)
        img.layer.cornerRadius = 18
    }
    @IBAction func addBtn(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Add to Cart", message: "Are you sure you want to add Cart?", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
              let successAlertController = UIAlertController(title: "", message: "Addedd Successfully", preferredStyle: .alert)
              let dismissAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
              successAlertController.addAction(dismissAction)
              self.present(successAlertController, animated: true, completion: nil)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)

          }
    }
    
