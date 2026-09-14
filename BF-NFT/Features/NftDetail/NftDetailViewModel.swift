//
//  NftDetailViewModel.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 14/09/26.
//

import Foundation

final class NftDetailViewModel {
    private let nft: Nft
    
    init(nft: Nft) {
        self.nft = nft
    }
    
    var numberOfRowsInSection: Int {
        return 3
    }
    
    var nftImage: String {
        return nft.nftImage
    }
    
    var nftId: Int {
        return nft.nftID
    }
    
    var nftTitle: String {
        return nft.nftNameImage
    }
    
    var nftDescription: String {
        return nft.nftDescription
    }
    
    var getNft: Nft {
        return nft
    }
}
