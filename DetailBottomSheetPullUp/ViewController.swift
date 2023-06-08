//
//  ViewController.swift
//  DetailBottomSheetPullUp
//
//  Created by Vansh Dubey on 07/06/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var staffBlock = StaffBlockView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.tableHeaderView = staffBlock
        
        self.staffBlock.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height*0.38)
        
        self.myTableView.register(UINib(nibName: "AssetTimelineTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        self.myTableView.register(UINib(nibName: "AdditionalAssetInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "cell2")
        
        self.myTableView.register(UINib(nibName: "AssetValueInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "cell3")
        
        
        (self.staffBlock.button1Tapped)={
            self.staffBlock.currentTab = "AssetTimelineTableViewCell"
            self.myTableView.reloadData()
        }
        
        (self.staffBlock.button2Tapped)={
            self.staffBlock.currentTab = "AdditionalAssetInfoTableViewCell"
            self.myTableView.reloadData()
        }
        (self.staffBlock.button3Tapped)={
            self.staffBlock.currentTab = "AssetValueInfoTableViewCell"
            self.myTableView.reloadData()
        }
        
        
    }
}

extension ViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.staffBlock.currentTab{
        case "AssetTimelineTableViewCell":
            let cell = self.myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AssetTimelineTableViewCell
            return cell
        case "AdditionalAssetInfoTableViewCell":
            let cell = self.myTableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! AdditionalAssetInfoTableViewCell
            return cell
        case "AssetValueInfoTableViewCell":
            let cell = self.myTableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! AssetValueInfoTableViewCell
            return cell
        default:
            let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AssetTimelineTableViewCell
            return cell
        }
    }
    
    
}
