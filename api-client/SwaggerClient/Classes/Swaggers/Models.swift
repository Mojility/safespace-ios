// Models.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

protocol JSONEncodable {
    func encodeToJSON() -> Any
}

public enum ErrorResponse : Error {
    case Error(Int, Data?, Error)
}

open class Response<T> {
    open let statusCode: Int
    open let header: [String: String]
    open let body: T?

    public init(statusCode: Int, header: [String: String], body: T?) {
        self.statusCode = statusCode
        self.header = header
        self.body = body
    }

    public convenience init(response: HTTPURLResponse, body: T?) {
        let rawHeader = response.allHeaderFields
        var header = [String:String]()
        for (key, value) in rawHeader {
            header[key as! String] = value as? String
        }
        self.init(statusCode: response.statusCode, header: header, body: body)
    }
}

private var once = Int()
class Decoders {
    static fileprivate var decoders = Dictionary<String, ((AnyObject) -> AnyObject)>()

    static func addDecoder<T>(clazz: T.Type, decoder: @escaping ((AnyObject) -> T)) {
        let key = "\(T.self)"
        decoders[key] = { decoder($0) as AnyObject }
    }

    static func decode<T>(clazz: T.Type, discriminator: String, source: AnyObject) -> T {
        let key = discriminator;
        if let decoder = decoders[key] {
            return decoder(source) as! T
        } else {
            fatalError("Source \(source) is not convertible to type \(clazz): Maybe swagger file is insufficient")
        }
    }

    static func decode<T>(clazz: [T].Type, source: AnyObject) -> [T] {
        let array = source as! [AnyObject]
        return array.map { Decoders.decode(clazz: T.self, source: $0) }
    }

    static func decode<T, Key: Hashable>(clazz: [Key:T].Type, source: AnyObject) -> [Key:T] {
        let sourceDictionary = source as! [Key: AnyObject]
        var dictionary = [Key:T]()
        for (key, value) in sourceDictionary {
            dictionary[key] = Decoders.decode(clazz: T.self, source: value)
        }
        return dictionary
    }

    static func decode<T>(clazz: T.Type, source: AnyObject) -> T {
        initialize()
        if T.self is Int32.Type && source is NSNumber {
            return source.int32Value as! T;
        }
        if T.self is Int64.Type && source is NSNumber {
            return source.int64Value as! T;
        }
        if T.self is UUID.Type && source is String {
            return UUID(uuidString: source as! String) as! T
        }
        if source is T {
            return source as! T
        }
        if T.self is Data.Type && source is String {
            return Data(base64Encoded: source as! String) as! T
        }

        let key = "\(T.self)"
        if let decoder = decoders[key] {
           return decoder(source) as! T
        } else {
            fatalError("Source \(source) is not convertible to type \(clazz): Maybe swagger file is insufficient")
        }
    }

    static func decodeOptional<T>(clazz: T.Type, source: AnyObject?) -> T? {
        if source is NSNull {
            return nil
        }
        return source.map { (source: AnyObject) -> T in
            Decoders.decode(clazz: clazz, source: source)
        }
    }

    static func decodeOptional<T>(clazz: [T].Type, source: AnyObject?) -> [T]? {
        if source is NSNull {
            return nil
        }
        return source.map { (someSource: AnyObject) -> [T] in
            Decoders.decode(clazz: clazz, source: someSource)
        }
    }

    static func decodeOptional<T, Key: Hashable>(clazz: [Key:T].Type, source: AnyObject?) -> [Key:T]? {
        if source is NSNull {
            return nil
        }
        return source.map { (someSource: AnyObject) -> [Key:T] in
            Decoders.decode(clazz: clazz, source: someSource)
        }
    }

    private static var __once: () = {
        let formatters = [
            "yyyy-MM-dd",
            "yyyy-MM-dd'T'HH:mm:ssZZZZZ",
            "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ",
            "yyyy-MM-dd'T'HH:mm:ss'Z'",
            "yyyy-MM-dd'T'HH:mm:ss.SSS",
            "yyyy-MM-dd HH:mm:ss"
        ].map { (format: String) -> DateFormatter in
            let formatter = DateFormatter()
            formatter.dateFormat = format
            return formatter
        }
        // Decoder for Date
        Decoders.addDecoder(clazz: Date.self) { (source: AnyObject) -> Date in
           if let sourceString = source as? String {
                for formatter in formatters {
                    if let date = formatter.date(from: sourceString) {
                        return date
                    }
                }
            }
            if let sourceInt = source as? Int64 {
                // treat as a java date
                return Date(timeIntervalSince1970: Double(sourceInt / 1000) )
            }
            fatalError("formatter failed to parse \(source)")
        } 

        // Decoder for [Authorization]
        Decoders.addDecoder(clazz: [Authorization].self) { (source: AnyObject) -> [Authorization] in
            return Decoders.decode(clazz: [Authorization].self, source: source)
        }
        // Decoder for Authorization
        Decoders.addDecoder(clazz: Authorization.self) { (source: AnyObject) -> Authorization in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = Authorization()
            instance.token = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["token"] as AnyObject?)
            return instance
        }


