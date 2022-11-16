//
//  UIStack + extensions.swift
//  MyFirstApp_1
//
//  Created by Александр  Крайнев on 11.10.2022.
//

import UIKit

extension UIStackView{
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis,spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
