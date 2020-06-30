//
//  ContentView.swift
//  dico-app
//
//  Created by vido on 21/06/2020.
//  Copyright © 2020 vido. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchText = ""
    @State private var searchClick: Bool = false
    @State private var searchAction: Bool = false
    @State private var tabScreen:Bool = false
    
    var body: some View {
        NavigationView {
                    // Search view
                    HStack {
                        HStack {
                            Image(systemName: "magnifyingglass")

                            TextField("search", text: $searchText, onEditingChanged: { isEditing in
                                self.searchClick = true
                            }, onCommit: {
                            }).foregroundColor(.primary)

                            Button(action: {
                                self.searchText = ""
                                self.searchClick = false
                            }) {
                                Image(systemName:"xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                            }
                        }
                        //.padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                        .foregroundColor(.secondary)
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10.0)

                        if searchClick && searchText != "" {                                NavigationLink(destination:TabFeatureView(searchText: self.searchText)) {
                                Text("Search")
                                .foregroundColor(Color(.systemBlue))
                            }
                        }
                    }
                    .padding(.horizontal)
                    .navigationBarTitle(Text("Dictionnaire Francais"))
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
