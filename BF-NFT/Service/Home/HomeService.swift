//
//  HomeService.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 11/09/26.
//

import Foundation
import Alamofire

protocol HomeServiceProtocol: GenericService {
    func getHomeFromJson(completion: @escaping completion<NFTData?>)
    func getHomeFromAlamofire(completion: @escaping completion<NFTData?>)
}

class HomeService: HomeServiceProtocol {
    func getHomeFromJson(completion: @escaping completion<NFTData?>) {
        if let url = Bundle.main.url(forResource: "HomeData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let nftData: NFTData = try JSONDecoder().decode(NFTData.self, from: data)
                completion(nftData, nil)
            } catch {
                completion(nil, CustomError.fileDecoddingFailed(name: "HomeData", error: error))
            }
        } else {
            completion(nil, CustomError.fileNotFound(name: "HomeData"))
        }
    }
    
    func getHomeFromAlamofire(completion: @escaping completion<NFTData?>) {
        let url: String = "https://gist.githubusercontent.com/julianosgarbossa/8b314c02f34478b8a5112c85460dee31/raw/acfcae9465fefc927aa80dec0faffad81feaf15e/nftData.json"
        
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: NFTData.self) { response in
            switch response.result {
            case .success(let nftData):
                completion(nftData, nil)
            case .failure(let error):
                completion(nil, CustomError.errorRequest(error: error))
            }
        }
    }
}
