//
// PostsAndInfractions.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


open class PostsAndInfractions: JSONEncodable {
    public var posts: [Post]?
    public var infractions: [Infraction]?

    public init() {}

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["posts"] = self.posts?.encodeToJSON()
        nillableDictionary["infractions"] = self.infractions?.encodeToJSON()
        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
