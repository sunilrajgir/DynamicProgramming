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
        let b = maxCoinChange(coin: [1,2,3], sum: 5)
        checkPossibility([2,3,3,2,4])
        
        let c = coinChange([2], 3)
        
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
    
    func maxCoinChange(coin: [Int], sum: Int) -> Int {
        let n = coin.count
        var t = Array(repeating: Array(repeating: 0, count: sum+1), count: n+1)
        
        for i in 0..<sum+1{
            t[0][i] = 0
        }
        
        for i in 0..<n+1{
            t[i][0] = 1
        }
        
        for i in 1..<n+1{
            for j in 1..<sum+1{
                if coin[i-1] <= j {
                   t[i][j] = t[i][j-coin[i-1]]+t[i-1][j]
                } else {
                    t[i][j] = t[i-1][j]
                }
            }
        }
        
        return t[n][sum]
    }
    
    func checkPossibility(_ nums: [Int]) -> Bool {
        
        var c = 0
        var index = 0
        for i in 0..<nums.count-1 {
            if nums[i] <= nums[i+1] {
             //
            } else {
              index = i
              c = c + 1
            }
        }
        
        if c > 1 {
            return false
        }else if c == 1 {
            return true
        } else {
            var pnums = nums
            pnums[index] = pnums[index+1]-1
            var nc = 0
            for i in 0..<pnums.count-1 {
                if pnums[i] <= pnums[i+1] {
                 //
                } else {
                  nc = nc + 1
                }
            }

            if nc > 0 {
                return false
            } else {
                return true
            }
        }
    }
    
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        
        let n = coins.count
        
        if n+1 <= 2 {
            if amount%coins[0] == 0 {
                return amount/coins[0]
            } else {
                return -1
            }
        }
        
        var t = Array(repeating:Array(repeating:0, count:amount+1),count:n+1)
        
        for i in 0..<amount+1{
            t[0][i] = Int.max-1
        }
        
        for i in 1..<n+1 {
            t[i][0] = 0
        }
        
        if n >= 1 {
            for i in 1..<amount+1 {
                if i%coins[0] == 0 {
                    t[1][i] = i/coins[0]
                } else {
                    t[1][i] = Int.max-1
                }
            }
        }
        
      for i in 2..<n+1 {
            for j in 1..<amount+1 {
                if coins[i-1] <= j {
                    t[i][j] = min(1+t[i][j-coins[i-1]], t[i-1][j])
                } else {
                    t[i][j] = t[i-1][j]
                }
            }
        }
        return t[n][amount] == Int.max-1 ? -1 : t[n][amount]
    }
}
