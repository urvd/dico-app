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
//    var responses : ResponseResults{
//        var result:ResponseResults
//        let cache = NSCache<NSString, ResponseResults>()
//        let key = NSString(string:self.searchText)
//
//        if let cached = cache.object(forKey:key) {
//            result = cached
//            return result
//        } else {
//            result = ResponseProvider().provide(text: self.searchText)
//            cache.setObject(result, forKey:key )
//            return result
//        }
//
//    }
    
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

struct TabFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        TabFeatureView()
    }
}
