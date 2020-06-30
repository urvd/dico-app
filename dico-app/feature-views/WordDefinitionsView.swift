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
            HStack{
                Text("\(word) : definitions").font(.footnote)
            }
            
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
        }

    }

    struct DefinitionItem: View{
        init(definition:Definition) {
            self.definition = definition
        }
        var definition:Definition
        var body: some View {
            HStack{
                    Text(definition.mot)
                        .fontWeight(.bold)
                    Divider()
                    Text(definition.nature)
                    .fontWeight(.thin)
                Spacer()
                Text(definition.definition)
                Text(definition.source)
            }
        }
    }
}

struct WordDefinitionsView_Previews: PreviewProvider {
    static var previews: some View {
        WordDefinitionsView()
    }
}

