//
//  errors.swift
//  dico-app
//
//  Created by vido on 30/06/2020.
//  Copyright © 2020 vido. All rights reserved.
//

import Foundation
import SwiftUI

enum FetchERROR:Error{
    case NO_RESULT
    case ANOTHER
}

struct ErrorContent:View{
    @State var mot:String = ""
    
    var body: some View{
        Text("Pas de resultat pour \(mot)")
    }
}
