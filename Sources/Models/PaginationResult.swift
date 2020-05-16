//
//  PaginationResult.swift
//  TMDBSwift-iOS
//
//  Created by Leonardo Savio Terrazzino on 16/05/2020.
//  Copyright © 2020 George. All rights reserved.
//

import Foundation

public class PaginationResult<T:ArrayObject>{
  var page: Int?;
  var results: [T]?;
  var totalPages: Int?;
  var totalResults: Int?;
  
  init(results: JSON) {
    self.page = results["page"].int
    if(results["results"].exists()){
      self.results = results["results"].map({ r -> T in
        return T.init(results: r.1);
      })
    }
    self.totalPages = results["total_pages"].int
    self.totalResults = results["total_results"].int
  }
  
}
