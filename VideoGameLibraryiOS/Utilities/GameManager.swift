//
//  GameManager.swift
//  VideoGameLibraryiOS
//
//  Created by Matthew Riley on 10/17/18.
//  Copyright © 2018 Matthew Riley. All rights reserved.
//

import Foundation

class GameManager {
    //Shared instance of the GameManager class
    static let sharedInstance = GameManager()
    
    //Creating a private initializer so that no instances of this class can be made anywhere else
    private init() {
        gameArray[0].dueDate = Date()
    }
    
    //Array of games that will be used throughout the application
    private var gameArray = [Game(title: "Mario Kart", description: "A great game to play at your Grandma's house with your brothers", genre: "Racing", rating: "E"), Game(title: "Fruit Ninja", description: "A great game to play at DisneyWorld with your wife", genre: "Arcade", rating: "E"), Game(title: "EA Sports UFC", description: "A great game to play at your brother's house with your brothers", genre: "Sports", rating: "T"), Game(title: "Worms", description: "A great game to play against your brother", genre: "Strategy", rating: "E"), Game(title: "Power Pete", description: "A great game to play on your computer for your entire childhood", genre: "Shoot Em' Up", rating: "E"), Game(title: "Gears of War", description: "A great game to play for hours on horde mode with your brothers", genre: "Third Person Shooter", rating: "M"), Game(title: "Lego: Lord of the Rings", description: "A great game to play with your wife for your birthday", genre: "Action-Adventure", rating: "E")]
    
    //Function to get the number of games we have
    func getGameCount () -> Int {
        return gameArray.count
    }
    
    //Function to return a game at a specific index
    func getGame(at index: Int) -> Game {
        return gameArray[index]
    }
    
    //Function to add a game
    func addGame(game: Game) {
        gameArray.append(game)
    }
    
    //Function to remove a game
    func removeGame(at index: Int) {
        gameArray.remove(at: index)
    }
    
    //Function to check a game in or out
    func checkGameInOrOut(at index: Int) {
        let gameForIndex = gameArray[index]
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



