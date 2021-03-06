//
//  CornerHeaderView.swift
//  JZCalendarWeekView
//
//  Created by Jeff Zhang on 28/3/18.
//  Copyright © 2018 Jeff Zhang. All rights reserved.
//

import UIKit

/// Top Left corner in collectionView (Supplementary View)
open class JZCornerHeader: UICollectionReusableView {

    public var lblMonth = UILabel()
    let calendarCurrent = Calendar.current
    public var dateFormatter = DateFormatter()

    public override init(frame: CGRect) {
        super.init(frame: .zero)

        if #available(iOS 13.0, *) {
            backgroundColor = UIColor.secondarySystemGroupedBackground
        } else {
            backgroundColor = .white
        }
        setupUI()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func setupUI() {
        self.clipsToBounds = true
        lblMonth.textAlignment = .center
        lblMonth.font = UIFont(name: "Lato-Bold", size: 20)
        lblMonth.textColor = JZWeekViewColors.today
        addSubview(lblMonth)
        lblMonth.setAnchorConstraintsEqualTo(centerXAnchor: centerXAnchor, centerYAnchor: centerYAnchor)

        let bottomDivider = UIView()
        bottomDivider.backgroundColor = JZWeekViewColors.gridLine
        addSubview(bottomDivider)
        bottomDivider.setAnchorConstraintsEqualTo(heightAnchor: 0.5, bottomAnchor: (bottomAnchor, 0), leadingAnchor: (leadingAnchor, 0), trailingAnchor: (trailingAnchor, 0))
    }

    public func updateView(date: Date) {
        let month = calendarCurrent.component(.month, from: date) - 1

        lblMonth.text = dateFormatter.shortMonthSymbols[month].capitalized
    }

}
