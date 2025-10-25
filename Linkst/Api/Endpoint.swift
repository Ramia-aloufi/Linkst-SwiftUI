//
//  Endpoint.swift
//  Linkst
//
//  Created by ramia n on 22/03/1447 AH.
//
import Foundation

protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [Header] { get }
    var body: RequestBody? { get }
    var queryItems: [URLQueryItem]? { get }

}

enum RequestBody {
    case encodable(Encodable)
    case raw(Data)
}
