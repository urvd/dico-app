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
    static var baseUrl = "https://dicolink.p.rapidapi.com/mot"
    static var endpointSynonymes = "/synonymes"
    static var endpointAntonymes = "/antonymes"
    static var endpointDefinition = "/definitions"
    static var endpointExpression = "/expressions"
    static var RESULT_LIMIT = "limite=12"
}

struct UrlBuilder{
    init(type:GETType, word:String) {
        switch (type) {
            case GETType.DEFINITION:
                self.url = "\(Args.baseUrl)/\(word)\(Args.endpointDefinition)"
            
            case GETType.SYNONYME:
                self.url = "\(Args.baseUrl)/\(word)\(Args.endpointSynonymes)?\(Args.RESULT_LIMIT)"
            
            case GETType.ANTONYME:
                self.url = "\(Args.baseUrl)/\(word)\(Args.endpointAntonymes)?\(Args.RESULT_LIMIT)"
            
            case GETType.EXPRESSION:
                self.url = "\(Args.baseUrl)/\(word)\(Args.endpointExpression)?\(Args.RESULT_LIMIT)"
        }
    }
    var url:String
    
}

public class FetchApi:IFetcher {
    
    var word: String
    init(word:String) {
        self.word = word
    }
    
    private func getUrlRequest(url:URL) -> URLRequest{
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField:"content-type")
        urlRequest.setValue("dicolink.p.rapidapi.com", forHTTPHeaderField:"x-rapidapi-host")
        urlRequest.setValue("2ac8d4abe1msh45b7832cd81668ap195eefjsn339672521daf", forHTTPHeaderField:"x-rapidapi-key")
        return urlRequest
    }

    internal func fetch<T:Decodable>(completion: @escaping(Result<[T],FetchERROR>) -> (),typop:GETType) {
        let builder = UrlBuilder(type:typop, word:self.word)
        guard let url = URL(string: builder.url) else {return}
        let req = getUrlRequest(url:url)
        URLSession.shared.dataTask(with: req) { (data, _, _) in
            guard let datas = data else {
                completion(.failure(.ANOTHER))
                return
            }
            do{
                let results = try JSONDecoder().decode([T].self, from: datas)
                completion(.success(results))
                print("dadas \(typop): " + datas.base64EncodedString())
            }catch{
                completion(.failure(.NO_RESULT))
            }
           
        }.resume()

    }
    func fetchSynonymes(completion: @escaping (Result<[Synonyme],FetchERROR>) -> (), typop:GETType){
        fetch(completion:completion, typop: typop)
    }
//
     func fetchAntonyme(completion: @escaping (Result<[Antonyme],FetchERROR>) -> (), typop:GETType){
        fetch(completion:completion, typop: typop)
    }
//
   func fetchExpression(completion: @escaping (Result<[Expression],FetchERROR>) -> (), typop:GETType){
        fetch(completion:completion, typop: typop)
    }
//
    func fetchDefinition(completion: @escaping (Result<[Definition],FetchERROR>) -> (), typop:GETType){
        fetch(completion:completion, typop: typop)
    }
}
