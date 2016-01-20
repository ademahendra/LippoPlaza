//
//  mall.swift
//  Lippo Malls
//
//  Created by Ade Mahendra on 3/2/15.
//  Copyright (c) 2015 Ade Mahendra. All rights reserved.
//

import Foundation

class Malldata {
    
    var id :Int = 0
    var name : String = ""
    var address : String = ""
    var picture : String = ""
    
    init(id:Int , name:String = "", address:String = "", picture:String = "")
    {
        self.id = id
        self.name = name
        self.address = address
        self.picture = picture
    }
    init() {}
    
}