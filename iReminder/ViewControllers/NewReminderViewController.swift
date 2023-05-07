//
//  NewReminderViewController.swift
//  iReminder
//
//  Created by moMMo on 5/5/23.
//

import UIKit
import UserNotifications



protocol NewReminderDelegate: AnyObject {
    func didAddNewReminder(title: String, body: String, time: String)
}


class NewReminderViewController: UIViewController {

    let newReminderStackView = UIStackView()
    let notificationCenter = UNUserNotificationCenter.current()
    weak var newReminderDelegate: NewReminderDelegate?


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: Constants.newRemindersVCBackgroundColor)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        navigationItem.rightBarButtonItem = doneButton
        configureNewReminderStackView()
        notificationAllowance()
    }

    private lazy var titleTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.backgroundColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: Constants.textFieldTitlePlaceHolder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        textField.textColor = .black
        textField.layer.cornerRadius = 5
        return textField
    }()


    private lazy var bodyTextField : UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 45).isActive = true
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.attributedPlaceholder = NSAttributedString(string: Constants.textFieldBodyPlaceHolder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .white
        textField.textColor = .black
        return textField
    }()



    private lazy var datePickerSelected : UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .dateAndTime
        picker.minimumDate = Date()
        picker.backgroundColor = UIColor.red
        picker.maximumDate = Calendar.current.date(byAdding: .year, value: 1, to: Date())
        picker.backgroundColor = .white
        return picker
    }()


    private lazy var scheduleButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Constants.scheduleButtonTitle, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = button.frame.size.height / 2
        button.addTarget(self, action: #selector(scheduleButtonTapped), for: .touchUpInside)

        return button
    }()


    @objc private func scheduleButtonTapped() {
        setupNotification()
    }



     func formatterDate(date : Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM y HH:mm"
        return formatter.string(from: date)
    }



    private func configureNewReminderStackView() {
        view.addSubview(newReminderStackView)
        newReminderStackView.axis = .vertical
        newReminderStackView.spacing = 16
        newReminderStackView.alignment = .fill
        setupNewReminderStackViewConstraint()
        addElementsToNewReminderStackView()


    }

    private func setupNewReminderStackViewConstraint() {
        newReminderStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newReminderStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            newReminderStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            newReminderStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            newReminderStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: 20)
        ])

    }

    private func addElementsToNewReminderStackView() {
        newReminderStackView.addArrangedSubview(titleTextField)
        newReminderStackView.addArrangedSubview(bodyTextField)
        newReminderStackView.addArrangedSubview(datePickerSelected)
        newReminderStackView.addArrangedSubview(scheduleButton)

    }

    @objc func doneButtonTapped() {
        dismiss(animated: true) {
        }
    }

    private func notificationAllowance() {
        notificationCenter.requestAuthorization(options: [.alert, .sound]) { (success, error) in
            if !success {
                print("Notification denied!")
            }
        }
    }
}



extension NewReminderViewController {


    func setupNotification() {
        notificationCenter.getNotificationSettings { (settings) in
            DispatchQueue.main.async {
                guard let title = self.titleTextField.text else { return }
                guard let message = self.bodyTextField.text else { return }
                let date = self.datePickerSelected.date
                if settings.authorizationStatus == .authorized {
                    let content = UNMutableNotificationContent()
                    content.title = title
                    content.body = message
                    let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date)
                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
                    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                    self.notificationCenter.add(request) { error in
                        if let err = error {
                            print("Error: \(err.localizedDescription)")
                            return
                        }
                    }
                    let notifAlert = UIAlertController(title: Constants.reminderScheduleNotifAlertTitle, message: "At \(self.formatterDate(date: date))", preferredStyle: .alert)
                    notifAlert.addAction(UIAlertAction(title: Constants.reminderScheduleNotifActionTitle, style: .default))
                    self.present(notifAlert, animated: true)
                } else {
                    let notifAlert = UIAlertController(title: Constants.reminderScheduleGoToSettingTitle, message: Constants.reminderScheduleGoToSettingMessage, preferredStyle: .alert)
                    let goToSettings = UIAlertAction(title: Constants.reminderSchedulSettingButtonTitle, style: .default) { (_) in
                        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
                        if UIApplication.shared.canOpenURL(settingsURL) {
                            UIApplication.shared.open(settingsURL)
                        }
                    }
                    notifAlert.addAction(goToSettings)
                    notifAlert.addAction(UIAlertAction(title: Constants.reminderScheduleNotifCancleButtonTitle, style: .default))
                    self.present(notifAlert, animated: true)
                }
            }

        }

        guard let titleTextField = titleTextField.text else { return }
        guard let bodyTextField = bodyTextField.text else { return }
        let time = formatterDate(date: datePickerSelected.date)
        newReminderDelegate?.didAddNewReminder(title: titleTextField, body: bodyTextField, time: time)
    }
}
