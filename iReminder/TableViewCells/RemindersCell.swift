//
//  RemindersCell.swift
//  iReminder
//
//  Created by moMMo on 5/5/23.
//

import UIKit

class RemindersCell: UITableViewCell {


    //MARK: - Application LifeCycle

    /// Layout SubView
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 20
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        reminderImage.image = UIImage(systemName: "hourglass")
        reminderImageConstraint()
        reminderNameLableConstraint()
        reminderTimeLableConstraint()

    }
    
   

    /// Initializing Cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(reminderImage)
        contentView.addSubview(reminderTitleLable)
        contentView.addSubview(reminderTimeLable)
        contentView.backgroundColor = UIColor(named: Constants.allRemindersCellColor)
    }


    /// Required Cell NSCoder
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    //MARK: - UI Outlets


    /// Creating Reminder Image Cell
    private lazy var reminderImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = false
        image.tintColor = .white
        image.layer.cornerRadius = 20
        return image
    }()


    /// Creating Reminder TitleLable Cell
    private lazy var reminderTitleLable : UILabel = {
        let lable = UILabel()
        lable.textColor = .white
        lable.textAlignment = .left
        lable.font = UIFont(name: "Chalkboard", size: 20)
        return lable
    }()


    /// Creating Reminder NameLable Cell
    private lazy var reminderTimeLable : UILabel = {
        let lable = UILabel()
        lable.textColor = .white
        lable.textAlignment = .left
        lable.font = UIFont(name: "Chalkboard", size: 20)
        return lable
    }()


    /// Set Reminder Image Constraint
    private func reminderImageConstraint() {
        reminderImage.translatesAutoresizingMaskIntoConstraints = false
        reminderImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        reminderImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        reminderImage.widthAnchor.constraint(greaterThanOrEqualTo: contentView.heightAnchor, multiplier: 0.6).isActive = true
        reminderImage.heightAnchor.constraint(equalTo: reminderImage.widthAnchor).isActive                                  = true
        reminderImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true

    }


    /// Set Reminder TitleLable Constraint
    private func reminderNameLableConstraint() {
        reminderTitleLable.translatesAutoresizingMaskIntoConstraints = false
        reminderTitleLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        reminderTitleLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        reminderTitleLable.leadingAnchor.constraint(equalTo: reminderImage.trailingAnchor, constant: 10).isActive = true
        reminderTitleLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }


    /// Set Reminder TimeLable Constraint
    private func reminderTimeLableConstraint() {
        reminderTimeLable.translatesAutoresizingMaskIntoConstraints = false
        reminderTimeLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        reminderTimeLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        reminderTimeLable.leadingAnchor.constraint(equalTo: reminderTitleLable.trailingAnchor, constant: 10).isActive = true
        reminderTimeLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }


    //MARK: - Methods

    /// Filling Cell Data
    func fillReminderData(reminderTitle: String, reminderTime: String) {
        reminderTitleLable.text = reminderTitle
        reminderTimeLable.text = reminderTime
    }
}

// MARK: - Extensions

extension RemindersCell {


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}










