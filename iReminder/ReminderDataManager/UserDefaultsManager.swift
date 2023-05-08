//
//  UserDefaultsManager.swift
//  iReminder
//
//  Created by moMMo on 5/7/23.
//

import Foundation


class UserDefaultsManager: Codable {
    
    
    
    /// Save a reminder to the UserDefaults
    func saveReminder(reminder: ReminderModel) {
        /// Retrieve existing reminders or create an empty array if none exist yet
        var retrievedReminder = retrieveReminder()
        
        /// Check if a reminder with the same title already exists
        guard !retrievedReminder.contains(where: { $0.title == reminder.title }) else {
            print("Duplicated reminder!")
            return
        }
        /// Add the new reminder to the beginning of the array
        retrievedReminder.insert(reminder, at: 0)
        
        do {
            // Encode the updated reminders array and save to UserDefaults
            let encoder = JSONEncoder()
            let data = try encoder.encode(retrievedReminder)
            UserDefaults.standard.set(data, forKey: "SavedRemindeObject")
        } catch {
            print("Unable to encode reminder \(error)!")
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
    func deleteReminder(at index: Int) {
        var currentReminders = retrieveReminder()
        if index < currentReminders.count {
            currentReminders.remove(at: index)
            do {
                let encoder = JSONEncoder()
                let data = try encoder.encode(currentReminders)
                UserDefaults.standard.set(data, forKey: "SavedRemindeObject")
            } catch {
                print("Unable to encode Reminders \(error)!")
            }
        } else {
            print("Index out of range!")
        }
    }
    
}
