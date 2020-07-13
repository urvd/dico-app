//
//  models.swift
//  dico-app
//
//  Created by vido on 29/06/2020.
//  Copyright © 2020 vido. All rights reserved.
//

import Foundation


// models
struct Synonyme: Decodable, Hashable{
    var mot:String
    var dicolinkUrl:String
}

struct Antonyme: Decodable, Hashable{
    var mot:String
    var dicolinkUrl:String
}

struct Expression: Decodable,Hashable{
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

enum GETType:String{
    case SYNONYME = "s",
    ANTONYME = "a",
    DEFINITION = "d",
    EXPRESSION = "e"
}

struct NoResult:Decodable{
    var error:String;
}

protocol IFetcher {
    
    func fetch<T: Decodable>(completion: @escaping (Result<[T],FetchERROR>) -> (),typop:GETType)

}



@propertyWrapper
struct ResponseData<T>{
    init() {
        self.err = false
        self.datas = []
    }
    private var datas:[T]
    var err:Bool
    
    var wrappedValue:[T] {
        get{
            return self.datas
        }
        set{
            self.datas = newValue
        }
        
    }
}
