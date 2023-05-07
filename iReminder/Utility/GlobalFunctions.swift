//
//  DateFormatter.swift
//  iReminder
//
//  Created by moMMo on 5/7/23.
//

import Foundation


  func formatterDate(date : Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "d MMM y HH:mm"
    return formatter.string(from: date)
}
