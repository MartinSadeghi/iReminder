//
//  RemindeDetailsViewController.swift
//  iReminder
//
//  Created by moMMo on 5/5/23.
//

import UIKit


protocol SavedReminderDelegate: AnyObject {
    func didSavedReminder(reminder: ReminderModel)
}


class DetailReminderViewController: UIViewController {


    let reminderDetailsStackView = UIStackView()
    let userDefaultsManager = UserDefaultsManager()
    var reminder : ReminderModel!
    weak var savedReminderDelegate : SavedReminderDelegate?



    init(reminder: ReminderModel) {
        self.reminder = reminder
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    //MARK: -  Application LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: Constants.detailsReminderVCBackgroundColor)

        configureReminderDetailsStackView()
        tabBarSetup()
        fillReminderDetails()
    }


    //MARK: -  Application LifeCycle


    /// Configuring Left and Right Tab Bar
    func tabBarSetup() {
        let saveButton = UIBarButtonItem(title: Constants.saveButtonTitle, style: .done, target: self, action: #selector(saveButtonTapped))
            navigationItem.rightBarButtonItem = saveButton

        let closeButton = UIBarButtonItem(title: Constants.editButtonTitle, style: .done, target: self, action: #selector(closeButtonTapped))
            navigationItem.leftBarButtonItem = closeButton
    }


    //MARK: - Methods


    /// Filling Details of each reminder
    func fillReminderDetails() {
        reminderTitleLable.text = reminder.title
        reminderBodyLable.text  = "To do: \(reminder.body)"
        reminderTimeLable.text  = "Time: \(reminder.time)"
    }


    /// Close Button Tapped
    @objc func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }



    /// Save Button Tapped
    @objc func saveButtonTapped() {
        let saveButtonAlert = UIAlertController(title: Constants.saveButtonAlertTitle, message: Constants.saveButtonAlertMessage, preferredStyle: UIAlertController.Style.alert)
        saveButtonAlert.addAction(UIAlertAction(title: Constants.saveButtonAlertActionTitleYes, style: UIAlertAction.Style.default, handler: { [weak self] (handler) in
            guard let self = self else { return }
            self.saveReminder()
        }))

        saveButtonAlert.addAction((UIAlertAction(title: Constants.saveButtonAlertActionTitleNo, style: UIAlertAction.Style.cancel, handler: nil)))
        present(saveButtonAlert, animated: true)

    }


    /// Save the Selected reminder
    func saveReminder() {
        let savedReminder = ReminderModel(title: reminder.title, body: reminder.body, time: reminder.time)
        userDefaultsManager.saveReminder(reminder: savedReminder)
        print(savedReminder)
        dismiss(animated: true)
    }



    //MARK: -   UI Outlets

    /// Creating reminderTitleLable
    private lazy var reminderTitleLable : UILabel = {
        let lable = UILabel()
        lable.textAlignment = .center
        lable.textColor = .systemBlue
        lable.font = UIFont.boldSystemFont(ofSize: 25)
        return lable
    }()

    /// Creating reminderBodyLable
    private lazy var reminderBodyLable : UILabel = {
        let lable = UILabel()
        lable.textAlignment = .left
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 20)
        return lable
    }()



    /// Creating reminderBodyLable
    private lazy var reminderTimeLable : UILabel = {
        let lable = UILabel()
        lable.textAlignment = .left
        lable.textColor = .systemRed
        lable.font = UIFont.systemFont(ofSize: 20)
        return lable
    }()



    /// Configuring Details StackView
    private func configureReminderDetailsStackView() {
        view.addSubview(reminderDetailsStackView)
        reminderDetailsStackView.axis = .vertical
        reminderDetailsStackView.spacing = 16
        reminderDetailsStackView.alignment = .fill
        setupReminderDetailsStackViewConstraint()
        addElementsDetailsToStackView()

    }

    /// Setting up setupReminderDetailsStackViewConstraint
    private func setupReminderDetailsStackViewConstraint() {
        reminderDetailsStackView.translatesAutoresizingMaskIntoConstraints = false
        reminderDetailsStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        reminderDetailsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        reminderDetailsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }



    /// Adding addElementsDetailsToStackView
    private func addElementsDetailsToStackView() {
        reminderDetailsStackView.addArrangedSubview(reminderTitleLable)
        reminderDetailsStackView.addArrangedSubview(reminderBodyLable)
        reminderDetailsStackView.addArrangedSubview(reminderTimeLable)
    }

}


