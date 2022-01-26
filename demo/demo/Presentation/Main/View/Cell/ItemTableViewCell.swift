//
//  ItemTableViewCell.swift
//  demo
//
//  Created by Sky on 22/01/2022.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var shortDescLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    static let reuseIdentifier = String(describing: ItemTableViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemImageView.image = #imageLiteral(resourceName: "placeholder")
        for item in [shortDescLabel, locationLabel, titleLabel, timeLabel] {
            item?.textColor = .white
        }
        
        // Label
        shortDescLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        locationLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        timeLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
    
    func config(with item: MainEntity) {
        shortDescLabel.text = item.description
        locationLabel.text = item.location
        titleLabel.text = item.title
        timeLabel.text = item.date
        
        if let imageUrl = item.imageUrl, let url = URL(string: imageUrl) {
            itemImageView.load(url: url)
        } else {
            itemImageView.image = #imageLiteral(resourceName: "placeholder")
        }
    }
}
