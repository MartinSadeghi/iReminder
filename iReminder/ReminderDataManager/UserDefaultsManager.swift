//
//  UserDefaultsManager.swift
//  iReminder
//
//  Created by moMMo on 5/7/23.
//

import Foundation


class UserDefaultsManager: Codable {
    
    
    
    /// Save a reminder to the UserDefaults
    /// - Parameter reminder: reminder
    func saveReminder(reminder: ReminderModel) {
        var retrievedReminder = retrieveReminder()
        if retrievedReminder.contains(where: {
            $0.title == reminder.title
        }) {
            print("Duplicated reminder!")
        } else {
            retrievedReminder.insert(reminder, at: 0)
            
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(retrievedReminder)
                UserDefaults.standard.set(data, forKey: "SavedRemindeObject")
            } catch {
                print("Unable to encode reminder \(error)!")
            }
        }
    }
    
    
    
    /// Retrieve All Reminders from UserDefaults
    /// - Returns: Remained Reminders
    func retrieveReminder() -> [ReminderModel] {
        var savedReminder : [ReminderModel]?
        if let data = UserDefaults.standard.data(forKey: "SavedRemindeObject") {
            do {
                let decoder = JSONDecoder()
                let reminders = try decoder.decode([ReminderModel].self, from: data)
                savedReminder = reminders
            } catch {
                print("Unable to decode Reminders \(error)!")
            }
        }
        return savedReminder ?? []
    }
    
    
    /// Delete a reminders from UserDefaults
    /// - Parameter reminder: reminder
    func deleteReminder(reminder: ReminderModel) {
        var currentReminders = retrieveReminder()
        if currentReminders.contains(where: {
            $0.title == reminder.title
        }) {
            currentReminders.removeAll(where: {
                $0.title == reminder.title
            })
        }
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(currentReminders)
            print(data)
            UserDefaults.standard.set(data, forKey: "SavedRemindeObject")
        } catch {
            print("Unable to encode Reminders \(error)!")

        }
    }
    
    
    
    
}
