//
//  DataBindingVC.swift
//  RC-RxSwiftSample
//
//  Created by Ramesh on 18.11.18.
//  Copyright © 2018 Ramesh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DataBindingVC: UIViewController {
    fileprivate var viewModel = DataBindingVM()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func prepareView() {
        viewModel.prepareModel()
    }
    
}
