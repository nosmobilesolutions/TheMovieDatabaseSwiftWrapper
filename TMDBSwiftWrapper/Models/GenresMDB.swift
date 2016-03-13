//
//  GenresMDB.swift
//  MDBSwiftWrapper
//
//  Created by George on 2016-02-12.
//  Copyright © 2016 GeorgeKye. All rights reserved.
//

import Foundation
import SwiftyJSON

class GenresMDB: KeywordsMDB{
    
    
    override init(results: JSON){
        super.init(results: results)
    }
    
    class func initialize(json: JSON)->[GenresMDB] {
        var genres = [GenresMDB]()
        for(var i = 0; i < json.count; i++){
            genres.append(GenresMDB(results: json[i]))
        }
        return genres
    }
    
    
    ///Get the list of tv or movie genres.
    class func genres(api_key: String!, listType: String, language: String?, completion: (clientReturn: ClientReturn, data: [GenresMDB]?) -> ()) -> (){
        Client.Genres(apikey, listType: listType, language: language, genreId: 0, page: nil, include_all_movies: nil, include_adult: nil, movieList: false){
            apiReturn in
            if(apiReturn.error == nil){
                completion(clientReturn: apiReturn, data: GenresMDB.initialize(apiReturn.json!["genres"]))
            }else{
                completion(clientReturn: apiReturn, data: nil)
            }
        }
    }
    
    ///Get the list of movies for a particular genre by id. By default, only movies with 10 or more votes are included.
    class func genre_movies(api_key: String!, genreId: Int, include_all_movies: Bool, include_adult_movies: Bool, language: String?, completion: (clientReturn: ClientReturn, data: [MovieMDB]?) -> ()) -> (){
        Client.Genres(apikey, listType: "movies", language: language, genreId: genreId, page: nil, include_all_movies: true, include_adult: nil, movieList: true){
            apiReturn in
            if(apiReturn.error == nil){
                completion(clientReturn: apiReturn, data: MovieMDB.initialize(apiReturn.json!["results"]))
            }else{
                completion(clientReturn: apiReturn, data: nil)
            }
        }
    }
    
}