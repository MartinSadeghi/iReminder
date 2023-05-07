//
//  ViewController.swift
//  iReminder
//
//  Created by moMMo on 5/4/23.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainTabBarViewController = UITabBarController()

    
    
    //MARK: Application LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBarController()
        navigationController?.navigationBar.backgroundColor = UIColor(named: "AllRemindersVCBackgroundColor")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupTabBarController()
    }
    
    //MARK: Methods
    
    /// Configuring TabBarController
    private func configureTabBarController() {
//        mainTabBarViewController.tabBar.backgroundColor = .systemGray5
        mainTabBarViewController.tabBar.tintColor       = .white
    }
    
    
    
    /// Setting up TabBarConstraint
    private func setupTabBarController() {
        let allReminderViewController = UINavigationController(rootViewController: AllRemindersViewController())
        allReminderViewController.tabBarItem.image = UIImage(systemName: "folder")
        allReminderViewController.tabBarItem.title = "Reminders"
        allReminderViewController.tabBarItem.selectedImage = UIImage(systemName: "folder.fill")
        
        let savedRemindersViewController = UINavigationController(rootViewController: SavedRemindersViewController())
        savedRemindersViewController.tabBarItem.image = UIImage(systemName: "opticaldiscdrive")
        savedRemindersViewController.tabBarItem.selectedImage = UIImage(systemName: "opticaldiscdrive.fill")
        savedRemindersViewController.tabBarItem.title = "Saved"
        
        
        mainTabBarViewController.setViewControllers([allReminderViewController, savedRemindersViewController], animated: false)
        mainTabBarViewController.modalPresentationStyle = .fullScreen
        present(mainTabBarViewController, animated: true)
        
    }


}

