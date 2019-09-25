//
//  QRHIstoryViewController.swift
//  QRScanner
//
//  Created by Stephen Keable on 24/09/2019.
//  Copyright © 2019 KM, Abhilash. All rights reserved.
//

import Foundation
import UIKit

class QRHistoryViewController: UITableViewController {

    @IBOutlet weak var QRHistoryTableView: UITableView!
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate.qrHistory.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QRHistoryTableCell", for: indexPath)
        
        cell.textLabel?.text = delegate.qrHistory[indexPath.row]

        return cell
    }
    
    @IBAction func shareQRHistory(_ sender: Any) {
        
        let qrHistoryString = delegate.qrHistory.joined(separator: "\n")
        let shareItems = [qrHistoryString]
        let shareSheet = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        present(shareSheet, animated: true)
    }
    
    @IBAction func clearHistory(_ sender: Any) {
        
        delegate.qrHistory = [String]()
        _ = navigationController?.popToRootViewController(animated: true)
    }
}
