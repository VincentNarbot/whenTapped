//
//  whenTapped+UIView.swift
//  whenTapped
//
//  Created by vnarbot on 4/11/17.
//  Copyright © 2017 Vincent Narbot. All rights reserved.
//

import UIKit

extension UIView {
    private struct AssociatedKeys {
        static var whenTappedKey   = "whenTappedKey"
    }
    
    @objc public func whenTapped(handler: (() -> Void)!) {
        let aBlockClassWrapper = ClosureWrapper(closure: handler)
        objc_setAssociatedObject(self, &AssociatedKeys.whenTappedKey, aBlockClassWrapper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(UIView.touchUpInside))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func touchUpInside(){
        let actionBlockAnyObject = objc_getAssociatedObject(self, &AssociatedKeys.whenTappedKey) as? ClosureWrapper
        actionBlockAnyObject?.closure?()
        self.tag = 0
    }
}
