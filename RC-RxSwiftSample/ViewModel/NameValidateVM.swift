//
//  NameValidateVM.swift
//  RC-RxSwiftSample
//
//  Created by Ramesh on 14.11.18.
//  Copyright © 2018 Ramesh. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

struct NameValidateVM {
    
    var firstName = Variable<String>("")
    var lastName = Variable<String>("")
    var fullName = Variable<String>("")
    
    var isValid:Observable<Bool>{
        return Observable.combineLatest(firstName.asObservable(), lastName.asObservable()){ fName, lName in
            self.fullName.value = "\(fName) \(lName)"
           return (fName.count > 4 && lName.count > 4)
        }
    }
}
