//
//  TranslationsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-07.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct TranslationsMDB: ArrayObject{
  
  public var iso_639_1: String!
  public var iso_3166_1: String!
  public var name: String!
  public var english_name: String!
  
  public init(results: JSON){
    iso_639_1 = results["iso_639_1"].string
    iso_3166_1 = results["iso_3166_1"].string
    name = results["name"].string
    english_name = results["english_name"].string
  }
}

public struct PersonTranslationMDB: ArrayObject{
  
  public var iso_639_1: String!
  public var iso_3166_1: String!
  public var name: String!
  public var english_name: String!
  public var biography: String!;
  
  public init(results: JSON){
    iso_639_1 = results["iso_639_1"].string
    iso_3166_1 = results["iso_3166_1"].string
    name = results["name"].string
    english_name = results["english_name"].string
    biography = results["data"] != nil && results["data"]["biography"] != nil ? results["data"]["biography"].string : "";
  }
}
