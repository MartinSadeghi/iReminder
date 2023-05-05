//
//  FirstViewController.swift
//  iReminder
//
//  Created by moMMo on 5/4/23.
//

import UIKit

class AllRemindersViewController: UIViewController {

    

    var reminders = [
        Reminder(name: "Pay rent", detail: "Rent is due on the 1st of the month."),
        Reminder(name: "Buy groceries", detail: "Milk, eggs, bread, and cheese."),
        Reminder(name: "Doctor appointment", detail: "Checkup with Dr. Smith on Friday at 3pm.")
    ]
    
//    var reminders   : [Reminder] = []

    
    deinit {}
    
   
    
    
    
    //MARK: -  Application LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Reminders"
        navigationController?.navigationBar.backgroundColor = .black
        configureTableView()
        view.backgroundColor = UIColor(named: "AllRemindersVCBackgroundColor")
        setupRemindersTableViewConstraint()
        setupAddBarButton()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    //MARK: -   UI Outlets
    
    
    /// TableView
    private lazy var remindersTableView : UITableView = {
        let table             = UITableView()
        table.register(RemindersCell.self, forCellReuseIdentifier: Constants.reminderCellIdentifier)
        return table
    }()
    
    ///  Configuration for TableView
    func configureTableView() {
        remindersTableView.delegate        = self
        remindersTableView.dataSource      = self
        remindersTableView.separatorStyle = .none

    }




//MARK: -  Methods





    /// setupReminderTableViewConstraint

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
    
    @objc func addNewReminder() {
        let newReminderViewController = NewReminderViewController()
        newReminderViewController.title = "New Reminder"
        let navController = UINavigationController(rootViewController: newReminderViewController)
        navController.modalPresentationStyle = .pageSheet
        present(navController, animated: true, completion: nil)

    }















}


//MARK: - TableView Extensions

extension AllRemindersViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    /// numberOfRowsInSection delegate method
    /// - Parameters:
    ///   - tableView: Reminder TableView
    ///   - section: section description
    /// - Returns: Number of Reminder rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return reminders.count
        }
    
    
    
    
    
    /// cellForItemAt contents
    /// - Parameters:
    ///   - tableView: Reminder TableView
    ///   - indexPath: Selected row
    /// - Returns: Contents for each row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reminderCellIdentifier, for: indexPath) as? RemindersCell else { return UITableViewCell() }

        cell.fillReminderData(reminderName: reminders[indexPath.row].name)
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
    
    
    /// didSelectItemAt to show after Selected
    /// - Parameters:
    ///   - tableView: Pokemon TableView
    ///   - indexPath: Each row
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        let detailsViewController = DetailsPokemonViewController(pokemon: PokemonDataModel(name: pokemons[indexPath.row].name, url: pokemons[indexPath.row].url), id: indexPath.row)
//        self.present(detailsViewController, animated: true)
//    }
    
    
    
    
}
