//
//  WordSynonymesView.swift
//  dico-app
//
//  Created by vido on 02/07/2020.
//  Copyright © 2020 vido. All rights reserved.
//

import SwiftUI

struct WordSynonymesView: View {
    @State var word:String = ""
    @State var synonymes:[Synonyme] = []
    @State var err:Bool = false
    var body: some View {
        VStack{
            VStack{
                Text("\(word) : synonymes").font(.title)
            }.foregroundColor(.primary)
            
            List(synonymes, id: \.mot){ result in
                Text("\(result.mot)")
            }.onAppear {
                FetchApi(word:self.word).fetchSynonymes(
                    completion: { (result) in
                    switch result {
                        case .failure(let error):
                                    print("error in definitions: \(error)")
                                    self.err = true
                        case .success(let synonymes):
                                    self.synonymes = synonymes
                        }
                 },
                    typop: .SYNONYME)
            }
        }
    }
}

struct WordSynonymesView_Previews: PreviewProvider {
    static var previews: some View {
        WordSynonymesView()
    }
}
