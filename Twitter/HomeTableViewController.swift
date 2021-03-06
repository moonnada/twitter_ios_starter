//
//  HomeTableViewController.swift
//  Twitter
//
//  Created by Byung Moon Kim on 3/2/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    
    var tweetArray = [NSDictionary]()
    var numberOfTweet: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTweet() //when i load the app display the tweet content
    }
    
    func loadTweet(){
        
        let myUrl = "https://api.twitter.com/1.1/statuses/home_timeline.json"
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
    
    
    @IBAction func onLogout(_ sender: Any) {
        TwitterAPICaller.client?.logout()
        self.dismiss(animated: true, completion: nil)
        
        UserDefaults.standard.set(false, forKey: "userLoggedIn")  //After I click logout button, this app will not login automatically.
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetCell
        
       // let user = tweetArray[indexPath.row]["user"] as! NSDictionary
        
        //cell.userNameLabel.text = user["name"] as? String
        cell.userNameLabel.text = "name"
        //cell.tweetContent.text = tweetArray[indexPath.row]["text"] as! String
        
        cell.tweetContent.text = "Something"
        return cell
    }
    
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
