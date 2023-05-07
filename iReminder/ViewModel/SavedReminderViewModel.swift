//
//  SavedReminderViewModel.swift
//  iReminder
//
//  Created by moMMo on 5/6/23.
//

import Foundation
 

class SavedRemindersViewModel {
    
    var savedReminders: [ReminderModel] = []
    let userDefaultsManager = UserDefaultsManager()
   
    func addSavedReminder(_ reminder: ReminderModel) {
        savedReminders.append(reminder)
    }
    
    func deleteSwipeReminder(_ reminder: ReminderModel) {
        let selectedReminder = reminder
        userDefaultsManager.deleteReminder(reminder: selectedReminder)
    }
}
