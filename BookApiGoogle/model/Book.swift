//
//  Book.swift
//  BookApiGoogle
//
//  Created by François Vidal on 08/10/2021.
//

import Foundation
class Book: Codable {
    
    private var title: String
    private var authors: String
    private var resume: String
    private var image: String
    private var url: String
    
    init(title: String, authors: String, resume: String, image:String, url: String)
    {
        self.title = title
        self.authors = authors
        self.resume = resume
        self.image = image
        self.url = url
    }
    
    func getTitre() -> String {
        return self.title
    }
    
    func getAuthors() -> String {
        return self.authors
    }
    
    func getResume() -> String {
        return self.resume
    }
    
}
