//
// InvitationAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Alamofire



open class InvitationAPI: APIBase {
    /**
     Join room
     
     - parameter token: (form) The invitation token 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func authJoinPost(token: String, completion: @escaping ((_ data: Authorization?,_ error: Error?) -> Void)) {
        authJoinPostWithRequestBuilder(token: token).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     Join room
     - POST /auth/join
     - Join an existing user to a room
     - examples: [{contentType=application/json, example={
  "token" : "aeiou"
}}]
     
     - parameter token: (form) The invitation token 

     - returns: RequestBuilder<Authorization> 
     */
    open class func authJoinPostWithRequestBuilder(token: String) -> RequestBuilder<Authorization> {
        let path = "/auth/join"
        let URLString = SwaggerClientAPI.basePath + path
        let formParams: [String:Any?] = [
            "token": token
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Authorization>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     New user setup
     
     - parameter token: (form) The invitation token 
     - parameter handle: (form) The handle for the new user 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func authSetupPost(token: String, handle: String, completion: @escaping ((_ data: Authorization?,_ error: Error?) -> Void)) {
        authSetupPostWithRequestBuilder(token: token, handle: handle).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     New user setup
     - POST /auth/setup
     - Create a new user from the invitation with the provided handle.
     - examples: [{contentType=application/json, example={
  "token" : "aeiou"
}}]
     
     - parameter token: (form) The invitation token 
     - parameter handle: (form) The handle for the new user 

     - returns: RequestBuilder<Authorization> 
     */
    open class func authSetupPostWithRequestBuilder(token: String, handle: String) -> RequestBuilder<Authorization> {
        let path = "/auth/setup"
        let URLString = SwaggerClientAPI.basePath + path
        let formParams: [String:Any?] = [
            "token": token,
            "handle": handle
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<Authorization>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

    /**
     Validate an invitation token
     
     - parameter token: (form) The invitation token 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func authValidatePost(token: String, completion: @escaping ((_ data: ValidateResponse?,_ error: Error?) -> Void)) {
        authValidatePostWithRequestBuilder(token: token).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     Validate an invitation token
     - POST /auth/validate
     - Validates an invitation token and returns whether the user exists or not
     - examples: [{contentType=application/json, example={
  "person_exists" : true,
  "auth_token" : "aeiou"
}}]
     
     - parameter token: (form) The invitation token 

     - returns: RequestBuilder<ValidateResponse> 
     */
    open class func authValidatePostWithRequestBuilder(token: String) -> RequestBuilder<ValidateResponse> {
        let path = "/auth/validate"
        let URLString = SwaggerClientAPI.basePath + path
        let formParams: [String:Any?] = [
            "token": token
        ]

        let nonNullParameters = APIHelper.rejectNil(formParams)
        let parameters = APIHelper.convertBoolToString(nonNullParameters)

        let url = NSURLComponents(string: URLString)


        let requestBuilder: RequestBuilder<ValidateResponse>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
