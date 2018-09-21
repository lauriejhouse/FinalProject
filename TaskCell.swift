//
//  TaskCell.swift
//  FinalProjectTask
//
//  Created by Jackie on 9/18/18.
//  Copyright © 2018 LAS. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView! //Replace later with icons of my own? Or done, not done, or satisfaction rating


    // MARK: - Properties
    var player: Task? {
        didSet {
            guard let taskName = player else { return }
            
            taskLabel.text = taskName.taskType
            nameLabel.text = taskName.name
            ratingImageView.image = image(forRating: (player?.rating)!)
        }
    }

    func image(forRating rating: Int) -> UIImage? {
        let imageName = "\(rating)Stars"
        return UIImage(named: imageName)
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
