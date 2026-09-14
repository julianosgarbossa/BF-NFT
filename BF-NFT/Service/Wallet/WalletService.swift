//
//  WalletService.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 14/09/26.
//

import Foundation
import Alamofire

protocol WalletServiceProtocol: GenericService {
    func getWalletFromJson(completion: @escaping completion<WalletData?>)
    func getWalletFromAlamofire(completion: @escaping completion<WalletData?>)
}

class WalletService: WalletServiceProtocol {
    func getWalletFromJson(completion: @escaping completion<WalletData?>) {
        if let url = Bundle.main.url(forResource: "WalletData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let walletData: WalletData = try JSONDecoder().decode(WalletData.self, from: data)
                completion(walletData, nil)
            } catch {
                completion(nil, CustomError.fileDecoddingFailed(name: "WalletData", error: error))
            }
        } else {
            completion(nil, CustomError.fileNotFound(name: "WalletData"))
        }
    }
    
    func getWalletFromAlamofire(completion: @escaping completion<WalletData?>) {
        let url: String = "https://gist.githubusercontent.com/julianosgarbossa/5bed957e229f415a40b4a194d58d063e/raw/ac88f6df23c81c58e20a039710c95f413b6167fa/walletData.json"
        
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: WalletData.self) { response in
            switch response.result {
            case .success(let walletData):
                completion(walletData, nil)
            case .failure(let error):
                completion(nil, CustomError.errorRequest(error: error))
            }
        }
    }
}
