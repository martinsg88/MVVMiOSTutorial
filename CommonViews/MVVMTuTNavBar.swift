//
//  MVVMTuTNavBar.swift
//  MVVMTutorial
//
//  Created by Guilherme Martins on 2022/06/11.
//

import Foundation
import UIKit

class MVVMTuTNavBar: UINavigationController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupNavBar()
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        setupNavBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupNavBar()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupNavBar()
    }
    
    func setupNavBar(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationBar.standardAppearance = appearance;
        navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
        navigationBar.topItem?.title = "WOW"
    }
}
