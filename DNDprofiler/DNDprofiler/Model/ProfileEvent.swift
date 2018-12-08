//
//  ProfileEvent.swift
//  DNDprofiler
//
//  Created by Sam on 12/6/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import Foundation

struct ProfileEvent{
    
    var characterName: String
    var playerName: String
    var characterLevel: String
    var characterGold: String
    var characterExp: String
    
    init(characterName: String, playerName: String, characterLevel: String, characterGold: String, characterExp: String){
        self.characterName = characterName
        self.playerName = playerName
        self.characterGold = characterGold
        self.characterExp = characterExp
        self.characterLevel = characterLevel
    }
    
}
