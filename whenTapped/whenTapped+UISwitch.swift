//
//  whenTapped+UISwitch.swift
//  whenTapped
//
//  Created by Vincent Narbot on 12/2/16.
//  Copyright © 2016 Vincent Narbot. All rights reserved.
//

extension UISwitch {
    private struct AssociatedKeys {
        static var whenTappedKey   = "whenTappedKey"
    }
    
    public func whenTapped(handler: (() -> Void)!) {
        let aBlockClassWrapper = ClosureWrapper(closure: handler)
        objc_setAssociatedObject(self, &AssociatedKeys.whenTappedKey, aBlockClassWrapper, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        self.addTarget(self, action: #selector(UIButton.touchUpInside), for: UIControlEvents.touchUpInside)
    }
    
    func touchUpInside(){
        let actionBlockAnyObject = objc_getAssociatedObject(self, &AssociatedKeys.whenTappedKey) as? ClosureWrapper
        actionBlockAnyObject?.closure?()
        self.tag = 0
    }
}
