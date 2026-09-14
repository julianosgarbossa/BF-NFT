//
//  LatestDealTableViewCell.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 14/09/26.
//

import UIKit

class LatestDealTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: LatestDealTableViewCell.self)
    
    private lazy var screen: LatestDealTableViewCellScreen = {
        let screen = LatestDealTableViewCellScreen()
        screen.translatesAutoresizingMaskIntoConstraints = false
        return screen
    }()
    
    private let viewModel = LatestDealTableViewCellViewModel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addVisualElements()
        configProtocols()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configProtocols() {
        screen.configTableViewProtocols(delegate: self, dataSource: self)
    }
    
    private func addVisualElements() {
        selectionStyle = .none
        
        contentView.addSubview(screen)
        
        configConstraints()
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: contentView.topAnchor),
            screen.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func setupCell(nft: Nft) {
        viewModel.setNft(nft: nft)
        screen.titleLabel.text = viewModel.title
    }
}

extension LatestDealTableViewCell: UITableViewDelegate {
    
}

extension LatestDealTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListOffersTableViewCell.identifier, for: indexPath) as? ListOffersTableViewCell else { return UITableViewCell() }
        cell.setupCell(latestDeal: viewModel.loadCurrentLatestDeal(index: indexPath.row), isInicial: viewModel.isInicial(index: indexPath.row), isFinal: viewModel.isFinal(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }
}
