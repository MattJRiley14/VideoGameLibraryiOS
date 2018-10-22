//
//  GameDetailsViewController.swift
//  VideoGameLibraryiOS
//
//  Created by Matthew Riley on 10/18/18.
//  Copyright © 2018 Matthew Riley. All rights reserved.
//

import UIKit

class GameDetailsViewController: UIViewController {
    
    @IBOutlet weak var gameTitleLabel: UILabel!
    @IBOutlet weak var gameDescriptionLabel: UILabel!
    @IBOutlet weak var gameGenreLabel: UILabel!
    @IBOutlet weak var gameRatingLabel: UILabel!


    var game: Game!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        gameTitleLabel.text = game.title
        gameDescriptionLabel.text = game.gameDescription
        gameGenreLabel.text = game.genre
        gameRatingLabel.text = game.rating
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