        // Decoder for [Emote]
        Decoders.addDecoder(clazz: [Emote].self) { (source: AnyObject) -> [Emote] in
            return Decoders.decode(clazz: [Emote].self, source: source)
        }
        // Decoder for Emote
        Decoders.addDecoder(clazz: Emote.self) { (source: AnyObject) -> Emote in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = Emote()
            instance.id = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["id"] as AnyObject?)
            instance.label = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["label"] as AnyObject?)
            instance.code = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["code"] as AnyObject?)
            return instance
        }


        // Decoder for [EmoteTotals]
        Decoders.addDecoder(clazz: [EmoteTotals].self) { (source: AnyObject) -> [EmoteTotals] in
            return Decoders.decode(clazz: [EmoteTotals].self, source: source)
        }
        // Decoder for EmoteTotals
        Decoders.addDecoder(clazz: EmoteTotals.self) { (source: AnyObject) -> EmoteTotals in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = EmoteTotals()
            instance.id = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["id"] as AnyObject?)
            instance.quantity = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["quantity"] as AnyObject?)
            return instance
        }


        // Decoder for [Infraction]
        Decoders.addDecoder(clazz: [Infraction].self) { (source: AnyObject) -> [Infraction] in
            return Decoders.decode(clazz: [Infraction].self, source: source)
        }
        // Decoder for Infraction
        Decoders.addDecoder(clazz: Infraction.self) { (source: AnyObject) -> Infraction in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = Infraction()
            instance.id = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["id"] as AnyObject?)
            instance.label = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["label"] as AnyObject?)
            return instance
        }


        // Decoder for [InfractionTotals]
        Decoders.addDecoder(clazz: [InfractionTotals].self) { (source: AnyObject) -> [InfractionTotals] in
            return Decoders.decode(clazz: [InfractionTotals].self, source: source)
        }
        // Decoder for InfractionTotals
        Decoders.addDecoder(clazz: InfractionTotals.self) { (source: AnyObject) -> InfractionTotals in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = InfractionTotals()
            instance.id = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["id"] as AnyObject?)
            instance.quantity = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["quantity"] as AnyObject?)
            return instance
        }


        // Decoder for [Post]
        Decoders.addDecoder(clazz: [Post].self) { (source: AnyObject) -> [Post] in
            return Decoders.decode(clazz: [Post].self, source: source)
        }
        // Decoder for Post
        Decoders.addDecoder(clazz: Post.self) { (source: AnyObject) -> Post in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = Post()
            instance.id = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["id"] as AnyObject?)
            instance.body = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["body"] as AnyObject?)
            instance.handle = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["handle"] as AnyObject?)
            instance.emotes = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["emotes"] as AnyObject?)
            instance.infractions = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["infractions"] as AnyObject?)
            return instance
        }


        // Decoder for [PostsAndInfractions]
        Decoders.addDecoder(clazz: [PostsAndInfractions].self) { (source: AnyObject) -> [PostsAndInfractions] in
            return Decoders.decode(clazz: [PostsAndInfractions].self, source: source)
        }
        // Decoder for PostsAndInfractions
        Decoders.addDecoder(clazz: PostsAndInfractions.self) { (source: AnyObject) -> PostsAndInfractions in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = PostsAndInfractions()
            instance.posts = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["posts"] as AnyObject?)
            instance.infractions = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["infractions"] as AnyObject?)
            return instance
        }


        // Decoder for [Room]
        Decoders.addDecoder(clazz: [Room].self) { (source: AnyObject) -> [Room] in
            return Decoders.decode(clazz: [Room].self, source: source)
        }
        // Decoder for Room
        Decoders.addDecoder(clazz: Room.self) { (source: AnyObject) -> Room in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = Room()
            instance.id = Decoders.decodeOptional(clazz: Int32.self, source: sourceDictionary["id"] as AnyObject?)
            instance.name = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["name"] as AnyObject?)
            return instance
        }


        // Decoder for [RoomsAndEmotes]
        Decoders.addDecoder(clazz: [RoomsAndEmotes].self) { (source: AnyObject) -> [RoomsAndEmotes] in
            return Decoders.decode(clazz: [RoomsAndEmotes].self, source: source)
        }
        // Decoder for RoomsAndEmotes
        Decoders.addDecoder(clazz: RoomsAndEmotes.self) { (source: AnyObject) -> RoomsAndEmotes in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = RoomsAndEmotes()
            instance.rooms = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["rooms"] as AnyObject?)
            instance.emotes = Decoders.decodeOptional(clazz: Array.self, source: sourceDictionary["emotes"] as AnyObject?)
            return instance
        }


        // Decoder for [ValidateResponse]
        Decoders.addDecoder(clazz: [ValidateResponse].self) { (source: AnyObject) -> [ValidateResponse] in
            return Decoders.decode(clazz: [ValidateResponse].self, source: source)
        }
        // Decoder for ValidateResponse
        Decoders.addDecoder(clazz: ValidateResponse.self) { (source: AnyObject) -> ValidateResponse in
            let sourceDictionary = source as! [AnyHashable: Any]

            let instance = ValidateResponse()
            instance.personExists = Decoders.decodeOptional(clazz: Bool.self, source: sourceDictionary["person_exists"] as AnyObject?)
            instance.authToken = Decoders.decodeOptional(clazz: String.self, source: sourceDictionary["auth_token"] as AnyObject?)
            return instance
        }
    }()

    static fileprivate func initialize() {
        _ = Decoders.__once
    }
}
