//
//  ContentTabFeatureView.swift
//  dico-app
//
//  Created by vido on 13/07/2020.
//  Copyright © 2020 vido. All rights reserved.
//

import SwiftUI

struct ContentTabFeatureView: View {
    @State var searchText:String = ""
        
        var body: some View {
            ZStack{
                TabView{
                    definitionView
                        .tabItem {
                            Text("Définition")
                        }
                                         
                    synonymeView
                        .tabItem {
                            Text("Synonyme")
                        }
                                         
                    antonymeView
                        .tabItem {
                            Text("Antonyme")
                        }
                                         
                    expressionView
                        .tabItem {
                            Text("Expression")
                        }
                }
            }
        }
        var errorContent: some View{
            Text("Pas de resultat pour \(searchText)")
        }
        
        var definitionView:WordDefinitionsView{
            self.searchText != "" ?  WordDefinitionsView(word:self.searchText): WordDefinitionsView()
        }
        var synonymeView: WordSynonymesView {
            WordSynonymesView(word:self.searchText)
        }
        
        var antonymeView:some View{
            WordAntonymeView(word:self.searchText)
            //ErrorContent(mot: searchText)
           
        }
        var expressionView:WordExpressionView{
            WordExpressionView(word:self.searchText)
        }
}

struct ContentTabFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTabFeatureView()
    }
}
