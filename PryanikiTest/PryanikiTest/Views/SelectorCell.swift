//
//  SelectorCell.swift
//  PryanikiTest
//
//  Created by Александр Дергилёв on 02.02.2021.
//

import UIKit

class SelectorCell: UITableViewCell {
    @IBOutlet weak var stackView: UIStackView!
    
    private var arrayOfButton: [UIView] = []
    
    func configureCell(with data: DataClass?) {
        guard let selectors = data?.variants else {
            return
        }
        
        for selector in selectors {
            let view = CheckBox(id: selector.id, text: selector.text)
            stackView.addArrangedSubview(view)
        }
    }
}
