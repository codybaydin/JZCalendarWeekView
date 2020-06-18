//
//  JZAllDayEvent.swift
//  JZCalendarWeekView
//
//  Created by Jeff Zhang on 24/5/18.
//  Copyright © 2018 Jeff Zhang. All rights reserved.
//

import UIKit

open class JZAllDayEvent: JZBaseEvent {

    /// If a event is All-Day, then it will be shown at top of calendarView
    public var isAllDay: Bool

    public init(id: String, calendarID: String, startDate: Date, endDate: Date, isAllDay: Bool) {
        self.isAllDay = isAllDay
        super.init(id: id, calendarID: calendarID, startDate: startDate, endDate: endDate)
    }

    open override func copy(with zone: NSZone?) -> Any {
        return JZAllDayEvent(id: id, calendarID: calendarID, startDate: startDate, endDate: endDate, isAllDay: isAllDay)
    }

}
