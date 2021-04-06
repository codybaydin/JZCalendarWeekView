//
//  JZColumnHeader.swift
//  JZCalendarWeekView
//
//  Created by Jeff Zhang on 28/3/18.
//  Copyright © 2018 Jeff Zhang. All rights reserved.
//

import UIKit

/// Header for each column (section, day) in collectionView (Supplementary View)
open class JZColumnHeader: UICollectionReusableView {

    public var lblDayBackground = UIView()
    public var lblDay = UILabel()
    public var lblWeekday = UILabel()
    let calendarCurrent = Calendar.current
    public var dateFormatter = DateFormatter()

    public override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
        setupLeftDivider()
        backgroundColor = .clear
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        // Hide all content when colum header height equals 0
        self.clipsToBounds = true
        let stackView = UIStackView(arrangedSubviews: [lblWeekday, lblDayBackground])
        stackView.axis = .vertical
        stackView.spacing = 0
        addSubview(stackView)
        stackView.setAnchorConstraintsEqualTo(centerXAnchor: centerXAnchor, centerYAnchor: centerYAnchor)
        lblDay.textAlignment = .center
        lblWeekday.textAlignment = .center
        lblDay.font = UIFont(name: "Lato-Bold", size: 20)
        lblWeekday.font = UIFont(name: "Lato", size: 12)
        lblDay.clipsToBounds = true
        lblDayBackground.addSubview(lblDay)
        
        let circleDiameter: CGFloat = 32
        lblDay.setAnchorConstraintsEqualTo(widthAnchor: circleDiameter, heightAnchor: circleDiameter, centerXAnchor: lblDayBackground.centerXAnchor, centerYAnchor: lblDayBackground.centerYAnchor)
        lblDayBackground.setAnchorConstraintsEqualTo(heightAnchor: circleDiameter)
        lblDay.layer.cornerRadius = circleDiameter / 2
    }

    private func setupLeftDivider() {
        let leftDivider = UIView()
        leftDivider.backgroundColor = JZWeekViewColors.gridLine
        addSubview(leftDivider)
        leftDivider.setAnchorConstraintsEqualTo(widthAnchor: 0.5, topAnchor: (topAnchor, 0), bottomAnchor: (bottomAnchor, 0), leadingAnchor: (leadingAnchor, 0))
    }

    public func updateView(date: Date) {
        let weekday = calendarCurrent.component(.weekday, from: date) - 1

        lblDay.text = String(calendarCurrent.component(.day, from: date))
        lblWeekday.text = dateFormatter.weekdaySymbols[weekday].capitalized

        if date.isToday {
            lblDay.textColor = .white
            lblDay.backgroundColor = JZWeekViewColors.today
            lblWeekday.textColor = JZWeekViewColors.today
        } else {
            lblDay.textColor = JZWeekViewColors.columnHeaderDay
            lblDay.backgroundColor = .clear
            lblWeekday.textColor = JZWeekViewColors.columnHeaderDay
        }
    }

}
