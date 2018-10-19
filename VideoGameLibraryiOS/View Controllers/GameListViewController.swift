//
//  GameListViewController.swift
//  VideoGameLibraryiOS
//
//  Created by Matthew Riley on 10/15/18.
//  Copyright © 2018 Matthew Riley. All rights reserved.
//

import UIKit

class GameListViewController: UITableViewController {
        
    @IBOutlet var gameListTableView: UITableView!
    
    var currentGame: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        gameListTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EditGameViewController {
            //We need to pass through the Game that we'll be editing.
            destination.gameToEdit = currentGame
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GameManager.sharedInstance.getGameCount()
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell") as! GameTableViewCell
        
        let currentGame = GameManager.sharedInstance.getGame(at: indexPath.row)
        
        cell.titleLabel.text = currentGame.title
        cell.genreLabel.text = currentGame.genre
        cell.ratingLabel.text = currentGame.rating
        
        if currentGame.checkedIn {
            cell.statusView.backgroundColor = UIColor.green
        } else {
            cell.statusView.backgroundColor = UIColor.red
        }
        
        //If the game has a due date, we want to format it into a String and display it on the dueDateLabel
        if let dueDate = currentGame.dueDate {
            cell.dueDateLabel.text = formatDate(dueDate)
        } else {
            cell.dueDateLabel.text = ""
        }
        
        return cell
    }
    
    //THis allows us to return an array of actions that the row will have (if any)
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, _ in
            //Remove the game at the current index from our game array
            GameManager.sharedInstance.removeGame(at: indexPath.row)
            //Delete the row from the table view at the current index path
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let gameForIndex = GameManager.sharedInstance.getGame(at: indexPath.row)
        
        let title = gameForIndex.checkedIn ? "Check Out" : "Check In"
        
        let checkOutOrInAction = UITableViewRowAction(style: .normal, title: title) { _, _ in
            GameManager.sharedInstance.checkGameInOrOut(at: indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
        
        let showEditScreenAction = UITableViewRowAction(style: .normal, title: "Edit") { _, _ in
            self.currentGame = GameManager.sharedInstance.getGame(at: indexPath.row)
            self.performSegue(withIdentifier: "showEditGameScreen", sender: self)
        }
        
        deleteAction.backgroundColor = UIColor.red
        showEditScreenAction.backgroundColor = UIColor.lightGray
        checkOutOrInAction.backgroundColor = UIColor.darkGray
        
        return [deleteAction, showEditScreenAction, checkOutOrInAction]
    }
    
    @IBAction func unwindToGameList(segue: UIStoryboardSegue) {}
}



