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

struct DataBindingVM {
    
    let dataModel = [
        PersonModel(name:"name1",age:22,sex:"male",address:"address-1"),
        PersonModel(name:"name2",age:22,sex:"male",address:"address-2"),
        PersonModel(name:"name3",age:22,sex:"male",address:"address-3"),
        PersonModel(name:"name4",age:22,sex:"male",address:"address-4"),
        PersonModel(name:"name5",age:22,sex:"male",address:"address-5"),
        PersonModel(name:"name6",age:22,sex:"male",address:"address-6")
    ]
    
    var objArray: Observable<[PersonModel]>?
    
    init() {
        
    }
    
    mutating func prepareModel() {
         objArray = Observable.just(dataModel)
    }
}
