//
//  Item.swift
//  FinalProjectTask
//
//  Created by Jackie on 9/13/18.
//  Copyright © 2018 LAS. All rights reserved.
//

//File is Player.swift in example file

import UIKit

class Task { //Used to be Item

    var name: String  //task title
    var taskType: String //task type. called game in demo. used to be text
    var rating: Int
    
    init(name: String, taskType: String, rating: Int) {
        self.name = name
        self.taskType = taskType
        self.rating = rating
    }

//may need to change these to match the task type.
//name and task type used to be title and text.

}
