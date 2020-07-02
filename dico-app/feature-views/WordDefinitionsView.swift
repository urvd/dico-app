//
//  WordDefinitionsView.swift
//  dico-app
//
//  Created by vido on 22/06/2020.
//  Copyright © 2020 vido. All rights reserved.
//

import SwiftUI

struct WordDefinitionsView: View {
    
    @State var word:String = ""
    @State var definitions: [Definition] = []
    var body: some View {
        VStack{
            VStack{
                Text("\(word) : definitions").font(.title)
            }.foregroundColor(.primary)
            
            List(definitions){ definition in
                DefinitionItem(definition: definition)
                /*HStack{
                    VStack{
                        Text(definition.mot)
                            .fontWeight(.bold)
                        Text(definition.nature)
                                   .fontWeight(.thin)
                    }
                    Text(definition.definition)
                    Text(definition.source)
                }*/
            }
            .onAppear {
                //let service = FetchApi(type:GETType.DEFINITION, word:self.word)
                 FetchApi(type:GETType.DEFINITION, word:self.word).fetchDefinition{ (definitions) in
                    self.definitions = definitions
                }
            }
        }.foregroundColor(.gray)

    }

    struct DefinitionItem: View{
        /*init(definition:Definition) {
            self.definition = definition
        }*/
        var definition:Definition
        var body: some View {
            VStack{
                //let result = definition.nature.trimmingCharacters(in: .whitespaces)
                if !definition.nature.isEmpty{
                     HStack{
                        Text("Nature: ").fontWeight(.thin)
                        Text(definition.nature)
                            .fontWeight(.thin)
                            .italic()
                        Spacer()
                    }
                }
                Text(definition.definition).font(.body)
                Text("Source: "+definition.source).font(.footnote)
            }
        }
    }
}

struct WordDefinitionsView_Previews: PreviewProvider {
    static var previews: some View {
        WordDefinitionsView()
    }
}

