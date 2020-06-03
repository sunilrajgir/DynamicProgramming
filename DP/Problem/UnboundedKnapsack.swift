//
//  UnboundedKnapsack.swift
//  DP
//
//  Created by sunil.kumar1 on 6/3/20.
//  Copyright © 2020 sunil.kumar1. All rights reserved.
//

import Foundation

class unboundedKnapsack {
    init() {
        let a = maxRod(lenArray: [1,3,5,6], priceArray: [7,8,10,15], len: 10)
        
    }
    
    func maxRod(lenArray:[Int], priceArray:[Int], len:Int) -> Int {
        let n = lenArray.count
        var t = Array(repeating: Array(repeating: 0, count: len+1), count: lenArray.count+1)
        
        for i in 0..<len+1{
            t[0][i] = 0
        }
        
        for i in 0..<n+1{
            t[i][0] = 0
        }
        
        for i in 1..<n+1{
            for j in 1..<len+1{
                if lenArray[i-1] <= j {
                   t[i][j] = max(priceArray[i-1]+t[i][j-lenArray[i-1]], t[i-1][j])
                } else {
                    t[i][j] = t[i-1][j]
                }
            }
        }
        
        return t[n][len]
        
    }
}
