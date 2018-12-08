//
//  ProfileCreateViewController.swift
//  DNDprofiler
//
//  Created by Sam on 11/2/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit

class ProfileCreateViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
    

    @IBOutlet weak var ProfileIcon: UIImageView!
    @IBOutlet weak var playerName: UITextField!
    @IBOutlet weak var characterName: UITextField!
    @IBOutlet weak var playerLevel: UITextField!
    @IBOutlet weak var playerGold: UITextField!
    @IBOutlet weak var playerExp: UITextField!
    @IBOutlet weak var ProfilePicker: UIPickerView!
    @IBOutlet weak var saveButton: UIButton!
    
    var existingProfile: Profile?
    
    let Profiles = ["ProfileIcon1", "ProfileIcon2", "ProfileIcon3","ProfileIcon4","ProfileIcon5","ProfileIcon6","ProfileIcon7"]
    var profileSelectionString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerName.text = existingProfile?.playerName
        characterName.text = existingProfile?.characterName
        characterName.addTarget(self, action: #selector(ProfileCreateViewController.textFieldDidEndEditing(_:)), for: UIControlEvents.editingChanged)
        if characterName.text == ""{
            saveButton.isEnabled = false
        }
        playerLevel.text = existingProfile?.playerLevel
        playerGold.text = existingProfile?.playerGold
        playerExp.text = existingProfile?.playerExp
        for profile in Profiles.enumerated(){
            if existingProfile?.playerIconString == profile.element{
                ProfilePicker.selectRow(profile.offset, inComponent: 0, animated: false)
                profileSelectionString = profile.element
                ProfileIcon.image = UIImage(named: profile.element)
                print(profile.offset)
            }
        }
        // Do any additional setup after loading the view.
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if(characterName.text == ""){
            saveButton.isEnabled = false
            print(characterName.text)
        }
        else{
            saveButton.isEnabled = true
        }
        //saveButton.isEnabled = true
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Profiles[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Profiles.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ProfileIcon.image = UIImage(named: Profiles[row])
        profileSelectionString = Profiles[row]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
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
            existingProfile.playerIconString = profileSelectionString
            
            profile = existingProfile
        }else{
            profile = Profile(playerName: pName, characterName: cName!, playerLevel: pLevel, playerGold: pGold, playerExp: pExp, playerIconString: profileSelectionString)
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
