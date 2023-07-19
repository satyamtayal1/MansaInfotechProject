//  HomeTblCell.swift
//  MansaInfotechProject
//  Created by satyam Tayal on 08/04/23.

import Foundation
import UIKit

//MARK: - Table Cell created and it's outlet initilized...
class HomeTblCell : UITableViewCell
{
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    
    @IBOutlet weak var btnPlus: UIButton?
    @IBOutlet weak var btnMinus: UIButton?
}
