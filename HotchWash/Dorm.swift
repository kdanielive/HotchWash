//
//  DormData.swift
//  HotchWash
//
//  Created by Daniel Kim on 4/15/17.
//  Copyright © 2017 Daniel Kim. All rights reserved.
//

import Foundation

class Dorm {
    let washerNum : Int
    let dormName: String
    
    init(myWasherNum: Int, myDormName: String) {
        self.washerNum = myWasherNum
        self.dormName = myDormName
    }
}

class DormsData {
    var allDorms : Array<Dorm> = Array()
    
    init() {
        self.allDorms.append(Dorm(myWasherNum: 2, myDormName: "Watson"))
        self.allDorms.append(Dorm(myWasherNum: 2, myDormName: "Edelman"))
        self.allDorms.append(Dorm(myWasherNum: 2, myDormName: "Dana"))
        self.allDorms.append(Dorm(myWasherNum: 5, myDormName: "Redlich"))
        self.allDorms.append(Dorm(myWasherNum: 3, myDormName: "Garland"))
    }
}

struct generalData {
    static var currentDorm = Dorm(myWasherNum: 0, myDormName: "")
}
