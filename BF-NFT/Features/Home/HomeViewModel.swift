//
//  HomeViewModel.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 11/09/26.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func success()
    func failure(failure: String)
}

final class HomeViewModel {
    
    private weak var delegate: HomeViewModelDelegate?
    
    func delegate(delegate: HomeViewModelDelegate) {
        self.delegate = delegate
    }
    
    private let service: HomeService = HomeService()
    private var nftData: NFTData?
    private var searchNftData: NFTData?
    
    func fetchRequest(typeFetch: TypeFetch) {
        switch typeFetch {
        case .mock:
            service.getHomeFromJson { [weak self] result, failure in
                guard let self else { return }
                if let result {
                    self.nftData = result
                    self.searchNftData = result
                    self.delegate?.success()
                } else {
                    self.delegate?.failure(failure: failure?.localizedDescription ?? "")
                }
            }
        case .alamofire:
            service.getHomeFromAlamofire { [weak self] result, failure in
                guard let self else { return }
                if let result {
                    self.nftData = result
                    self.searchNftData = result
                    self.delegate?.success()
                } else {
                    self.delegate?.failure(failure: failure?.localizedDescription ?? "")
                }
            }
        }
    }
    
    // MARK: - NftFilterCollectionView
    var numberOfItemsInSection: Int {
        return searchNftData?.filterListNft.count ?? 0
    }
    
    var sizeForItemAt: CGSize {
        return CGSize(width: 100, height: 34)
    }
    
    func loadCurrentFilterNft(index: Int) -> FilterNft {
        return searchNftData?.filterListNft[index] ?? FilterNft(title: "Todos", id: 0, isSelected: true)
    }
    
    // MARK: - NftTableView
    var numberOfRowsInSection: Int {
        return searchNftData?.nftList.count ?? 0
    }
    
    var heightForRowAt: CGFloat {
        return 360
    }
    
    func loadCurrentNft(index: Int) -> Nft {
        return searchNftData?.nftList[index] ?? Nft(ownedBy: "Propriedade de:", price: "Preço", type: 2, nftImage: "https://i.im.ge/2022/12/07/SzmW0K.nft1.png", userName: "Mason Yates", userImage: "https://i.im.ge/2022/12/19/dGXlu4.user01.png", nftPrice: 1.4, nftID: 2345, nftNameImage: "Cubo Mágico", nftDescription: "Jogo tridimensional composto por faces de cores diferentes.", titleLatestDeals: "Últimas Ofertas", latestDeals: [LatestDeal(userName: "Thomas D. Harrington", userImage: "https://i.im.ge/2022/12/19/dGXuRq.user02.png", nftPrice: 2.4, lastAccess: "2h atrás")])
    }
    
    // MARK: - SearchBar
    var typeFilter: Int? {
        return searchNftData?.filterListNft.first(where: {$0.isSelected == true})?.id
    }
    
    func filterSearchText(text: String) {
        var nftList: [Nft] = []
        
        // Type 0 é igual a todos
        if typeFilter == 0 {
            nftList = nftData?.nftList ?? []
        } else {
            nftList = nftData?.nftList.filter({ $0.type == typeFilter}) ?? []
        }
        
        let text = text.trimmingCharacters(in: .whitespacesAndNewlines)
        if !text.isEmpty {
            searchNftData?.nftList = nftList.filter({ nft in
                return nft.userName.lowercased().contains(text.lowercased())
            })
        } else {
            searchNftData?.nftList = nftList
        }
    }
    
    // MARK: - CollectionFilter
    func setFilter(indexPath: Int, searchText: String) {
        var filterNft: [FilterNft] = []
        
        for (index, value) in (searchNftData?.filterListNft ?? []).enumerated() {
            var type = value
            if index == indexPath {
                type.isSelected = true
            } else {
                type.isSelected = false
            }
            filterNft.append(type)
        }
        searchNftData?.filterListNft = filterNft
        filterSearchText(text: searchText)
    }
}
