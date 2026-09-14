//
//  LatestTransactionTableViewCell.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 14/09/26.
//

import UIKit

class LatestTransactionTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: LatestTransactionTableViewCell.self)
    
    private lazy var screen: LatestTransactionTableViewCellScreen = {
        let screen = LatestTransactionTableViewCellScreen()
        screen.translatesAutoresizingMaskIntoConstraints = false
        return screen
    }()
    
    private let viewModel: LatestTransactionTableViewCellViewModel = LatestTransactionTableViewCellViewModel()
    
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
        backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1)
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
    
    func setupCell(latestTransactionCell: LatestTransactionsCell) {
        viewModel.setLatestTransaction(latestTransactionCell: latestTransactionCell)
        screen.titleLabel.text = viewModel.title
        screen.tableView.reloadData()
    }
}

extension LatestTransactionTableViewCell: UITableViewDelegate {
    
}

extension LatestTransactionTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListOfTransactionTableViewCell.identifier, for: indexPath) as? ListOfTransactionTableViewCell else { return UITableViewCell() }
        cell.setupCell(listOfTransaction: viewModel.loadCurrentListOfTransaction(index: indexPath.row), isInicial: viewModel.isInicial(index: indexPath.row), isFinal: viewModel.isFinal(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }
}
