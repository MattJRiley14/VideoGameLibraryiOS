//
//  Game.swift
//  VideoGameLibraryiOS
//
//  Created by Matthew Riley on 10/16/18.
//  Copyright © 2018 Matthew Riley. All rights reserved.
//

import Foundation


// This is the data model that represents our Games that will be stored in our library
class Game {
    // This will store the title of the Game
    var title: String
    
    //This will store the description of the Game
    var description: String
    
    //This will store the genre of the Game
    var genre: String
    
    // This will store the rating of the Game
    var rating: String
    
    // Optional because if a game isn't checked out, then it shouldn't have a due date
    var dueDate: Date?
    
    // We are going to set this to true by default, since whenvever we create a new Game, we're going to assume it's checked in
    var checkedIn: Bool = true
    
    // Since checkedIn has a default value and dueDate is an optional, the only value that we have to initialize is the title & rating
    init(title: String, description: String, genre: String, rating: String) {
        self.title = title
        self.rating = rating
        self.description = description
        self.genre = genre
    }
}
