import Foundation

extension Client{

  static func trending(baseURL: String, completion: @escaping (ClientReturn) -> ()) -> (){

    let url = TMDBConfig.apiUrl + "/trending/" + baseURL
    networkRequest(url: url, parameters: [:]){
      apiReturn in
      if(apiReturn.error == nil){
        completion(apiReturn)
      }
    }
  }

}

