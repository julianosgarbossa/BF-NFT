//
//  LatestDealTableViewCellViewModel.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 14/09/26.
//

import Foundation

enum HeightLatestDeal: CGFloat {
    case height = 70
}

final class LatestDealTableViewCellViewModel {
    private var nft: Nft?
    
    var title: String {
        return nft?.titleLatestDeals ?? ""
    }
    
    var numberOfRowsInSection: Int {
        return nft?.latestDeals.count ?? 0
    }
    
    var heightForRowAt: CGFloat {
        return HeightLatestDeal.height.rawValue
    }
    
    func setNft(nft: Nft) {
        self.nft = nft
    }
    
    func loadCurrentLatestDeal(index: Int) -> LatestDeal {
        return nft?.latestDeals[index] ?? LatestDeal(userName: "Clara G. Natal", userImage: "https://i.im.ge/2022/12/19/dGXr9C.user03.png", nftPrice: 0.8, lastAccess: "5h atrás")
    }
    
    func isInicial(index: Int) -> Bool {
        return index == 0
    }
    
    func isFinal(index: Int) -> Bool {
        return index == numberOfRowsInSection - 1
    }
}
