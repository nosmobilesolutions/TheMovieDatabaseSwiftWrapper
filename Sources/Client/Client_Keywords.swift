//
//  Client_Keyword.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-12.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

extension Client{
  static func keyword(_ keywordId: Int, completion: @escaping (ClientReturn) -> ()) -> (){
    let parameters: [String : AnyObject] = [:]
    let url = TMDBConfig.apiUrl + "/keyword/" + String(keywordId)
    
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      completion(apiReturn)
    })
  }
  
  static func keyword_movies(_ keywordId: Int, page: Int?, language: String?, completion: @escaping (ClientReturn) -> ()) -> (){
    var parameters: [String : AnyObject] = [:]
    if(page != nil){
      parameters["page"] = page as AnyObject?
    }
    if(language != nil){
      parameters["language"] = language as AnyObject?
    }
    
    let url = TMDBConfig.apiUrl + "/keyword/" + String(keywordId)
    
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      
      completion(apiReturn)
    })
  }
  
  
  
}
