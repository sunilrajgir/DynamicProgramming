//
//  Lcs.swift
//  DP
//
//  Created by sunil.kumar1 on 6/5/20.
//  Copyright © 2020 sunil.kumar1. All rights reserved.
//

import Foundation

class Lcs {
    var t = [[Int]]()
    init() {
        let a = longestCommonSubsequence("abcde", "ace")
        
    }
    
    
    
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let l1 = text1.count
        let l2 = text2.count
        t = Array(repeating:Array(repeating:-1, count:l2+1),count:l1+1)
        
        return longestCommonSubsequence1(text1, text2, l1, l2)
    }
    
    func longestCommonSubsequence1(_ text1: String, _ text2: String, _ l1: Int, _ l2: Int) -> Int {
                
        if l1 == 0 || l2 == 0 {
            return 0
        }
        
        if t[l1][l2] != -1 {
            return t[l1][l2]
        }
        
        if text1[String.Index(encodedOffset: l1-1)] == text2[String.Index(encodedOffset: l2-1)] {
            t[l1][l2] = (1 + longestCommonSubsequence1(text1,text2, l1-1, l2-1))
            return t[l1][l2]
        } else  {
            t[l1][l2] = max(longestCommonSubsequence1(text1,text2,l1-1,l2), longestCommonSubsequence1(text1,text2,l1,l2-1))
            return t[l1][l2]
        }
        
    }
}
