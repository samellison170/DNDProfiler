//
//  Profile+CoreDataProperties.swift
//  DNDprofiler
//
//  Created by Sam on 12/6/18.
//  Copyright © 2018 Sam. All rights reserved.
//
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var characterName: String?
    @NSManaged public var playerExp: String?
    @NSManaged public var playerGold: String?
    @NSManaged public var playerLevel: String?
    @NSManaged public var playerName: String?
    @NSManaged public var playerIconString: String?

}
