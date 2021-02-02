//
//  ViewController.swift
//  PryanikiTest
//
//  Created by Александр Дергилёв on 02.02.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var viewsInfo: [CellType: DataInfo] = [:]
    var numberOfCells: [CellType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadData()
    }
    
    func loadData() {
        ViewDataService.instance.downloadViewsInfo()
        ViewDataService.instance.completionHandler { [weak self] (data, status, message) in
            guard let sself = self else { return }
            if status, let data = data {
                sself.createViewsList(info: data)
                sself.tableView.reloadData()
            }
        }
    }
    
    private func createViewsList(info: JSONData) {
        for view in info.view {
            switch view {
            case CellType.label.rawValue:
                self.numberOfCells.append(.label)
                self.viewsInfo[.label] = info.data.first(where: { $0.name == CellType.label.rawValue })
            case CellType.selector.rawValue:
                self.numberOfCells.append(.selector)
                self.viewsInfo[.selector] = info.data.first(where: { $0.name == CellType.selector.rawValue  })
            case CellType.image.rawValue:
                self.numberOfCells.append(.image)
                self.viewsInfo[.image] = info.data.first(where: { $0.name == CellType.image.rawValue })
            default:
                break
            }
        }
    }
    
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch numberOfCells[indexPath.row] {
        case .image:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageViewCell
            cell.configureCell(with: viewsInfo[.image]?.data)
            return cell
        case .label:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! LabelCell
            cell.textLabel?.text = viewsInfo[.label]?.data.text
            return cell
        case.selector:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectorCell", for: indexPath) as! SelectorCell
            cell.configureCell(with: viewsInfo[.selector]?.data)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch numberOfCells[indexPath.row] {
        case .image:
            return 200
        case .selector:
            return CGFloat((viewsInfo[.selector]?.data.variants?.count ?? 0) * 50)
        default:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellInfo = viewsInfo[numberOfCells[indexPath.row]] else { return }
        print("select cell with type: \(cellInfo.name)")
    }
}

