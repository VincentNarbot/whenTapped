//
//  whenTapped+UILabel.swift
//  whenTapped
//
//  Created by Vincent Narbot on 12/2/16.
//  Copyright © 2016 Vincent Narbot. All rights reserved.
//

import UIKit

extension UILabel {
    private struct AssociatedKeys {
        static var whenTappedKey   = "whenTappedKey"
    }
    
    public override func whenTapped(handler: (() -> Void)!) {
        let aBlockClassWrapper = ClosureWrapper(closure: handler)
        objc_setAssociatedObject(self, &AssociatedKeys.whenTappedKey, aBlockClassWrapper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(UILabel.touchUpInside))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func touchUpInside(){
        let actionBlockAnyObject = objc_getAssociatedObject(self, &AssociatedKeys.whenTappedKey) as? ClosureWrapper
        actionBlockAnyObject?.closure?()
        self.tag = 0
    }
}
