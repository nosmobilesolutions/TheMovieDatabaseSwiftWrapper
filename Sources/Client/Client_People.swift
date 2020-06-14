//
//  Client_People.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-08.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

extension Client{
  
  static func Person(_ urlType: String!, language: String?, page: Int?, append_to: [String]? = nil, completion: @escaping (ClientReturn) -> ()) -> (){
    let url = TMDBConfig.apiUrl + "/person/" + urlType
    var parameters: [String : AnyObject] = [:]
    if(language != nil){ parameters["language"] = language as AnyObject? }
    if(page != nil){parameters["page"] = page as AnyObject?}
   
    if (append_to != nil && append_to!.count > 0) {
      let appendTos = append_to?.joined(separator: ",")
      parameters["append_to_response"] =  String(appendTos!) as AnyObject?
    }
    
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      
      completion(apiReturn)
    })
  }
  
}
