//
//  SearchViewController.swift
//  Bridge
//
//  Created by Sajjad Aboutalebi on 3/7/18.
//  Copyright © 2018 Sajjad Aboutalebi. All rights reserved.
//

import UIKit
import MZDownloadManager
import NVActivityIndicatorView
import SnapKit

class SearchViewController: UIViewController {
    
    var downloadManager: MZDownloadManager? = nil
    
    @IBOutlet weak var linkfield: UITextField!
    @IBAction func search(_ sender: Any) {
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(ActivityData(type: .ballScaleRippleMultiple))
        if let url = linkfield.text {
            if url != "" {
                API.shared.extract(url, completion: { (entries) in
                    self.entriesActions(entries)
                    DispatchQueue.main.async {
                        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
                    }
                })
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        waitforServer()
        
    }

    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        linkfield.snp.remakeConstraints { (make) in
            make.height.equalTo(40)
            make.leftMargin.equalToSuperview().offset(10)
            make.rightMargin.equalToSuperview().offset(-10)
            //make.centerX.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview().offset(-30)
        }
        
    }
    
    func entriesActions(_ ‌entries: Entires) {
        let allertController = UIAlertController(title: nil, message: "Select Video", preferredStyle: .actionSheet)
        for entry in ‌entries.entries {
            let action = UIAlertAction(title: entry.title, style: .default, handler: { (action) in
                self.formatsAction(entry)
            })
            allertController.addAction(action)
        }
        allertController.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        presentAlertview(allertController)
    }
    
    func formatsAction(_ entry: Entity){
        let allertController = UIAlertController(title: nil, message: entry.title, preferredStyle: .actionSheet)
        for fm in entry.formats {
            let action = UIAlertAction(title: fm.format, style: .default, handler: { (action) in
                self.downloadManager?.addDownloadTask("\(entry.title).\(fm.ext)", fileURL: fm.url)
            })
            allertController.addAction(action)
        }
        allertController.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        presentAlertview(allertController)
    }
    
    
    func presentAlertview(_ alertController: UIAlertController) {
        if let popoverController = alertController.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        present(alertController, animated: true, completion: nil)
        
    }

    func waitforServer() {
        let myqueue = DispatchQueue(label: "waitforsercer")
        myqueue.async {
            while true {
                let task = URLSession.shared.synchronousDataTask(with: URL(string: "http://127.0.0.1:9191/api/version")!)
                if task.1 != nil {
                    DispatchQueue.main.async {
                        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
                    }
                    break
                }
                sleep(UInt32(0.5))
            }
        }
    }
}

