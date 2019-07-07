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
    //edit UPDATE: MADE IT MUTABLE changed to var
    var itemArray = ["Chin Up", "Hustle", "Be Awesome"]
    
    

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

    
//MARK --Add new items
    
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
//we're creating a var that can be accessed throughout this function that is equal to a UITextField(init) - which is an edible text field on our interface.
        var alertLocalTextField = UITextField()
        
        
        //1. Make a popup (UI Alert Controller show up)
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        //(this is the button you press when you're done writing your to do list item)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the Add Item Button on our UIAlert
            
        //3. Append said text to the end of the item array
            self.itemArray.append(alertLocalTextField.text ?? "")
            
        //The above code does add the new item, but the view still hasn't been updated, so:
            self.tableView.reloadData()
            
        }
        
        //2. Have text field in said alert controller
//lol this has to be above the below code otherwise the text field appears on top the alert
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            
//now we can set our local var above to equal this textField which has a smaller scope, there for making it have a bigger scope with the local variable
            alertLocalTextField = alertTextField
            
        }
        
        
//the below codes are inits for the above constants let ALERT and let ACTION. If you don't have this, nothing happens when you click the "add" button
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
    } //ends addButtonPressed
    
    
    
    
    
    
} //ends ViewController class
