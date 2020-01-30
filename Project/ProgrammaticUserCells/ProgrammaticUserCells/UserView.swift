//
//  UserView.swift
//  ProgrammaticUserCells
//
//  Created by Maitree Bain on 1/29/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class UserView: UIView {

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        
    }
}
