//
//  Client_Movies.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-16.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation
extension Client{
  
  static func Movies(_ urlType: String!, page: Int?, language: String?, region: String? = nil, append_to: [String]? = nil, completion: @escaping (ClientReturn) -> ()) -> (){
    
    var parameters: [String : AnyObject] = [:]
    
    if let pg = page{
      parameters["page"] = pg as AnyObject?
    }
    
    if(language != nil){
      parameters["language"] = language as AnyObject?
    }
    
    //TODO: --Alternative titles (lazy change later)
    if(urlType.contains("alternative_titles")){
      if(language != nil){
        parameters["country"] = language as AnyObject?
      }
    }
    
    
    if let reg = region{
      parameters["region"] = reg as AnyObject
    }
    
    if (append_to != nil && append_to!.count > 0) {
      let appendTos = (append_to?.joined(separator: ","))!
      parameters["append_to_response"] =  String(appendTos) as AnyObject?
    }
    
    
    let url = TMDBConfig.apiUrl + "/movie/" + urlType
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      completion(apiReturn)
    })
  }
  
  
}
