//
//  SavedReminderViewModel.swift
//  iReminder
//
//  Created by moMMo on 5/6/23.
//

import Foundation
 

class SavedRemindersViewModel {
    
    
    //MARK: -  Properties

    var reminders: [ReminderModel] = []
    let userDefaultsManager = UserDefaultsManager()
   
    
    //MARK: -  Methods

    func addSavedReminder(_ reminder: ReminderModel) {
        reminders.append(reminder)
    }
    
    func deleteReminder(at index: Int) {
        UserDefaultsManager().deleteReminder(at: index)
    }
}
