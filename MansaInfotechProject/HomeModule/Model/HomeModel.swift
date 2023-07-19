//
//  HomeModel.swift
//  MansaInfotechProject
//
//  Created by satyam Tayal on 08/04/23.
//

import Foundation

//MARK: - Home Model created for respective items that table left and right usage

struct HomeModel: Codable {
    let id: Int?
    let title: String?
    var value: Int?
    var selected: Bool = false
}
