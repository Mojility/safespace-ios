//
// InfractionTotals.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


open class InfractionTotals: JSONEncodable {
    public var id: Int32?
    public var quantity: Int32?

    public init() {}

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["id"] = self.id?.encodeToJSON()
        nillableDictionary["quantity"] = self.quantity?.encodeToJSON()
        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
