//
//  SavedCell.swift
//  iReminder
//
//  Created by moMMo on 5/5/23.
//

import UIKit

class SavedCell: UITableViewCell {
    
    
    //MARK: -  Variables
    
    private let savedCellStackView = UIStackView()
    
    
    
    //MARK: - LifeCycles
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 15
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        contentView.backgroundColor = UIColor(named: Constants.savedReminderCellColor)
        savedReminderImage.image = UIImage(systemName: Constants.cellReminderSystemImageName)
        savedReminderImageConstraint()
        savedReminderTitleLableConstraint()
        savedReminderTimeLableConstraint()
    }
    
    /// Initializing Cell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .red
        contentView.addSubview(savedReminderImage)
        contentView.addSubview(savedReminderTitleLable)
        contentView.addSubview(savedReminderTimeLable)

        configureMainStackView()
    }
    
    
    /// Required Cell NSCoder
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    
    //MARK: - UI Outlets
    
    /// Creating SavedReminderImage
    private lazy var savedReminderImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = false
//        image.image = UIImage(systemName: "opticaldiscdrive")
        image.tintColor = .systemRed
        image.layer.cornerRadius = 15
        return image
    }()
    
    
    
    /// Creating SavedReminderLable
    private lazy var savedReminderTitleLable : UILabel = {
        let lable = UILabel()
        lable.textColor = .white
        lable.textAlignment = .left
        lable.font = UIFont(name: "Chalkboard", size: 20)
        return lable
    }()
    
    
    private lazy var savedReminderTimeLable : UILabel = {
        let lable = UILabel()
        lable.textColor = .white
        lable.textAlignment = .center
        lable.text = "afsfdngmtktujyrthergfads"
        lable.font = UIFont(name: "Chalkboard", size: 20)
        return lable
    }()
    
    
    /// Configuring configuringMainStackView
    private func configureMainStackView() {
        contentView.addSubview(savedCellStackView)
        savedCellStackView.axis = .horizontal
        savedCellStackView.distribution = .fill
        savedCellStackView.spacing = 30
        setupMainStackViewConstraint()

    }
    
    
    /// Configuring setupMainStackViewConstraint
    private func setupMainStackViewConstraint() {
        savedCellStackView.translatesAutoresizingMaskIntoConstraints = false
        savedCellStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        savedCellStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        savedCellStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        savedCellStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
    }
    
    /// Set Reminder Image Constraint
    private func savedReminderImageConstraint() {
        savedReminderImage.translatesAutoresizingMaskIntoConstraints = false
        savedReminderImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        savedReminderImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        savedReminderImage.widthAnchor.constraint(greaterThanOrEqualTo: contentView.heightAnchor, multiplier: 0.6).isActive = true
        savedReminderImage.heightAnchor.constraint(equalTo: savedReminderImage.widthAnchor).isActive                                  = true
        savedReminderImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true

    }


    /// Set Reminder TitleLable Constraint
    private func savedReminderTitleLableConstraint() {
        savedReminderTitleLable.translatesAutoresizingMaskIntoConstraints = false
        savedReminderTitleLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        savedReminderTitleLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        savedReminderTitleLable.leadingAnchor.constraint(equalTo: savedReminderImage.trailingAnchor, constant: 10).isActive = true
        savedReminderTitleLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }


    /// Set Reminder TimeLable Constraint
    private func savedReminderTimeLableConstraint() {
        savedReminderTimeLable.translatesAutoresizingMaskIntoConstraints = false
        savedReminderTimeLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        savedReminderTimeLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        savedReminderTimeLable.leadingAnchor.constraint(equalTo: savedReminderTitleLable.trailingAnchor, constant: 10).isActive = true
        savedReminderTimeLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }
    
    
    /// Configuring addRemindersImageAndNameToStackView
    private func addRemindersImageAndNameToStackView() {
        savedCellStackView.addArrangedSubview(savedReminderImage)
        savedCellStackView.addArrangedSubview(savedReminderTitleLable)
        savedCellStackView.addArrangedSubview(savedReminderTimeLable)
    }
    
    
    //MARK: - Methods
    
    func fillSavedReminderData(reminderTitle: String, reminderTime: String) {
        savedReminderTitleLable.text = reminderTitle
        savedReminderTimeLable.text = reminderTime
    }
    
    
}
    
    //MARK: - Extension
    
    
    extension SavedCell {
        override func awakeFromNib() {
            super.awakeFromNib()
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
        
        override func prepareForReuse() {
            super.prepareForReuse()
        }
    }
    
    
    
    
    
    
    
    
    
    


