//
//  TVDetailedMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-15.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation


public struct tv_created_By{
  public var id: Int!
  public var name: String!
  public var profile_path: String?
  public var credit_id: String?
}

public struct tv_seasons{
  public var air_date: String?
  public var episode_count: Int!
  public var id: Int!
  public var poster_path: String!
  public var season_number: Int!
  
  init(results: JSON){
    if(results["air_date"].exists()){
      air_date = results["air_date"].string
    }else{
      air_date = "";
    }
    episode_count = results["episode_count"].int
    id = results["id"].int
    
    if(results["poster_path"].exists()){
      poster_path = results["poster_path"].string
    }else{
      poster_path = "";
    }
    season_number = results["season_number"].int
  }
  
}

open class TVDetailedMDB: TVMDB{
  open var createdBy: tv_created_By?
  open var episode_run_time: [Int]!
  open var homepage: String?
  open var in_production: Bool?
  open var languages: [String]?
  open var last_air_date: String!
  open var networks = [NetworksMDB]()
  open var keywords = [KeywordsMDB]()
  open var number_of_episodes: Int!
  open var number_of_seasons: Int!
  open var production_companies = [KeywordsMDB]()
  open var seasons = [tv_seasons]()
  open var status: String!
  open var type: String!
  open var nextEpisodeToAir: TVEpisodesMDB?
  open var lastEpisodeToAir: TVEpisodesMDB?
  open var contentRating = [Content_RatingsMDB]()
  open var credits: TVCreditsMDB?;
  open var externalIds: ExternalIdsMDB?;
  open var images: ImagesMDB?;
  open var recommendations : PaginationResult<TVMDB>?;
  open var reviews : PaginationResult<ReviewsMDB>?;
  open var similar : PaginationResult<TVMDB>?;
  open var translations = [TvTranslationMDB]();
  open var videos = [VideosMDB]();
  

  required public init(results: JSON) {
    super.init(results: results)
    if(results["created_by"].count > 0 && results["created_by"][0].exists()){
      createdBy = tv_created_By.init(id: results["created_by"][0]["id"].int, name: results["created_by"][0]["name"].string, profile_path: results["created_by"][0]["profile_path"].string, credit_id: results["created_by"][0]["credit_id"].string)
    }
    
    episode_run_time = results["episode_run_time"].arrayObject as? [Int]
    //        genres = KeywordsMDB.init(results: results["genres"])
    homepage = results["homepage"].string
    in_production = results["in_production"].bool
    languages = results["languages"].arrayObject as? [String]
    
    if(results["last_air_date"].exists()){
      last_air_date = results["last_air_date"].string
    }else{
      last_air_date = ""
    }
    
    if(results["content_ratings"].exists() && results["content_ratings"]["results"].exists()){
      self.contentRating = Content_RatingsMDB.initialize(json: results["content_ratings"]["results"])
    }
    
    if(results["credits"].exists()){
      credits = TVCreditsMDB.init(results: results["credits"])
    }
    
    if(results["external_ids"].exists()){
      externalIds = ExternalIdsMDB.init(results: results["external_ids"])
    }
    
    if(results["images"].exists()){
      images = ImagesMDB.init(results: results["images"])
    }
    
    if(results["networks"].exists()){
      networks = NetworksMDB.initialize(json: results["networks"]);
    }
    
    if(results["keywords"].exists() && results["keywords"]["results"].exists()){
      keywords = KeywordsMDB.initialize(json: results["keywords"]["results"])
    }
    
    if(results["recommendations"].exists()){
      recommendations = PaginationResult<TVMDB>.init(results: results["recommendations"]);
    }
    
    if(results["reviews"].exists()){
      reviews = PaginationResult<ReviewsMDB>.init(results: results["reviews"]);
    }
    
    if(results["similar"].exists()){
      similar = PaginationResult<TVMDB>.init(results: results["similar"]);
    }
    
    if(results["translations"].exists() && results["translations"]["translations"].exists()){
      translations = TvTranslationMDB.initialize(json: results["translations"]["translations"])
    }
    
    if(results["videos"].exists() && results["videos"]["results"].exists()){
      videos = VideosMDB.initialize(json: results["videos"]["results"])
    }

    number_of_episodes = results["number_of_episodes"].int
    number_of_seasons = results["number_of_seasons"].int
    
    if(results["production_companies"].exists()){
      production_companies = KeywordsMDB.initialize(json: results["production_companies"]);
    }
    
    seasons = results["seasons"].map{
      tv_seasons.init(results: $0.1)
    }
    
    status = results["status"].string
    type = results["type"].string
    
    if results["last_episode_to_air"].count > 0 {
        lastEpisodeToAir = TVEpisodesMDB.init(results: results["last_episode_to_air"])
    }

    if results["next_episode_to_air"].count > 0 {
        nextEpisodeToAir = TVEpisodesMDB.init(results: results["next_episode_to_air"])
    }
  }
  
}
