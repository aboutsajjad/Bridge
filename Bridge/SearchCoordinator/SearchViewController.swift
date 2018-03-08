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
        //let ydl = youtubedl()
        //ydl.run_server(11)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        downloadManager?.addDownloadTask("sdfvgbhnjm", fileURL: "http://cdn.p30download.com/?b=p30dl-software&f=Telegram.v1.2.6_p30download.com.rar")
        //downloadManager?.addDownloadTask("asdascc", fileURL: "http://cdn.p30download.com/?b=p30dl-software&f=Mozilla.Firefox.v58.0.2.x64_p30download.com.zip")
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
