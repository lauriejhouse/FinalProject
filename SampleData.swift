//
//  SampleData.swift
//  FinalProjectTask
//
//  Created by Jackie on 9/17/18.
//  Copyright © 2018 LAS. All rights reserved.
//

import Foundation


final class SampleData {
    
    static func generateTaskData() -> [Task] {
        return [
            Task(name: "Clean Living Room", taskType: "Vaccuum", rating: 4),
            Task(name: "Sweep Floors", taskType: "Broom", rating: 5),
            Task(name: "Laundry", taskType: "Laundry", rating: 2)
     ]
        
        
    }
    
    
}
