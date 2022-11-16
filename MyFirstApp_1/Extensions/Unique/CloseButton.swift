//
//  CloseButton.swift
//  MyFirstApp_1
//
//  Created by Александр  Крайнев on 04.11.2022.
//

import UIKit

class CloseButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setBackgroundImage(UIImage(named: "Close Button"), for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }
}

