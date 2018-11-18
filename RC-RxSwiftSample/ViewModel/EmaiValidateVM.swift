//
//  EmaiValidateVM.swift
//  RC-RxSwiftSample
//
//  Created by Ramesh on 14.11.18.
//  Copyright © 2018 Ramesh. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


struct EmaiValidateVM {
    var emailText = Variable<String>("")
    
    var isValid:Observable<Bool>{
        return emailText.asObservable().map{tt in
            return self.isValidEmail(str: tt)
        }
    }
    
    func isValidEmail(str:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: str)
    }
}
