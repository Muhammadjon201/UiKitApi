//
//  HomeViewController.swift
//  UiKitApi
//
//  Created by Muhammadjon Mamarasulov on 1/20/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var FollowersLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPostData()
    }
    
    func fetchPostData() {
        let url = URL(string: "https://api.github.com/users/Muhammadjon201")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else { return }
            
            do {
                
                let postsData = try JSONDecoder().decode(Info.self, from: data)
                
                DispatchQueue.main.async {
                    self.NameLabel.text = postsData.bio
                }
            }
            
            catch{
                let error = error
                print(error.localizedDescription)
            }
        }.resume()
    }
 
}
