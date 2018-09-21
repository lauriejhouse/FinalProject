//
//  MasterViewController.swift
//  FinalProjectTask
//
//  Created by Jackie on 9/12/18.
//  Copyright © 2018 LAS. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    //PlayersViewController
    
    // MARK: - Properties
    
    var tasks = SampleData.generateTaskData() //var players = sampledata
    
    
    
    var names = [Task]() //used to be items = [Item]
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if editing {
            tableView.setEditing(true, animated: true)
        } else {
            tableView.setEditing(false, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.isEditing = true
        navigationItem.rightBarButtonItem = editButtonItem

        
        
//
//        for i in 1...10 {
//            //change description to be task and task description
//            items.append(Item(title: "Item \(i)", text: "This is item #\(i)"))
//        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return names.count
//    }

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        cell.textLabel?.text = names[indexPath.row].taskType
//
//        return cell
//    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowDetail" {
//            if let indexPath = self.tableView.indexPathForSelectedRow {
//                let taskName = names[indexPath.row]
//                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
//                controller.item = taskName
//            }
//
//        }
//
//    }
    
  


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            names.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
 

    
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        
        tableView.moveRow(at: sourceIndexPath, to: destinationIndexPath)
        
    }
    
    
 
    


    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - UITableViewDataSource
extension MasterViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell",
                                                 for: indexPath) as! TaskCell
        
        let player = tasks[indexPath.row]
        cell.player = player
        return cell
    }

}



extension MasterViewController {
    
    @IBAction func cancelToPlayersViewController(_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func savePlayerDetail(_ segue: UIStoryboardSegue) {
        
        guard let NewTaskTableViewController = segue.source as? NewTaskTableViewController,
            let newTask = NewTaskTableViewController.taskTitle else {
                return
        }
        
        // add the new player to the players array
                names.append(newTask)
        
        
        // update the tableView
        let indexPath = IndexPath(row: names.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
}

