//
//  GenericService.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 11/09/26.
//

import Foundation
import Alamofire

enum CustomError: Error {
    case fileNotFound(name: String)
    case fileDecoddingFailed(name: String, error: Error)
    case errorRequest(error: AFError)
}

enum TypeFetch {
    case mock
    case alamofire
}

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T,_ failure: CustomError?) -> Void
}
