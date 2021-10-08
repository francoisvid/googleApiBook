//
//  BookListViewCell.swift
//  BookApiGoogle
//
//  Created by François Vidal on 08/10/2021.
//

import Foundation
import UIKit

protocol ListViewCellDelegate {
    func handleEssentialSelection(book: Book)
}

class BookListViewCell: UITableViewCell {
    @IBOutlet private weak var titre: UILabel!
    @IBOutlet private weak var auteur: UILabel!
    @IBOutlet private weak var resume: UILabel!
    @IBOutlet private weak var btnBookmark: UIButton!
    
    func setBookRow(book: Book) {
        titre.text = book.getTitre()
        auteur.text = book.getAuthors()
        resume.text = book.getResume()

    }
}
