//
//  TaskPickerViewController.swift
//  FinalProjectTask
//
//  Created by Jackie on 9/17/18.
//  Copyright © 2018 LAS. All rights reserved.
//

import UIKit

class TaskPickerViewController: UITableViewController {

    // MARK: - Properties
    var tasks = [
        "Laundry",
        "Cook Dinner",
        "Make Bed",
        "Clean Floors",
        "Empty Dishwasher",
        "Vaccuum",
     
    ]
    
    
    var selectedTask: String? {
        didSet {
            if let selectedTask = selectedTask,
                let index = tasks.index(of: selectedTask) {
                selectedTaskIndex = index
            }
        }
    }
    
    var selectedTaskIndex: Int?

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "SaveSelectedTask",
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell) else {
                return
        }
        
        let index = indexPath.row
        selectedTask = tasks[index]
    }

    
    
    
    
    
    

}

// MARK: - UITableViewDataSource
extension TaskPickerViewController {
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        
        if indexPath.row == selectedTaskIndex {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }

}


// MARK: - UITableViewDelegate
extension TaskPickerViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Other row is selected - need to deselect it
        if let index = selectedTaskIndex {
            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0))
            cell?.accessoryType = .none
        }
        
        selectedTask = tasks[indexPath.row]
        
        // update the checkmark for the current row
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
    }
}

