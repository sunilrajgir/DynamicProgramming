//
//  knapsackRecursive.swift
//  DP
//
//  Created by sunil.kumar1 on 5/31/20.
//  Copyright © 2020 sunil.kumar1. All rights reserved.
//

import Foundation

class KnapsackRecursive {
    var t =  Array(repeating: Array(repeating:-1,count:8), count: 5)
    
    init() {
        
        //let p = minDistance("intention", "execution")
        let p = getRecursiveMemoizeMaximumProfit(wt: [1,3,4,5], val: [1,4,5,7], W:7)
        
        
        
        //getRecursiveMaximumProfit(wt: [10,20,30], val: [60,100,120], W:50)
        
    }
    
    func getRecursiveMaximumProfit(wt: [Int], val: [Int], W: Int) -> Int {
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
            return max(lastVal + getRecursiveMaximumProfit(wt: wa, val: va, W: mw-lastWt) , getRecursiveMaximumProfit(wt: wa, val: va, W: mw))
        } else {
            return getRecursiveMaximumProfit(wt: wa, val: va, W: mw)
        }
        
    }
    
    func getRecursiveMemoizeMaximumProfit(wt: [Int], val: [Int], W: Int) -> Int {
        var wa = wt
        var va = val
        let mw = W
        if wa.count == 0 || mw <= 0 {
            return 0
        }
        
        if t[wa.count][mw] != -1 {
            return t[wa.count][mw]
        }
        
        let lastWt = wa.last!
        let lastVal = va.last!
        wa.removeLast()
        va.removeLast()
        
        if lastWt <= W {
            
            t[wa.count][mw] = max(lastVal + getRecursiveMemoizeMaximumProfit(wt: wa, val: va, W: mw-lastWt), getRecursiveMemoizeMaximumProfit(wt: wa, val: va, W: mw))
            
            return t[wa.count][mw]
            
        } else if lastWt > W {
                t[wa.count][mw] = getRecursiveMemoizeMaximumProfit(wt: wa, val: va, W: mw)
                return t[wa.count][mw]
        }
        
        return t[wt.count][W]
    }
    
}
