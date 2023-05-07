//
//  LocalizedExtension.swift
//  iReminder
//
//  Created by moMMo on 5/7/23.
//

import Foundation



extension String {
    func localized() -> String {
        return NSLocalizedString(self,
                                 tableName: "Localizable",
                                 bundle: .main,
                                 value: self,
                                 comment: self)
    }
}
