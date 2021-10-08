//
//  ListViewController.swift
//  BookApiGoogle
//
//  Created by François Vidal on 08/10/2021.
//

import Foundation
import UIKit
import CoreData

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var book = [Book]()
    private var books = [NSManagedObject]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let coreDataContext = AppDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "BookEntity")
        
        do {
            books = try coreDataContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Error could not retrieve data \(error)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        book = ListBook.listBook
        
        tableView.register(UINib(nibName: "BookListViewCell", bundle: nil), forCellReuseIdentifier: "BookListViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookListViewCell") as! BookListViewCell
        
        //let title = essentials[indexPath.row].value(forKey: "title")
        //let comments = essentials[indexPath.row].value(forKey: "comments")
        
        //let essential = Essential(title, comments)
        
        cell.setBookRow(book: book[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        book.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
