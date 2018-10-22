//
//  Game.swift
//  VideoGameLibraryiOS
//
//  Created by Matthew Riley on 10/16/18.
//  Copyright © 2018 Matthew Riley. All rights reserved.
//

import Foundation
import RealmSwift


// This is the data model that represents our Games that will be stored in our library
class Game: Object {
    // This will store the title of the Game
    @objc dynamic var title: String = ""
    
    //This will store the description of the Game
    @objc dynamic var gameDescription: String = ""
    
    //This will store the genre of the Game
    @objc dynamic var genre: String = ""
    
    // This will store the rating of the Game
    @objc dynamic var rating: String = ""
    
    // Optional because if a game isn't checked out, then it shouldn't have a due date
    @objc dynamic var dueDate: Date? = nil
    
    // We are going to set this to true by default, since whenvever we create a new Game, we're going to assume it's checked in
    @objc dynamic var checkedIn: Bool = true
    
    // Since checkedIn has a default value and dueDate is an optional, the only value that we have to initialize is the title & rating
    //Removed init due to Realm Swift being used
}
