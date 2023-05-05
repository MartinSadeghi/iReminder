//
//  RemindersCell.swift
//  iReminder
//
//  Created by moMMo on 5/5/23.
//

import UIKit

class RemindersCell: UITableViewCell {
    
    
    
    
    //MARK: Application LifeCycle
    
    /// Layout SubViews
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 20
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        reminderImageConstraint()
        reminderNameLableConstraint()
        
    }
    
    /// Initializing Cell
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(reminderImage)
        contentView.addSubview(reminderNameLable)
        contentView.backgroundColor = UIColor(named: "AllRemindersCellColor")
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
        image.image = UIImage(systemName: "hourglass.badge.plus")
        image.tintColor = .white
        image.layer.cornerRadius = 20
        return image
    }()
    
    
    /// Creating Reminder NameLable Cell
    private lazy var reminderNameLable : UILabel = {
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
    
    
    /// Set Reminder NameLable Constraint
    private func reminderNameLableConstraint() {
        reminderNameLable.translatesAutoresizingMaskIntoConstraints = false
        reminderNameLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        reminderNameLable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        reminderNameLable.leadingAnchor.constraint(equalTo: reminderImage.trailingAnchor, constant: 10).isActive = true
        reminderNameLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }
    
    //MARK: Methods
    
    /// Filling Cell Data
    func fillReminderData(reminderName : String) {
        reminderNameLable.text = reminderName
    }
    
    
    
}
    
    // MARK: Extensions
    
    extension RemindersCell {
        
        
        override func awakeFromNib() {
            super.awakeFromNib()
        }

        override func prepareForReuse() {
            super.prepareForReuse()
            reminderImage.image = nil
        }
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    

