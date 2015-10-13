//
//  ViewController.swift
//  Serach Display Controller
//
//  Created by PJ Vea on 4/12/15.
//  Copyright (c) 2015 Vea Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate, UISearchBarDelegate
{

    @IBOutlet weak var tableView: UITableView!
    
    var friendsArray = [FriendItem]()
    var filteredFriends = [FriendItem]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.friendsArray += [FriendItem(name: "Vea Software")]
        self.friendsArray += [FriendItem(name: "Apple")]
        self.friendsArray += [FriendItem(name: "iTunes")]
        self.friendsArray += [FriendItem(name: "iPhone")]
        self.friendsArray += [FriendItem(name: "Mac")]
        
        self.tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Table View
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (tableView == self.searchDisplayController?.searchResultsTableView)
        {
            return self.filteredFriends.count
        }
        else
        {
            return self.friendsArray.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        var friend : FriendItem
        
        if (tableView == self.searchDisplayController?.searchResultsTableView)
        {
            friend = self.filteredFriends[indexPath.row]
        }
        else
        {
            friend = self.friendsArray[indexPath.row]
        }
        
        cell.textLabel?.text = friend.name
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var friend : FriendItem
        
        if (tableView == self.searchDisplayController?.searchResultsTableView)
        {
            friend = self.filteredFriends[indexPath.row]
        }
        else
        {
            friend = self.friendsArray[indexPath.row]
        }
        
        println(friend.name)
        
        
    }
    
    // MARK: - Search Methods
    
    func filterContenctsForSearchText(searchText: String, scope: String = "Title")
    {
        
        self.filteredFriends = self.friendsArray.filter({( friend : FriendItem) -> Bool in
            
            var categoryMatch = (scope == "Title")
            var stringMatch = friend.name.rangeOfString(searchText)
            
            return categoryMatch && (stringMatch != nil)
            
        })
        
            
    }
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String!) -> Bool
    {
        
        self.filterContenctsForSearchText(searchString, scope: "Title")
        
        return true
        
        
    }
    
    
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchScope searchOption: Int) -> Bool
    {
        
        self.filterContenctsForSearchText(self.searchDisplayController!.searchBar.text, scope: "Title")
        
        return true
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

