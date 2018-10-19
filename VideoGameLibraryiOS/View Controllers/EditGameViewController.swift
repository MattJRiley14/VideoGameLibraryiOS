//
//  EditGameViewController.swift
//  VideoGameLibraryiOS
//
//  Created by Matthew Riley on 10/18/18.
//  Copyright © 2018 Matthew Riley. All rights reserved.
//

import UIKit

class EditGameViewController: UIViewController {
    
    var gameToEdit: Game!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(gameToEdit.title)
        print(gameToEdit.description)

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

}
