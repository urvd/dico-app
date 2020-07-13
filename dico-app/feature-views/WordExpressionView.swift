//
//  WordExpressionView.swift
//  dico-app
//
//  Created by vido on 05/07/2020.
//  Copyright © 2020 vido. All rights reserved.
//

import SwiftUI

struct WordExpressionView: View {
   @State var word:String = ""
   @State var expressions:[Expression] = []
   @State var err:Bool = false
   var body: some View {
       VStack{
           VStack{
               Text("\(word) : expressions").font(.title)
           }.foregroundColor(.primary)

           List(expressions,id: \.expression){ result in
               VStack{
                    Text("Semantique: \(result.semantique)")
                    Text("Expression: \(result.expression)")
               }
               
           }.onAppear {
               FetchApi(word:self.word).fetchExpression(
                    completion: { (result) in
                       switch result {
                           case .failure(let error):
                               print("error in definitions: \(error)")
                               self.err = true
                           case .success(let expressions):
                           self.expressions = expressions
                       }
                },
                   typop: .EXPRESSION)
           }
       }
   }
}

struct WordExpressionView_Previews: PreviewProvider {
    static var previews: some View {
        WordExpressionView()
    }
}
