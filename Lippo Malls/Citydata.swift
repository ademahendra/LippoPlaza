//
//  Citydata.swift
//  Lippo Malls
//
//  Created by Ade Mahendra on 3/5/15.
//  Copyright (c) 2015 Ade Mahendra. All rights reserved.
//

import Foundation

class Citydata {
    
    var id :Int = 0
    var name : String = ""
    
    init(id:Int , name:String = "")
    {
        self.id = id
        self.name = name
    }
    init() {}
    
}