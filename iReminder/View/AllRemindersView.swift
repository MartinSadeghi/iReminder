//
//  AllRemindersView.swift
//  iReminder
//
//  Created by moMMo on 5/6/23.
//

import UIKit


class AllRemindersViewController: UIViewController {
    
    private let viewModel = AllRemindersViewModel()
    
    //MARK: -  Application LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants.allRemindersTitle.localized()
        navigationController?.navigationBar.backgroundColor = .black
        view.backgroundColor = UIColor(named: Constants.allRemindersVCBackgroundColor)
        configureTableView()
        setupRemindersTableViewConstraint()
        setupAddBarButton()
    }
    
    //MARK: -   UI Outlets
    
    private lazy var remindersTableView : UITableView = {
        let table             = UITableView()
        table.register(RemindersCell.self, forCellReuseIdentifier: Constants.reminderCellIdentifier.localized())
        return table
    }()
    
    private func configureTableView() {
        remindersTableView.delegate        = self
        remindersTableView.dataSource      = self
        remindersTableView.separatorStyle  = .none
    }
    
    private func setupRemindersTableViewConstraint() {
        view.addSubview(remindersTableView)
        remindersTableView.translatesAutoresizingMaskIntoConstraints = false
        remindersTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        remindersTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        remindersTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
        remindersTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10).isActive = true
    }
    
    private func setupAddBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewReminder))
    }
    
    @objc private func addNewReminder() {
        let newReminderViewController = NewReminderViewController()
        newReminderViewController.title = Constants.newReminderTitle
        let newReminderVC = UINavigationController(rootViewController: newReminderViewController)
        newReminderVC.modalPresentationStyle = .pageSheet
        newReminderViewController.newReminderDelegate = self
        present(newReminderVC, animated: true, completion: nil)
    }
    
}

extension AllRemindersViewController: UITableViewDelegate, UITableViewDataSource, NewReminderDelegate {
    
    func didAddNewReminder(title: String, body: String, time: String) {
        viewModel.addReminder(title: title, body: body, time: time)
        DispatchQueue.main.async {
            self.remindersTableView.reloadData()
        }
    }
    
    /// didSelectRowAt delegate method
    /// - Parameters:
    ///   - tableView: Reminder TableView
    ///   - indexPath: Selected row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailsViewController = DetailReminderViewController(reminder: ReminderModel(title: viewModel.reminders[indexPath.row].title, body: viewModel.reminders[indexPath.row].body, time: viewModel.reminders[indexPath.row].time))
        
        detailsViewController.title = Constants.detailViewControllerTitle
        let navController = UINavigationController(rootViewController: detailsViewController)
        navController.modalPresentationStyle = .pageSheet
        present(navController, animated: true, completion: nil)
        
        
    }
    
    /// numberOfRowsInSection delegate method
    /// - Parameters:
    ///   - tableView: Reminder TableView
    ///   - section: Section description
    /// - Returns: Number of Reminder rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.reminders.count
    }
    
    
    
    
    
    /// cellForItemAt  delegate method
    /// - Parameters:
    ///   - tableView: Reminder TableView
    ///   - indexPath: Selected row
    /// - Returns: Contents for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reminderCellIdentifier, for: indexPath) as? RemindersCell else { return UITableViewCell() }
        cell.fillReminderData(reminderTitle: viewModel.reminders[indexPath.row].title, reminderTime: viewModel.reminders[indexPath.row].time)
        print(cell)
        return cell
    }
    
    
    /// TableViewCell Height
    /// - Parameters:
    ///   - tableView: Pokemon TableView
    ///   - indexPath: Each row
    /// - Returns: Height for each row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
