//
//  SecondViewController.swift
//  RC-RxSwiftSample
//
//  Created by Ramesh on 12.11.18.
//  Copyright © 2018 Ramesh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SecondViewController: UIViewController {
    
    fileprivate let bag:DisposeBag = DisposeBag()
    fileprivate let viewModel = EmaiValidateVM()
    
    @IBOutlet weak var txtEmailField: UITextField!
    @IBOutlet weak var lblMessage: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailValidator()
    }
    
    func emailValidator() {
        _ = txtEmailField.rx.text.map{ $0 ?? ""}.bind(to: viewModel.emailText)
        
        viewModel.isValid.subscribe(onNext: {validValue in
            if(validValue){
                self.setUI(borderColour: UIColor.green)
                self.lblMessage.text = "Yeah, I am valid!!"
            }else{
                self.setUI(borderColour: UIColor.red)
                self.lblMessage.text = "Email is not valid format."
            }
        }).disposed(by: bag)
    }
    
    func setUI(borderColour:UIColor)  {
        txtEmailField.borderWidth = 1
        txtEmailField.borderColor = borderColour
    }
}
