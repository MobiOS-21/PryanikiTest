//
//  ViewDataService.swift
//  PryanikiTest
//
//  Created by Александр Дергилёв on 02.02.2021.
//

import Foundation
import Alamofire

class ViewDataService {
    static let instance = ViewDataService()
    var callBack: DownloadComplete?
    
    func downloadViewsInfo() {
        let url = BASE_URL
        AF.request(url, method: .get).response { responseData in
            guard let data = responseData.data else {
                self.callBack?(nil, false, "")
                return
            }
            do {
                let data = try JSONDecoder().decode(JSONData.self, from: data)
                self.callBack?(data, true, "")
            } catch {
                self.callBack?(nil, false, error.localizedDescription)
            }
        }
    }
    
    func completionHandler(callBack: @escaping DownloadComplete) {
        self.callBack = callBack
    }
}
