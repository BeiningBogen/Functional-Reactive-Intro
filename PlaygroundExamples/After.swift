//
//  After.swift
//  DatekSDK
//
//  Created by Håkon Bogen on 27/06/2017.
//  Copyright © 2017 Håkon Bogen. All rights reserved.
//

import Foundation

public enum AnExampleError : Error {
    
    case noInternet
    case notHTTPS
    
}

 func lol () {
    
}

public func after(_ duration: Double, closure: @escaping () -> Void) {
    

    
    
    let delayTime = DispatchTime.now() + Double(Int64(duration * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    
    DispatchQueue.main.asyncAfter(deadline: delayTime) {
        
        closure()
        
    }
    
}

func dispatchToMain(_ closure: @escaping () -> Void) {
    
    DispatchQueue.main.async(execute: {
        
        closure()
        
    })
    
}

