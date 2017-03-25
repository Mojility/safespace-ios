//
// InitializationAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Alamofire



open class InitializationAPI: APIBase {
    /**
     Retrieve full metadata
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func metadataPost(completion: @escaping ((_ data: RoomsAndEmotes?,_ error: Error?) -> Void)) {
        metadataPostWithRequestBuilder().execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     Retrieve full metadata
     - POST /metadata
     - Retrieve all required metadata for a successful app launch
     - examples: [{contentType=application/json, example={
  "rooms" : [ {
    "name" : "aeiou",
    "id" : 123
  } ],
  "emotes" : [ {
    "code" : "aeiou",
    "id" : 123,
    "label" : "aeiou"
  } ]
}}]

     - returns: RequestBuilder<RoomsAndEmotes> 
     */
    open class func metadataPostWithRequestBuilder() -> RequestBuilder<RoomsAndEmotes> {
        let path = "/metadata"
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<RoomsAndEmotes>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
