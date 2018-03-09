//
//  SearchViewController.swift
//  Bridge
//
//  Created by Sajjad Aboutalebi on 3/7/18.
//  Copyright © 2018 Sajjad Aboutalebi. All rights reserved.
//

import UIKit
import MZDownloadManager

class SearchViewController: UIViewController {
    
    var downloadManager: MZDownloadManager? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ydl = youtubedl()
        ydl.run_server(11)
        sleep(5)
        API.shared.extract("https://www.youtube.com/watch?v=6rmTfmdUIVY") { (ennns) in
            self.entriesActions(ennns)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
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

}
