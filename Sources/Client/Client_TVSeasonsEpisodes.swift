//
//  Client_Seasons.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-17.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation
extension Client{
  static func Seasons(_ urlType: String!, language: String?, append_to: [String]? = nil, completion: @escaping (ClientReturn) -> ()) -> (){
    var parameters: [String : AnyObject] = [:]
    if(language != nil){
      parameters["language"] = language as AnyObject?
    }
    
    if (append_to != nil) {
      parameters["append_to_response"] = append_to?.joined(separator: ",") as AnyObject?
    }
    
    let url = TMDBConfig.apiUrl + "/tv/" + urlType
    networkRequest(url: url, parameters: parameters, completion: {
      apiReturn in
      completion(apiReturn)
    })
  }
}
