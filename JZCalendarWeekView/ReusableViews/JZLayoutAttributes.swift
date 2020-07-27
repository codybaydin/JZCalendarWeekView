//
//  JZLayoutAttributes.swift
//  JZCalendarWeekView
//
//  Created by Cody Huang on 7/27/20.
//

import UIKit

class JZLayoutAttributes: UICollectionViewLayoutAttributes {
    // Additional attribute to test our custom layout
    var backgroundColor = UIColor.white
    
    // MARK: NSCopying
    override func copy(with zone: NSZone? = nil) -> Any {
        let copy = super.copy(with: zone) as! JZLayoutAttributes
        copy.backgroundColor = self.backgroundColor
        return copy
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let rhs = object as? JZLayoutAttributes {
            if backgroundColor != rhs.backgroundColor {
                return false
            }
            return super.isEqual(object)
        } else {
            return false
        }
    }
}
