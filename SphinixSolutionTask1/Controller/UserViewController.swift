//
//  UserViewController.swift
//  SphinixSolutionTask1
//
//  Created by Mac on 06/04/17.
//

import UIKit
import SDWebImage
class UserViewController: UIViewController {
    
    @IBOutlet weak var userTableView: UITableView!
    var users = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        userTableView.delegate = self
        userTableView.dataSource = self
        jsonParser()
        registerCells()
    }
    func registerCells(){
        let uinib = UINib(nibName: "UserTableViewCell", bundle: nil)
        self.userTableView.register(uinib, forCellReuseIdentifier: "UserTableViewCell")
    }
    func jsonParser(){
        let urlstring = "https://dummyjson.com/users"
        let url = URL(string: urlstring)
        var urlrequest = URLRequest(url: url!)
        urlrequest.httpMethod = "GET"
        URLSession.shared.dataTask(with: urlrequest){data,response,error in
            print(String(data: data!, encoding: .utf8)!)
            print(response)
            let jsonDecoder = JSONDecoder()
            let root : Root = try! jsonDecoder.decode(Root.self, from: data!)
            self.users = root.users
            DispatchQueue.main.async {
                self.userTableView.reloadData()
            }
        }.resume()
        
    }


}
extension UserViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.userTableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        cell.name.text = users[indexPath.row].firstName + " " + users[indexPath.row].lastName
        cell.name.textColor = UIColor.purple
        cell.age.text = "Age : \(users[indexPath.row].age)"
        cell.layer.borderWidth = 3
        cell.layer.cornerRadius = 8
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailViewController") as! UserDetailViewController
        userDetailVC.user = users[indexPath.row]
        navigationController?.pushViewController(userDetailVC, animated: true)
    }
}
