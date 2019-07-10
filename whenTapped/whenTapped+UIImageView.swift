//
//  whenTapped+UIImageView.swift
//  whenTapped
//
//  Created by Vincent Narbot on 12/2/16.
//  Copyright © 2016 Vincent Narbot. All rights reserved.
//

import UIKit

extension UIImageView {
    private struct AssociatedKeys {
        static var whenTappedKey   = "whenTappedKey"
    }
    
    @objc public override func whenTapped(handler: (() -> Void)!) {
        let aBlockClassWrapper = ClosureWrapper(closure: handler)
        objc_setAssociatedObject(self, &AssociatedKeys.whenTappedKey, aBlockClassWrapper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(UIImageView.touchUpInside))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc override func touchUpInside(){
        let actionBlockAnyObject = objc_getAssociatedObject(self, &AssociatedKeys.whenTappedKey) as? ClosureWrapper
        actionBlockAnyObject?.closure?()
        self.tag = 0
    }
}
