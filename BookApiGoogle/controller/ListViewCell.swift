//
//  ListViewCell.swift
//  BookApiGoogle
//
//  Created by François Vidal on 08/10/2021.
//

import Foundation
import UIKit
class ListViewCell: UITableViewCell {
    
    @IBOutlet private weak var titre: UITextField!
    @IBOutlet private weak var auteur: UITextField!
    @IBOutlet private weak var resume: UITextField!
    @IBOutlet private weak var btnBookMark: UIButton!

}
