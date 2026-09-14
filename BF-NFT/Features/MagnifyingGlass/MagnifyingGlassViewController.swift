//
//  MagnifyingGlassViewController.swift
//  BF-NFT
//
//  Created by Juliano Sgarbossa on 14/09/26.
//

import UIKit
import AlamofireImage
import Alamofire

class MagnifyingGlassViewController: UIViewController {

    private var screen: MagnifyingGlassScreen?
    private var urlImage: String
    
    override func loadView() {
        screen = MagnifyingGlassScreen()
        view = screen
    }
    
    required init(urlImage: String) {
        self.urlImage = urlImage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configProtocols()
        configImage()
    }
    
    private func configProtocols() {
        screen?.delegate(delegate: self)
    }
    
    private func configImage() {
        guard let url = URL(string: urlImage) else { return }
        screen?.nftImageView.af.setImage(withURL: url)
    }
}

extension MagnifyingGlassViewController: MagnifyingGlassScreenDelegate {
    func tappedBackButton() {
        dismiss(animated: true)
    }
}
