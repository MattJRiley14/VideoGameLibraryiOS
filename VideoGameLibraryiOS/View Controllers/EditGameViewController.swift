//
//  EditGameViewController.swift
//  VideoGameLibraryiOS
//
//  Created by Matthew Riley on 10/18/18.
//  Copyright © 2018 Matthew Riley. All rights reserved.
//

import UIKit
import RealmSwift

class EditGameViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var gameTitleTextField: UITextField!
    @IBOutlet weak var gameDescriptionTextView: UITextView!
    @IBOutlet weak var gameRatingSegmentedControl: UISegmentedControl!
    @IBOutlet weak var gameGenrePicker: UIPickerView!
    
    //Array holding our genres
    let genres = ["Action", "Action-Adventure", "Adventure", "Arcade", "Racing", "Role-Playing", "Simulation", "Sports", "Strategy"]
    
    
    var gameToEdit: Game!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameTitleTextField.text = gameToEdit.title
        gameDescriptionTextView.text = gameToEdit.gameDescription
//        gameRatingSegmentedControl[] = gameToEdit.rating
//        gameGenrePicker = gameToEdit.genre
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genres[row]
    }
    
    func showErrorAlert() {
        let alertController = UIAlertController(title: "Error", message: "You must enter a title and description for the game", preferredStyle: .actionSheet)
        let closeAction = UIAlertAction(title: "Close", style: .default) { _ in
        }
        alertController.addAction(closeAction)
        self.present(alertController, animated: true, completion: nil)
    }

    
    @IBAction func submitButtonTapped(_ sender: Any) {
    
    
        guard let title = gameTitleTextField.text, title.trimmingCharacters(in: .whitespacesAndNewlines) != "",
            let gameDescription = gameDescriptionTextView.text, gameDescription.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
                //Show an error and return
                showErrorAlert()
                return
        }
        
        var rating: String!
        
        switch gameRatingSegmentedControl.selectedSegmentIndex {
        case 0:
            rating = "E"
        case 1:
            rating = "E10+"
        case 2:
            rating = "T"
        case 3:
            rating = "M"
        case 4:
            rating = "Ao"
        default:
            rating = "E"
        }
        
        let realm = try! Realm()
        
        try! realm.write {
            gameToEdit.title = title
            gameToEdit.gameDescription = gameDescription
            gameToEdit.rating = rating
            gameToEdit.genre = genres[gameGenrePicker.selectedRow(inComponent: 0)]
        }
        
        self.performSegue(withIdentifier: "unwindToGameListWithSegue", sender: self)
    }

}


