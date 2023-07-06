//
//  TableViewCell.swift
//  likeminds_assignment
//
//  Created by Kavya Khurana on 06/07/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet var collectionNameLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var displayImageView: UIImageView!
    @IBOutlet var artistNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(imageUrl: String, artist: String, collection: String, country: String, description: String) {
        ImageDownloader.downloadImage(imageUrl) {
            image, urlString in
            if let imageObject = image {
                // performing UI operation on main thread
                DispatchQueue.main.async { [weak self] in
                    self?.displayImageView.image = imageObject
                }
            }
        }
        artistNameLabel.text = artist
        collectionNameLabel.text = collection
        countryLabel.text = country
        descriptionLabel.text = description
    }

    
}

