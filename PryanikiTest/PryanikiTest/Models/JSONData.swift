//
//  JSONData.swift
//  PryanikiTest
//
//  Created by Александр Дергилёв on 02.02.2021.
//

import Foundation

class JSONData: Codable {
    let data: [DataInfo]
    let view: [String]
    
    init(data: [DataInfo], view: [String]) {
        self.data = data
        self.view = view
    }
}

// MARK: - Datum
class DataInfo: Codable {
    let name: String
    let data: DataClass
    
    init(name: String, data: DataClass) {
        self.name = name
        self.data = data
    }
}

// MARK: - DataClass
class DataClass: Codable {
    let text: String?
    let url: String?
    let selectedID: Int?
    let variants: [Variant]?
    
    enum CodingKeys: String, CodingKey {
        case text, url
        case selectedID = "selectedId"
        case variants
    }
    
    init(text: String?, url: String?, selectedID: Int?, variants: [Variant]?) {
        self.text = text
        self.url = url
        self.selectedID = selectedID
        self.variants = variants
    }
}

// MARK: - Variant
class Variant: Codable {
    let id: Int
    let text: String
    
    init(id: Int, text: String) {
        self.id = id
        self.text = text
    }
}
