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
    fileprivate let bag:DisposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareView()
        self.setupUI()
        // Do any additional setup after loading the view.
    }

    func setupUI() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(DataBindingVC.addNewPerson))
    }
    
    func prepareView() {
        viewModel.dataModel.asDriver().drive(tableView.rx.items(cellIdentifier: "PersonCell")) { (_, dataModel, cell) in
            cell.textLabel?.text = dataModel.name
            cell.detailTextLabel?.text = "Age : \(dataModel.age)"
        }.disposed(by: bag)
    }
    
    @objc func addNewPerson() {
        self.viewModel.dataModel.value.append(PersonModel(name: "name\(self.viewModel.dataModel.value.count + 1)", age: 22))
    }
}
