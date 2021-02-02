//
//  Constants.swift
//  PryanikiTest
//
//  Created by Александр Дергилёв on 02.02.2021.
//

import Foundation
import UIKit

let BASE_URL = "https://pryaniky.com/static/json/sample.json"

typealias DownloadComplete = (_ data: JSONData?, _ status: Bool, _ message: String) -> Void

enum CellType: String {
    case image = "picture"
    case label = "hz"
    case selector = "selector"
}
