//
//  NameValidatorVC.swift
//  RC-RxSwiftSample
//
//  Created by Ramesh on 13.11.18.
//  Copyright © 2018 Ramesh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NameValidatorVC: UIViewController {

    fileprivate let bag:DisposeBag = DisposeBag()
    fileprivate var viewModel = NameValidateVM()
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtSecondName: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameValidation()
        
        // Do any additional setup after loading the view.
    }
    
    func nameValidation()  {
        _ = txtFirstName.rx.text.map{ $0 ?? ""}.bind(to: viewModel.firstName)
        _ = txtSecondName.rx.text.map{ $0 ?? ""}.bind(to: viewModel.lastName)
        
        _ = viewModel.isValid.asObservable().subscribe(onNext: {[unowned self] boolValue in
//            self.viewModel.fullName.value = "\(self.viewModel.firstName) \(self.viewModel.lastName)"
            self.lblMessage.text = (boolValue ? "Hello!!! \( self.viewModel.fullName.value)" : "You are not reall")
        }).disposed(by: bag)
    }
    
    func setupUI() {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
