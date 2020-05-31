//
//  knapsackRecursive.swift
//  DP
//
//  Created by sunil.kumar1 on 5/31/20.
//  Copyright © 2020 sunil.kumar1. All rights reserved.
//

import Foundation

class KnapsackRecursive {
    
    init() {
       let p = getMaximumProfit(wt: [10,20,30], val: [60,100,120], W:50)
        
    }
    
    func getMaximumProfit(wt: [Int], val: [Int], W: Int) -> Int {
        var wa = wt
        var va = val
        let mw = W
        if wa.count == 0 || mw <= 0 {
            return 0
        }
        
        let lastWt = wa.last!
        let lastVal = va.last!
        wa.removeLast()
        va.removeLast()
        
        if lastWt <= W {
            return max(lastVal + getMaximumProfit(wt: wa, val: va, W: mw-lastWt) , getMaximumProfit(wt: wa, val: va, W: mw))
        } else {
            return getMaximumProfit(wt: wa, val: va, W: mw)
        }
        
    }

}
