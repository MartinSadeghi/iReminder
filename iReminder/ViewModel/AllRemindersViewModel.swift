//
//  AllRemindersViewModel.swift
//  iReminder
//
//  Created by moMMo on 5/6/23.
//

import Foundation


class AllRemindersViewModel {
    
    
    //MARK: -  Properties

    var reminders: [ReminderModel] = []
    
    
    
    //MARK: -  Methods

    
    /// Adding a new reminder to the Reminders TableView
    /// - Parameters:
    ///   - title: Reminder Title
    ///   - body: Reminder Body
    ///   - time: Reminder Time
    func addReminder(title: String, body: String, time: String) {
        reminders.append(ReminderModel(title: title, body: body, time: time))
    }
    
    func reminder(at index: Int) -> ReminderModel? {
        guard index >= 0, index < reminders.count else { return nil }
        return reminders[index]
    }
    
    func numberOfReminders() -> Int {
        return reminders.count
    }
    
    
}
