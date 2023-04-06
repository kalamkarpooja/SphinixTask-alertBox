//
//  UserDetailViewController.swift
//  SphinixSolutionTask1
//
//  Created by Mac on 06/04/23.
//

import UIKit

class UserDetailViewController: UIViewController {

    @IBOutlet weak var birthDate: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var img: UIImageView!
    var user : User?
    override func viewDidLoad() {
        super.viewDidLoad()
        birthDate.text = user!.birthDate
        phone.text = user!.phone
        name.text = user!.firstName + " " + user!.maidenName + " " + user!.lastName
        email.text = user!.email
        let urlString = (user!.image)
        let url = URL(string: urlString)
        img.sd_setImage(with: url)

}
       @IBAction func add(_ sender: UIButton) {
        let alert = UIAlertController(title: "Add User", message: "Are you sure you want to add User?", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
              let successAlertController = UIAlertController(title: "", message: "Addedd Successfully", preferredStyle: .alert)
              let dismissAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
              successAlertController.addAction(dismissAction)
              self.present(successAlertController, animated: true, completion: nil)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
    }
}
    
