//
//  Profile+CoreDataClass.swift
//  DNDprofiler
//
//  Created by Sam on 12/6/18.
//  Copyright © 2018 Sam. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Profile)
public class Profile: NSManagedObject {
    
    convenience init?(playerName: String, characterName: String, playerLevel: String, playerGold: String, playerExp: String, playerIconString: String ) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Profile.entity(), insertInto: managedContext)
        self.playerName = playerName
        self.characterName = characterName
        self.playerLevel = playerLevel
        self.playerGold = playerGold
        self.playerExp = playerExp
        self.playerIconString = playerIconString
    }
}
