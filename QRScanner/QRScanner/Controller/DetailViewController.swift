//
//  DetailViewController.swift
//  QRScanner
//
//  Created by KM, Abhilash a on 11/03/19.
//  Copyright © 2019 KM, Abhilash. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailLabel: CopyLabel!
    
    var qrData: QRData?
    //var qrHistory: Array<String> = Array()
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLabel.text = qrData?.codeString
        UIPasteboard.general.string = detailLabel.text
        // showToast(message : "Text copied to clipboard")
        
        if let qrString = qrData?.codeString {
            delegate.qrHistory.append(qrString)
        }
    }
    
    @IBAction func shareQRCode(_ sender: Any) {
        
        let shareItems = [detailLabel.text]
        let shareSheet = UIActivityViewController(activityItems: shareItems as! [String], applicationActivities: nil)
        present(shareSheet, animated: true)
    }
}
