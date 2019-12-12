//
//  Sign.swift
//  PRS
//
//  Created by Go7hic on 2019/12/12.
//  Copyright © 2019 Go7hic. All rights reserved.
//


import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {​     let sign = randomChoice.nextInt()​     if sign == 0 {​         return .rock​     } else if sign == 1 {​         return .paper​     } else {​         return .scissors​     }​ }
