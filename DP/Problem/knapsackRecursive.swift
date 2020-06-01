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
        //let p = getRecursiveMemoizeMaximumProfit(wt: [1,3,4,5], val: [1,4,5,7], W:7)
        
        //let dp = getMaxDp(wt: [1,3,4,5], val: [1,4,5,7], W: 7, n: 4)
        
        let q = getSumSubsetDp(wt: [2,3,7,8], W: 11, n: 4)
        
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
    
    func getMaxDp(wt:[Int], val: [Int], W:Int, n:Int) -> Int {
        
        var t = Array(repeating: Array(repeating: 0, count: W+1), count: n+1)

        for i in 1..<n+1 {
            for j in 1..<W+1 {
                if wt[i-1] <= j {
                    t[i][j] = max(val[i-1]+t[i-1][j-wt[i-1]], t[i-1][j])
                } else {
                    t[i][j] = t[i-1][j]
                }
                  
            }
        }
        return t[n][W]
    }
    
    func getSumSubsetDp(wt:[Int], W:Int, n:Int) -> Bool {
        
        var t = Array<[Bool]>(repeating: Array<Bool>(repeating: false, count: W+1), count: n+1)
        
        for i in 0..<n+1 {
            for j in 0..<W+1 {
                if i == 0 {
                    t[i][j] = false
                }
                
                if j == 0 {
                    t[i][j] = true
                }
            }
        }

        for i in 1..<n+1 {
            for j in 1..<W+1 {
                if wt[i-1] <= j {
                    t[i][j] = t[i-1][j-wt[i-1]] || t[i-1][j]
                } else {
                    t[i][j] = t[i-1][j]
                }
                  
            }
        }
        return t[n][W]
    }
    
}
