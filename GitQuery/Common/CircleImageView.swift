//
//  ImageViewExtension.swift
//  GitQuery
//
//  Created by Maruf Nebil Ogunc on 7.12.2018.
//  Copyright © 2018 Maruf Nebil Ogunc. All rights reserved.
//

import UIKit

extension UIImageView{
    func roundImage() -> UIImageView{
        self.layer.cornerRadius = self.frame.width/2.0
        self.clipsToBounds = true
        return self
    }
}
