//
//  SavedReminderView.swift
//  iReminder
//
//  Created by moMMo on 5/6/23.
//

import UIKit


class SavedRemindersViewController: UIViewController {
    private var viewModel = SavedRemindersViewModel()

    //MARK: -  Application LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.savedRemindersTitle
        view.backgroundColor = UIColor(named: Constants.savedRemindersVCBackgroundColor)
        navigationController?.navigationBar.backgroundColor = .black
        configureTableView()
        setupSavedRemindersTableViewConstraint()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateSavedRemindersTableView()
        updateSavedReminderAfterRemoving()
    }
    
    //MARK: -   UI Outlets
    
    
    /// Create SavedRemindersTableView
    private lazy var savedRemindersTableView : UITableView = {
        let table = UITableView()
        table.register(SavedCell.self, forCellReuseIdentifier: Constants.savedReminderCellIdentifier)
        return table
    }()
    
    
    
    /// ConfigureTableView
    private func configureTableView() {
        savedRemindersTableView.delegate        = self
        savedRemindersTableView.dataSource      = self
        savedRemindersTableView.separatorStyle  = .none

    }
   
    
    /// SetupSavedRemindersTableViewConstraint
    private func setupSavedRemindersTableViewConstraint() {
        view.addSubview(savedRemindersTableView)
        savedRemindersTableView.translatesAutoresizingMaskIntoConstraints = false
        savedRemindersTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        savedRemindersTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        savedRemindersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
        savedRemindersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10).isActive = true
    }
    
    //MARK: - Methods
    
    /// Update the Saved TableView
    private func updateSavedRemindersTableView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.viewModel.savedReminders = self.viewModel.userDefaultsManager.retrieveReminder()
            self.savedRemindersTableView.reloadData()
        }
    }
    
    
    /// Update the Saved TableView after Removing
    private func updateSavedReminderAfterRemoving() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.savedRemindersTableView.reloadData()
        }
    }
}

//MARK: - TableView Extensions

extension SavedRemindersViewController : UITableViewDelegate, UITableViewDataSource {
    
//    func didSavedReminder(reminder: ReminderModel) {
//        /// Add the reminder to your data source using the view model
//        viewModel.addSavedReminder(reminder)
//
//        /// Update the table view
//        updateSavedRemindersTableView()
//    }
    
    
    /// didSelectRowAt delegate method
    /// - Parameters:
    ///   - tableView: SavedReminder TableView
    ///   - indexPath: Selected row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    
    /// numberOfRowsInSection
    /// - Parameters:
    ///   - tableView: SavedReminders TableView
    ///   - section: Section Description
    /// - Returns: Number of SavedReminders
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.savedReminders.count
    }
    
    
    
    /// deleting a row
    /// - Parameters:
    ///   - tableView: SavedReminders TableView
    ///   - editingStyle: SwipeLeft
    ///   - indexPath: Section Description
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.savedReminders.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
  
    
    
    /// cellForRowAt
    /// - Parameters:
    ///   - tableView: Saved Reminders TableView
    ///   - indexPath: Selected row
    /// - Returns: the Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.savedReminderCellIdentifier, for: indexPath) as? SavedCell else { return UITableViewCell() }
        cell.fillSavedReminderData(reminderTitle: viewModel.savedReminders[indexPath.row].title, reminderTime: viewModel.savedReminders[indexPath.row].time)
        return cell
    }
    
    
    
    /// Config TableView Height
    /// - Parameters:
    ///   - tableView: Saved Reminders TableView
    ///   - indexPath: Selected row
    /// - Returns: The exact height of the Cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

