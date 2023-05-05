//
//  SavedCell.swift
//  iReminder
//
//  Created by moMMo on 5/5/23.
//

import UIKit

class SavedCell: UITableViewCell {
    
    
    //MARK:  Variables
    
    
    private let savedCellStackView = UIStackView()
    
    
    
    //MARK: LifeCycles
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        contentView.layer.cornerRadius = 15
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        contentView.backgroundColor = UIColor(named: "SavedReminderCellColor")
        // favoritePokemonNameAndLableConstraint
        
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .red
        configureMainStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: UI Outlets
    
    /// Creating SavedReminderImage
    private lazy var savedReminderImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = false
        image.tintColor = .systemRed
        image.layer.cornerRadius = 15
        image.image = UIImage(systemName: "heart")
        return image
    }()
    
    
    
    /// Creating SavedReminderLable
    private lazy var savedReminderLable : UILabel = {
        let lable = UILabel()
        lable.textColor = .white
        lable.textAlignment = .center
        lable.font = UIFont(name: "Chalkboard", size: 20)
        return lable
    }()
    
    
    /// Configuring configuringMainStackView
    private func configureMainStackView() {
        contentView.addSubview(savedCellStackView)
        savedCellStackView.axis = .horizontal
        savedCellStackView.distribution = .fill
        savedCellStackView.spacing = 30
        
    }
    
    
    /// Configuring setupMainStackViewConstraint
    
    private func setupMainStackViewConstraint() {
        savedCellStackView.translatesAutoresizingMaskIntoConstraints = false
        savedCellStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        savedCellStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        savedCellStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        savedCellStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
    }
    
    
    /// Configuring addRemindersImageAndNameToStackView
    
    private func addRemindersImageAndNameToStackView() {
        savedCellStackView.addArrangedSubview(savedReminderImage)
        savedCellStackView.addArrangedSubview(savedReminderLable)
    }
    
    
    //MARK: Methods
    
    func fillSavedReminderData(reminderName: String, reminderImage: UIImage) {
        savedReminderLable.text = reminderName
        savedReminderImage.image = reminderImage
    }
    
    
}
    
    //MARK: Extension
    
    
    extension SavedCell {
        override func awakeFromNib() {
            super.awakeFromNib()
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
        
        override func prepareForReuse() {
            super.prepareForReuse()
            savedReminderImage.image = nil
        }
    }
    
    
    
    
    
    
    
    
    
    


