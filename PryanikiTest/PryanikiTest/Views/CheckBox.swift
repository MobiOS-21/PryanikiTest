//
//  CheckBox.swift
//  PryanikiTest
//
//  Created by Александр Дергилёв on 02.02.2021.
//

import UIKit

class CheckBox: UIButton {
    // Bool property
    private let id: Int
    private let text: String
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.layer.borderColor = UIColor.red.cgColor
            } else {
                self.layer.borderColor = UIColor.black.cgColor
            }
        }
    }
    
    init(id: Int, text: String) {
        self.id = id
        self.text = text
        super.init(frame: .infinite)
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 5
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = false
        self.setTitle(text, for: .normal)
        self.setTitleColor(.black, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
            print("id: \(id), text: \(text)")
        }
    }
}
