//
//  UIView + exnesions.swift
//  MyFirstApp_1
//
//  Created by Александр  Крайнев on 07.10.2022.
//

import UIKit

extension UIView{
    func addShadowOnView()-> Void {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 1.0
    }
}
