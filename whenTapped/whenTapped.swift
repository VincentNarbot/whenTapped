//
//  whenTapped.swift
//  whenTapped
//
//  Created by Vincent Narbot on 12/2/16.
//  Copyright © 2016 Vincent Narbot. All rights reserved.
//

import UIKit
import ObjectiveC
import AVFoundation

class ClosureWrapper: NSObject, NSCopying {
    public func copy(with zone: NSZone? = nil) -> Any {
        let wrapper: ClosureWrapper = ClosureWrapper()
        wrapper.closure = closure
        return wrapper
    }
    
    var closure: (() -> Void)?
    convenience init(closure: (() -> Void)?) {
        self.init()
        self.closure = closure
    }
}
