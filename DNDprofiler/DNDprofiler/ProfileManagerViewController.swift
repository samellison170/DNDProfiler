//
//  ProfileManagerViewController.swift
//  DNDprofiler
//
//  Created by Sam on 11/2/18.
//  Copyright © 2018 Sam. All rights reserved.
//

import UIKit
import CoreData

class ProfileManagerViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var profileTableView: UITableView!
    
    var profiles = [Profile]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Profile> = Profile.fetchRequest()
        do{
            profiles = try managedContext.fetch(fetchRequest)
            
            profileTableView.reloadData()
        }
        catch{
            print("fetch could not be performed")
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath)
        let profile = profiles[indexPath.row]
        
        if let cell = cell as? ProfileTableViewCell{
            //let profileEvent = ProfileEvent[indexPath.row]
            cell.ProfileIcon.image = UIImage(named: profile.playerIconString ?? "")
            cell.CharacterNameLabel.text = profile.characterName
            cell.LevelLabel.text = profile.playerLevel
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showProfile", sender: self)
    }
    
    func deleteProfile(at indexPath: IndexPath){
        let profile = profiles[indexPath.row]
        
        if let managedContext = profile.managedObjectContext{
            managedContext.delete(profile)
            
            do{
                try managedContext.save()
                
                self.profiles.remove(at: indexPath.row)
                profileTableView.deleteRows(at: [indexPath], with: .automatic)
            }catch{
                print("delete failed")
                
                profileTableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            deleteProfile(at: indexPath)
        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ProfileCreateViewController,
        let selectedRow = self.profileTableView.indexPathForSelectedRow?.row else{
            return
        }
        
        destination.existingProfile = profiles[selectedRow]
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
