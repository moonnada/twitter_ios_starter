//
//  HomeTableViewController.swift
//  Twitter
//
//  Created by Byung Moon Kim on 3/2/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
<<<<<<< HEAD

=======
    
>>>>>>> 7ef0714c605eb4877c131f241eac7683dca06c61
    
    var tweetArray = [NSDictionary]()
    var numberOfTweet: Int!
    
<<<<<<< HEAD
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTweet() //when i load the app display the tweet content
=======
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTweet() //when this app runs, load this function
        
>>>>>>> 7ef0714c605eb4877c131f241eac7683dca06c61
    }
    
    func loadTweet(){
        
        let myUrl = "https://api.twitter.com/1.1/statuses/home_timeline.json"
<<<<<<< HEAD
        let myParames = ["count": 10]
        
        TwitterAPICaller.client?.getDictionariesRequest(url: myUrl, parameters: myParames, success: { (tweets: [NSDictionary]) in
            
            
            self.tweetArray.removeAll()  //repopulate the list
            
            for tweet in tweets {
                self.tweetArray.append(tweet)
            }
            self.tableView.reloadData()
            
        }, failure: { (Error) in
            print("Could not retreive tweets!")
        })
    }
    
    
=======
        let myParams = ["count": 20]
        
        
        TwitterAPICaller.client?.getDictionariesRequest(url: myUrl, parameters: myParams, success: { (tweets: [NSDictionary]) in
            
            self.tweetArray.removeAll()
            for tweet in tweets {
                self.tweetArray.append(tweet)
            }
            
            
            self.tableView.reloadData()
            
        }, failure: { (Error) in
            print("could not retreive tweets!")
            print(Error.localizedDescription)
        })
        
        
    }
    
    
    
    
    
>>>>>>> 7ef0714c605eb4877c131f241eac7683dca06c61
    @IBAction func onLogout(_ sender: Any) {
        TwitterAPICaller.client?.logout()
        self.dismiss(animated: true, completion: nil)
        
        UserDefaults.standard.set(false, forKey: "userLoggedIn")  //After I click logout button, this app will not login automatically.
    }
    
<<<<<<< HEAD
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetCell
        
       // let user = tweetArray[indexPath.row]["user"] as! NSDictionary
        
        //cell.userNameLabel.text = user["name"] as? String
        cell.userNameLabel.text = "name"
        //cell.tweetContent.text = tweetArray[indexPath.row]["text"] as! String
        
        cell.tweetContent.text = "Something"
        return cell
    }
    
=======
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetCellTableViewCell
        
        
        let user = tweetArray[indexPath.row]["user"] as! NSDictionary
        cell.userNameLabel.text = user["name"] as? String
        cell.tweetContent.text = tweetArray[indexPath.row]["text"] as? String
        
        let imageUrl = URL(string: (user["profile_image_url_https"] as? String)!)
        let data = try? Data(contentsOf: imageUrl!)
        
        if let imageData = data {
            cell.profileImageVIew.image = UIImage(data: imageData)
        }
        
        return cell
    }
   

>>>>>>> 7ef0714c605eb4877c131f241eac7683dca06c61
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tweetArray.count
    }

}
