//
//  TranslationsMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-03-07.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public class TranslationsMDB: ArrayObject{
  
  public var iso_639_1: String!
  public var iso_3166_1: String!
  public var name: String!
  public var english_name: String!
  
  required public init(results: JSON){
    iso_639_1 = results["iso_639_1"].string
    iso_3166_1 = results["iso_3166_1"].string
    name = results["name"].string
    english_name = results["english_name"].string
  }
}

public class PersonTranslationMDB: TranslationsMDB{
  
  public var biography: String!;
  
  public required init(results: JSON){
    super.init(results: results);
    biography = results["data"] != nil && results["data"]["biography"] != nil ? results["data"]["biography"].string : "";
  }
}

public class TvTranslationMDB: TranslationsMDB{
  
  public var tvName: String!
  public var tvOverview: String!
  public var tvHomepage: String!
  public var tvTagline: String!
  
  public required init(results: JSON){
    super.init(results: results);
    tvName = results["data"] != nil && results["data"]["name"] != nil ? results["data"]["name"].string : "";
    tvOverview = results["data"] != nil && results["data"]["overview"] != nil ? results["data"]["overview"].string : "";
    tvHomepage = results["data"] != nil && results["data"]["homepage"] != nil ? results["data"]["homepage"].string : "";
    tvTagline = results["data"] != nil && results["data"]["tagline"] != nil ? results["data"]["tagline"].string : "";
  }
}
