//
//  ProfilePic.swift
//  DNDprofiler
//
//  Created by Sam on 12/6/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit

enum ProfilePic: String{
    case ProfileIcon1
    case ProfileIcon2
    case ProfileIcon3
    case ProfileIcon4
    case ProfileIcon5
    case ProfileIcon6
    case ProfileIcon7
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
}
