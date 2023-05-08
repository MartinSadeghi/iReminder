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
        userDefaultsManager.deleteReminder(reminder: reminder)
    }
}
