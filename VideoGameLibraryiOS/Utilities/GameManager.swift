//
//  GameManager.swift
//  VideoGameLibraryiOS
//
//  Created by Matthew Riley on 10/17/18.
//  Copyright © 2018 Matthew Riley. All rights reserved.
//

import Foundation
import RealmSwift
import UserNotifications

class GameManager {
    //Shared instance of the GameManager class
    static let sharedInstance = GameManager()
    
    //Creating a private initializer so that no instances of this class can be made anywhere else
    private init() {
        gameArray = realm.objects(Game.self)
//        gameArray[0].dueDate = Date()
    }
    
    //Results container for storing our Games. This functions very similarly to an array or dictionary.
    private var gameArray: Results<Game>!
    
    //Reference to the local Realm database
    let realm = try! Realm()
    
    //Function to get the number of games we have
    func getGameCount() -> Int {
        return gameArray.count
    }
    
    //Function to return a game at a specific index
    func getGame(at index: Int) -> Game {
        return gameArray[index]
    }
    
    //Function to add a game
    func addGame(game: Game) {
        try! realm.write {
            realm.add(game)
        }
    }
    
    //Function to remove a game
    func removeGame(at index: Int) {
        try! realm.write {
            realm.delete(getGame(at: index))
        }
    }
        
    //Function to check a game in or out
    func checkGameInOrOut(at index: Int) {
        
        let gameForIndex = gameArray[index]
        
        try! realm.write {
            gameForIndex.checkedIn = !gameForIndex.checkedIn

            if gameForIndex.checkedIn {
                //Remove any existing due date
                gameForIndex.dueDate = nil
            } else {
                //Add a new due date, since the game has just been checked out
                gameForIndex.dueDate = Calendar.current.date(byAdding: .day, value: 14, to: Date())
            }
        }
    }
}

/*
 [Game(title: "Mario Kart", gameDescription: "A great game to play at your Grandma's house with your brothers", genre: "Racing", rating: "E"), Game(title: "Fruit Ninja", gameDescription: "A great game to play at DisneyWorld with your wife", genre: "Arcade", rating: "E"), Game(title: "EA Sports UFC", gameDescription: "A great game to play at your brother's house with your brothers", genre: "Sports", rating: "T"), Game(title: "Worms", gameDescription: "A great game to play against your brother", genre: "Strategy", rating: "E"), Game(title: "Power Pete", gameDescription: "A great game to play on your computer for your entire childhood", genre: "Action-Adventure", rating: "E"), Game(title: "Gears of War", gameDescription: "A great game to play for hours on horde mode with your brothers", genre: "Action-Adventure", rating: "M"), Game(title: "Lego: Lord of the Rings", gameDescription: "A great game to play with your wife for your birthday", genre: "Action-Adventure", rating: "E")]
 */
