//
//  WordAntonymeView.swift
//  dico-app
//
//  Created by vido on 05/07/2020.
//  Copyright © 2020 vido. All rights reserved.
//

import SwiftUI

struct WordAntonymeView: View {
       @State var word:String = ""
       @State var antonymes:[Antonyme] = []
        @State var err:Bool = false
       var body: some View {
           VStack{
               VStack{
                   Text("\(word) : antonymes").font(.title)
               }.foregroundColor(.primary)
               
               List(antonymes, id: \.mot){ result in
                   Text("\(result.mot)")
               }.onAppear {
                   FetchApi(word:self.word).fetchAntonyme(
                        completion: { (result) in
                            switch result {
                                case .failure(let error):
                                    print("error in definitions: \(error)")
                                    self.err = true
                                case .success(let antonymes):
                                    self.antonymes = antonymes
                            }
                    },
                       typop: .ANTONYME)
               }
           }
       }
}

struct WordAntonymeView_Previews: PreviewProvider {
    static var previews: some View {
        WordAntonymeView()
    }
}
