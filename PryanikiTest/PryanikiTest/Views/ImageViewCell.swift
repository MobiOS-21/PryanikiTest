//
//  ImageViewCell.swift
//  PryanikiTest
//
//  Created by Александр Дергилёв on 02.02.2021.
//

import UIKit
import Kingfisher

class ImageViewCell: UITableViewCell {
    @IBOutlet weak var pictureView: UIImageView!
    
    func configureCell(with data: DataClass?) {
        pictureView.kf.indicatorType = .activity
        guard let url = URL(string: data?.url ?? "") else { return }
        pictureView.kf.setImage(with: url)
    }
}
