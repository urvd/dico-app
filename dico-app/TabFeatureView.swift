//
//  TabFeatureView.swift
//  dico-app
//
//  Created by vido on 22/06/2020.
//  Copyright © 2020 vido. All rights reserved.
//

import SwiftUI

struct TabFeatureView: View {
    @State var searchText:String = ""
    
    var body: some View {
        ZStack{
            TabView{
                definitionView
                    .tabItem {
                        Text("Définition")
                    }
                                     
                Text("replace with Synonyme content if exist")
                    .tabItem {
                        Text("Synonyme")
                    }
                                     
                Text("replace with Antonyme content if exist")
                    .tabItem {
                        Text("Antonyme")
                    }
                                     
                Text("replace with Expression content if exist")
                    .tabItem {
                        Text("Expression")
                    }
            }
        }
    }
    
    var definitionView:WordDefinitionsView{
        self.searchText != "" ?  WordDefinitionsView(word:self.searchText): WordDefinitionsView()
    }
}

struct TabFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        TabFeatureView()
    }
}
