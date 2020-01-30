//
//  DetailViewController.swift
//  ProgrammaticUserCells
//
//  Created by Maitree Bain on 1/30/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var cellLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        updateUI()
        view.backgroundColor = .darkGray
    }
    
    private func updateUI() {
        
        guard let userInfo = user else {
            fatalError("could not segue")
        }
        
        nameLabel.text = "\(userInfo.name.first.capitalized ) \(userInfo.name.last.capitalized)"
        
        emailLabel.text = "E-mail: \(userInfo.email)"
        
        cellLabel.text = "Cell #: \(userInfo.cell)"
        
        cityLabel.text = "City: \(userInfo.location.city)"
        
        
        detailImage.getImage(with: userInfo.picture.large) { [weak self] (result) in
            
            switch result {
            case .failure:
                print("no image found")
            case .success(let image):
                DispatchQueue.main.async {
                    self?.detailImage.image = image
                }
            }
        }
    }

}
