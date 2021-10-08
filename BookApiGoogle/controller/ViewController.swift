//
//  ViewController.swift
//  BookApiGoogle
//
//  Created by François Vidal on 08/10/2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet private weak var titre: UITextField!
    @IBOutlet private weak var auteur: UITextField!
    @IBOutlet private weak var btnRechercher: UIButton!
    @IBOutlet private weak var btnBibliotheque: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnRechercher.addTarget(self, action: #selector(viewListAPI), for: .touchUpInside)

    }
    
    @objc
    func viewListAPI() {
        let listViewStoryBoard = UIStoryboard(name: "ListViewController", bundle: nil)
        let listViewController = listViewStoryBoard.instantiateViewController(withIdentifier: "ListViewController")
        
        navigationController?.pushViewController(listViewController, animated: true)
        showRepository()
    }
    
    @objc
    func showRepository() {
        if let titre = titre.text {
            let request = AF.request("https://www.googleapis.com/books/v1/volumes?q=\(String(titre))")
            request.responseDecodable(of: [Book].self) { response in
                print(response)
                switch response.result {
                case .success:
                    if let repositories = response.value {
                        let message = "Aucun livre trouvé"
                        if repositories.count > 0 {
                            self.displayAlert(title: "\(repositories.count) livre(s) trouvé(s)", message: "\(repositories[0].getTitre()) est le premier livre de la liste")
                        } else {
                            self.displayAlert(title: "Error", message: message)
                        }
                        
                    }
                case.failure:
                        self.displayAlert(title: "Error", message: "\(String(describing:response.error))")
                }
            }
            
        }
    }


}

