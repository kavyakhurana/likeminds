//
//  TableViewEntity.swift
//  likeminds_assignment
//
//  Created by Kavya Khurana on 06/07/23.
//

import Foundation

struct Result: Codable {
    var results: [Results]
}

struct Results: Codable {
    var artworkUrl100: String?
    var description: String?
    var artistName: String?
    var collectionName: String?
    var country: String?
}
