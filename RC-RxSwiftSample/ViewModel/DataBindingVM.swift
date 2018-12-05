//
//  DataBindingVM.swift
//  RC-RxSwiftSample
//
//  Created by Ramesh on 18.11.18.
//  Copyright © 2018 Ramesh. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class DataBindingVM {
    
    var dataModel: Variable<[PersonModel]> = Variable([
        PersonModel(name:"name1",age:22),
        PersonModel(name:"name2",age:22),
        PersonModel(name:"name3",age:22),
        PersonModel(name:"name4",age:22),
        PersonModel(name:"name5",age:22),
        PersonModel(name:"name6",age:22)
    ])
}
