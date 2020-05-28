import Foundation

extension Client{

  static func trending(baseURL: String, page: Int?, language: String?, completion: @escaping (ClientReturn) -> ()) -> (){

    let url = TMDBConfig.apiUrl + "/trending/" + baseURL
    
    var parameters: [String : AnyObject] = [:]
    if(page != nil){
      parameters["page"] = page as AnyObject?
    }
    if(language != nil){
      parameters["language"] = language as AnyObject?
    }
    
    networkRequest(url: url, parameters: parameters){
      apiReturn in
      if(apiReturn.error == nil){
        completion(apiReturn)
      }
    }
  }

}

