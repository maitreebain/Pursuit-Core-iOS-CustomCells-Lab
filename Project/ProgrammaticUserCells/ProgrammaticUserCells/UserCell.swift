//
//  UserCell.swift
//  ProgrammaticUserCells
//
//  Created by Maitree Bain on 1/29/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit
import ImageKit

class UserCell: UICollectionViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    public func configureCell(_ userData: User) {
        
        userName.text = "\(userData.name.first.capitalized) \(userData.name.last.capitalized)"
        
        userImage.getImage(with: userData.picture.medium) { [weak self] (result) in
            
            switch result {
            case .failure(let appError):
                print("appError: \(appError)")
            case .success(let image):
                DispatchQueue.main.async {
                    self?.userImage.image = image
                }
            }
        }
        
    }
    
}
