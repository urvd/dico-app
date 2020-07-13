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
    @State var err:Bool = false
    var body: some View {
        VStack{
            VStack{
                Text("\(word) : definitions").font(.title)
            }.foregroundColor(.primary)
                
            List(definitions){ definition in
//                if err{
//                    ErrorContent(word)
//                }else {
                    DefinitionItem(definition: definition)
//                }
            }
            .onAppear {
                FetchApi(word:self.word).fetchDefinition(
                    completion: { (result) in
                        switch result {
                            case .failure(let error):
                                        print("error in definitions: \(error)")
                                        self.err = true
                            case .success(let definitions):
                                        self.definitions = definitions
                            }
                        //self.definitions = definitions
                 },
                    typop: .DEFINITION)
            }
        }.foregroundColor(.gray)

    }
    
    var errorContent: some View{
        Text("Pas de resultat pour \(word)")
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

