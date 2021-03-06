//
// InfractionAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Alamofire



open class InfractionAPI: APIBase {
    /**
     Rate an infraction
     
     - parameter roomId: (path) The room id containing the infraction 
     - parameter infractionId: (path) The infraction id to be rated 
     - parameter rating: (form) The rating to apply to the infraction 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func roomRoomIdInfractionInfractionIdRatePost(roomId: Int32, infractionId: Int32, rating: Int32, completion: @escaping ((_ error: Error?) -> Void)) {
        roomRoomIdInfractionInfractionIdRatePostWithRequestBuilder(roomId: roomId, infractionId: infractionId, rating: rating).execute { (response, error) -> Void in
            completion(error);
        }
    }


    /**
     Rate an infraction
     - POST /room/{roomId}/infraction/{infractionId}/rate
     - Apply a rating to an infraction
     
     - parameter roomId: (path) The room id containing the infraction 
     - parameter infractionId: (path) The infraction id to be rated 
     - parameter rating: (form) The rating to apply to the infraction 

     - returns: RequestBuilder<Void> 
     */
    open class func roomRoomIdInfractionInfractionIdRatePostWithRequestBuilder(roomId: Int32, infractionId: Int32, rating: Int32) -> RequestBuilder<Void> {
        var path = "/room/{roomId}/infraction/{infractionId}/rate"
        path = path.replacingOccurrences(of: "{roomId}", with: "\(roomId)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{infractionId}", with: "\(infractionId)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let formParams: [String:Any?] = [
            "rating": rating.encodeToJSON()
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Register a new infraction
     
     - parameter roomId: (path) The room id for the infraction 
     - parameter label: (form) The label of the new infraction 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func roomRoomIdInfractionPost(roomId: Int32, label: String, completion: @escaping ((_ error: Error?) -> Void)) {
        roomRoomIdInfractionPostWithRequestBuilder(roomId: roomId, label: label).execute { (response, error) -> Void in
            completion(error);
        }
    }


    /**
     Register a new infraction
     - POST /room/{roomId}/infraction
     - Registers a new type of infraction in the room specified
     
     - parameter roomId: (path) The room id for the infraction 
     - parameter label: (form) The label of the new infraction 

     - returns: RequestBuilder<Void> 
     */
    open class func roomRoomIdInfractionPostWithRequestBuilder(roomId: Int32, label: String) -> RequestBuilder<Void> {
        var path = "/room/{roomId}/infraction"
        path = path.replacingOccurrences(of: "{roomId}", with: "\(roomId)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let formParams: [String:Any?] = [
            "label": label
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Remove infraction
     
     - parameter roomId: (path) The room id containing the post 
     - parameter postId: (path) The post id from which the infraction will be removed 
     - parameter infractionId: (path) The id of the infraction being removed 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func roomRoomIdPostPostIdInfractionInfractionIdDelete(roomId: Int32, postId: Int32, infractionId: Int32, completion: @escaping ((_ error: Error?) -> Void)) {
        roomRoomIdPostPostIdInfractionInfractionIdDeleteWithRequestBuilder(roomId: roomId, postId: postId, infractionId: infractionId).execute { (response, error) -> Void in
            completion(error);
        }
    }


    /**
     Remove infraction
     - DELETE /room/{roomId}/post/{postId}/infraction/{infractionId}
     - Remove a previously posted infraction from a message in a room
     
     - parameter roomId: (path) The room id containing the post 
     - parameter postId: (path) The post id from which the infraction will be removed 
     - parameter infractionId: (path) The id of the infraction being removed 

     - returns: RequestBuilder<Void> 
     */
    open class func roomRoomIdPostPostIdInfractionInfractionIdDeleteWithRequestBuilder(roomId: Int32, postId: Int32, infractionId: Int32) -> RequestBuilder<Void> {
        var path = "/room/{roomId}/post/{postId}/infraction/{infractionId}"
        path = path.replacingOccurrences(of: "{roomId}", with: "\(roomId)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{postId}", with: "\(postId)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{infractionId}", with: "\(infractionId)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "DELETE", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Post infraction
     
     - parameter roomId: (path) The room id containing the post 
     - parameter postId: (path) The post id on which the emote will be removed 
     - parameter infractionId: (form) The infraction id being applied 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func roomRoomIdPostPostIdInfractionPost(roomId: Int32, postId: Int32, infractionId: Int32, completion: @escaping ((_ error: Error?) -> Void)) {
        roomRoomIdPostPostIdInfractionPostWithRequestBuilder(roomId: roomId, postId: postId, infractionId: infractionId).execute { (response, error) -> Void in
            completion(error);
        }
    }


    /**
     Post infraction
     - POST /room/{roomId}/post/{postId}/infraction
     - Post a new infraction to a message in a room
     
     - parameter roomId: (path) The room id containing the post 
     - parameter postId: (path) The post id on which the emote will be removed 
     - parameter infractionId: (form) The infraction id being applied 

     - returns: RequestBuilder<Void> 
     */
    open class func roomRoomIdPostPostIdInfractionPostWithRequestBuilder(roomId: Int32, postId: Int32, infractionId: Int32) -> RequestBuilder<Void> {
        var path = "/room/{roomId}/post/{postId}/infraction"
        path = path.replacingOccurrences(of: "{roomId}", with: "\(roomId)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{postId}", with: "\(postId)", options: .literal, range: nil)
        let URLString = SwaggerClientAPI.basePath + path
        let formParams: [String:Any?] = [
            "infraction_id": infractionId.encodeToJSON()
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Void>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
