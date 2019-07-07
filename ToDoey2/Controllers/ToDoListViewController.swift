//
//  ViewController.swift
//  ToDoey2
//
//  Created by Kimberly Brewer on 7/6/19.
//  Copyright © 2019 Kimberly Brewer. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
//1. hard coded items to show up at start up (let itemArray = examples)
//2. MADE IT MUTABLE changed to var (still hard coded items)
//3. We just made our data model, so we're updating this to equal said datamodel class Item()
    var itemArray = [Item]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    //this creates a constant to hold a newItem that is of class Item (that we just made in the model)
        let newItemExample = Item()
        newItemExample.title = "Example Item Title 1"
        itemArray.append(newItemExample)
      
    } //ends viewDidLoad
    
    
    
    
    
    
 //MARK -- Tableview Datasource Methods
    
//tells the viewController how many rows will appear
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
//tells the numberOfRowsInSection that we want the number of rows equal to the itemArrays count
        return itemArray.count           }//ends numberOfRowsInSection
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//this is a parameter that must be included with the above func, it tells the tableView to reload the cell so the top becomes the bottom when scrolling and takes on its properties as well (checkmark)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
//we're adding this to shorten up the code, this makes total sense, so now selectedItem is equal to the itemA...
        let selectedItem = itemArray[indexPath.row]
    
//A. we're setting our cell's text property (which may be nil, ?), specifically the text of the row it is currently populating (that's the indexpath)
//B. we added the dataModel "Item" so now itemArray is actually equal to a class, and we're trying to set that type (type Item()) to equal the string (.text) which is not possible
        cell.textLabel?.text = selectedItem.title
        
        //Ternary operator ==>
        //value = condition ? valueIfTrue : valueIfFalse
           cell.accessoryType = selectedItem.isChecked ? .checkmark : .none
        
//now that updated cell from the code line above will be returned and shown on screen
        return cell
    }
    
//MARK -- TableView Delegate Methods "when you click on the cell in the table view", got it!
    
 override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    //Now that we updated our itemArray to be of type Item(), we need to address the checkmark issue:
    //sets done property on itemArray to the opposite of what it is now (ie the = ! is a NOT operator)
    itemArray[indexPath.row].isChecked = !itemArray[indexPath.row].isChecked
    
    //the above code is not showing up upon loading because all items are set to false upon loading, to fix this:
    tableView.reloadData()
    
    
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
            //A. Change: we made the Item model and now need to update this because itemArray is of type Item()
//So we make a new constant called newItem that holds a let of type Item(), we set the title of that newItem to equal the string that is the textField.text
//and THEN we can append this newItem (since newItem is of type Item()) to itemArray (which is also of type Item())
                let newItem = Item()
                newItem.title = alertLocalTextField.text!
                self.itemArray.append(newItem)
            
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
