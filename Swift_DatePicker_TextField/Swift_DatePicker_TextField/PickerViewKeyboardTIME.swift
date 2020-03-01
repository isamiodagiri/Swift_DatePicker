//
//  PickerViewKeyboardTIME.swift
//  Swift_DatePicker_TextField
//
//  Created by Isami Odagiri on 2020/03/01.
//  Copyright © 2020 Isami Odagiri. All rights reserved.
//

import Foundation
import UIKit

class PickerViewKeyboardTIME: UITextField {
    
    let datePicker: UIDatePicker = {
        let dp = UIDatePicker()
        dp.datePickerMode = .time
        dp.timeZone = NSTimeZone.local
        dp.locale = Locale.current
        dp.addTarget(self, action: #selector(dateSelect), for: .valueChanged)
        return dp
    }()
    
    lazy var toolbar: UIToolbar = {
        let tb = UIToolbar()
        tb.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 44)
        let flexSpaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(PickerViewKeyboardTIME.donePicker))
        let toolbarItems = [flexSpaceItem, doneButtonItem]
        tb.setItems(toolbarItems, animated: true)
        return tb
    }()
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setDate()
    }
    
    func setDate() {
        self.inputView = datePicker
        self.inputAccessoryView = toolbar
    }
    
    @objc func dateSelect(){
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        self.text = "\(formatter.string(from: datePicker.date))"
    }
    
    @objc func donePicker() {
        self.resignFirstResponder()
    }
}
