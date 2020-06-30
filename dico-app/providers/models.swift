//
//  models.swift
//  dico-app
//
//  Created by vido on 29/06/2020.
//  Copyright © 2020 vido. All rights reserved.
//

import Foundation


// models
struct Synonyme: Decodable{
    var mot:String
    var dicolinkUrl:String
}

struct Antonyme: Decodable{
    var mot:String
    var dicolinkUrl:String
}
struct Expression: Decodable{
    var mot:String
    var expression:String
    var semantique:String
    var context:String
}

struct Definition: Decodable, Identifiable,Hashable{
    var id:String
    var nature:String
    var source:String
    var attributionText:String
    var attributionUrl: String
    var mot:String
    var definition:String
    var dicolinkUrl:String
}
