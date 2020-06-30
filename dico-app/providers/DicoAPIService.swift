//
//  DicoAPIService.swift
//  dico-app
//
//  Created by vido on 21/06/2020.
//  Copyright © 2020 vido. All rights reserved.
//

//import SwiftUI
import  Foundation

struct Args{
    static var baseUrl = "https//dicolink.p.rapidapi.com/mot"
    static var endpointSynonymes = "/synonymes"
    static var endpointAntonymes = "/antonymes"
    static var endpointDefinition = "/definitions"
    static var endpointExpression = "/expression"
    static var RESULT_LIMIT = "limite=12"
}

struct UrlBuilder{
    init(type:GETType, word:String) {
        switch (type) {
            case GETType.DEFINITION:
                self.url = "\(Args.baseUrl) /" + word + Args.endpointDefinition
            
            case GETType.SYNONYME:
                self.url = Args.baseUrl + "/" + word + Args.endpointSynonymes + "?" + Args.RESULT_LIMIT
            
            case GETType.ANTONYME:
                self.url = Args.baseUrl + "/" + word + Args.endpointAntonymes + "?" + Args.RESULT_LIMIT
            
            case GETType.EXPRESSION:
                self.url = Args.baseUrl + "/" + word + Args.endpointExpression + "?" + Args.RESULT_LIMIT
        }
    }
    var url:String
    
}

enum GETType{
    case SYNONYME, ANTONYME, DEFINITION, EXPRESSION
    
}
struct Word{
    init(word:String) {
        self.word = word
    }
    var word:String
}


public class FetchApi {
    
    var type:GETType
    var word: String
    var builder: UrlBuilder
    
    init(type:GETType, word:String) {
        self.type = type
        self.word = word
        self.builder = UrlBuilder(type:self.type, word:self.word);
    }
    
    private func getUrlRequest(url:URL) -> URLRequest{
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField:"content-type")
        urlRequest.setValue("dicolink.p.rapidapi.com", forHTTPHeaderField:"x-rapidapi-host")
        urlRequest.setValue("2ac8d4abe1msh45b7832cd81668ap195eefjsn339672521daf", forHTTPHeaderField:"x-rapidapi-key")
        return urlRequest
    }
    func fetchSynonymes(completion: @escaping ([Synonyme]) -> () ){
        
        guard let getUrl = URL(string: builder.url) else {return}

        URLSession.shared.dataTask(with: getUrlRequest(url:getUrl)){
            (data, response, error) in
            let synonymes = try! JSONDecoder().decode([Synonyme].self, from: data!)
            
            DispatchQueue.main.async {
                completion(synonymes)
            }
        }
    }
    
     func fetchAntonyme(completion: @escaping ([Antonyme]) -> () ){
        guard let getUrl = URL(string: builder.url) else {return}

        URLSession.shared.dataTask(with: getUrlRequest(url:getUrl)){
            (data, response, error) in
            let antonymes = try! JSONDecoder().decode([Antonyme].self, from: data!)
               
            DispatchQueue.main.async {
                completion(antonymes)
            }
        }
    }
    func fetchExpression(completion: @escaping ([Expression]) -> () ){
        guard let getUrl = URL(string: builder.url) else {return}

        URLSession.shared.dataTask(with: getUrlRequest(url:getUrl)){
            (data, response, error) in
            let expressions = try! JSONDecoder().decode([Expression].self, from: data!)
               
            DispatchQueue.main.async {
                completion(expressions)
            }
        }
    }
    func fetchDefinition(completion: @escaping ([Definition]) -> () ){
        guard let getUrl = URL(string: builder.url) else {return}

        URLSession.shared.dataTask(with: getUrlRequest(url:getUrl)){ (data, response, error) in
            guard let data = data else {return}
            let definitions = try! JSONDecoder().decode([Definition].self, from: data)
               
            DispatchQueue.main.async {
                completion(definitions)
            }
        }
    }
}
