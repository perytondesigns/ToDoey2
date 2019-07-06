//
//  ViewController.swift
//  ToDoey2
//
//  Created by Kimberly Brewer on 7/6/19.
//  Copyright © 2019 Kimberly Brewer. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
//hard coded items to show up at start up
    let itemArray = ["Chin Up", "Hustle", "Be Awesome"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//tells the viewController how many rows will appear
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
//tells the numberOfRowsInSection that we want the number of rows equal to the itemArrays count
        return itemArray.count
    
    }//ends numberOfRowsInSection
    
    
 
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//this is a parameter that must be included with the above func
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
    
//we're setting our cell's text property (which may be nil, ?), specifically the text of the row it is currently populating (that's the indexpath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
//now that updated cell from the code line above will be returned and shown on screen
        return cell
    }
    
//MARK -- TableView Delegate Methods "when you click on the cell in the table view", got it!
 override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    //print (itemArray[indexPath.row])
    
//grabs a reference to the cell that is at a particular index path
    if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    } else { tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark }
    
    
//this makes it not gray out completely when clicked on (it flashes gray instead with the code below)
    tableView.deselectRow(at: indexPath, animated: true)
    
    }

    
    
    
    
    
    
    
    
    
} //ends ViewController class
