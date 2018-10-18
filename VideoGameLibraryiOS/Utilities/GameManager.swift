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
    private var gameArray = [Game(title: "Mario Kart", description: "", genre: "Racing", rating: "E"), Game(title: "Fruit Ninja", description: "", genre: "Arcade", rating: "E"), Game(title: "EA Sports UFC", description: "", genre: "Sports", rating: "T"), Game(title: "Worms", description: "", genre: "Strategy", rating: "E"), Game(title: "Power Pete", description: "", genre: "Shoot Em' Up", rating: "E"), Game(title: "Gears of War", description: "", genre: "Third Person Shooter", rating: "M"), Game(title: "Lego: Lord of the Rings", description: "", genre: "Action-Adventure", rating: "E")]
    
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
}



