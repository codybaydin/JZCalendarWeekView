//
//  JZColumnHeaderBackground.swift
//  JZCalendarWeekView
//
//  Created by Jeff Zhang on 28/3/18.
//  Copyright © 2018 Jeff Zhang. All rights reserved.
//

import UIKit

/// The whole background for the top
open class JZColumnHeaderBackground: UICollectionReusableView {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        if #available(iOS 13.0, *) {
            backgroundColor = UIColor.secondarySystemBackground
        } else {
            backgroundColor = UIColor(red: 242/255, green: 243/255, blue: 244/255, alpha: 1.0)
        }
        self.clipsToBounds = true
        setupBottomDivider()
    }

    open func setupBottomDivider() {
        let bottomDivider = UIView()
        bottomDivider.backgroundColor = JZWeekViewColors.gridLine
        addSubview(bottomDivider)
        bottomDivider.setAnchorConstraintsEqualTo(heightAnchor: 0.5, bottomAnchor: (bottomAnchor, 0), leadingAnchor: (leadingAnchor, 0), trailingAnchor: (trailingAnchor, 0))
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
