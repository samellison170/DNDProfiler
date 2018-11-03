//
//  ProfileCreateViewController.swift
//  DNDprofiler
//
//  Created by Sam on 11/2/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit

class ProfileCreateViewController: UIViewController {

    @IBOutlet weak var playerName: UITextField!
    @IBOutlet weak var characterName: UITextField!
    @IBOutlet weak var playerLevel: UITextField!
    @IBOutlet weak var playerGold: UITextField!
    @IBOutlet weak var playerExp: UITextField!
    
    var existingProfile: Profile?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerName.text = existingProfile?.playerName
        characterName.text = existingProfile?.characterName
        playerLevel.text = existingProfile?.playerLevel
        playerGold.text = existingProfile?.playerGold
        playerExp.text = existingProfile?.playerExp
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveProfile(_ sender: Any) {
        let pName = playerName.text ?? ""
        let cName = characterName.text
        let pLevel = playerLevel.text ?? ""
        let pGold = playerGold.text ?? ""
        let pExp = playerExp.text ?? ""
        
        var profile: Profile?
        
        if let existingProfile = existingProfile{
            existingProfile.playerName = pName
            existingProfile.characterName = cName
            existingProfile.playerLevel = pLevel
            existingProfile.playerGold = pGold
            existingProfile.playerExp = pExp
            
            profile = existingProfile
        }else{
            profile = Profile(playerName: pName, characterName: cName!, playerLevel: pLevel, playerGold: pGold, playerExp: pExp)
        }
        
        if let profile = profile{
            do{
                let managedContext = profile.managedObjectContext
                
                try managedContext?.save()
                
                self.navigationController?.popViewController(animated: true)
            }
            catch{
                print("profile could not be saved")
            }
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
