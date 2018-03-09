//
//  DownloadCell.swift
//  Bridge
//
//  Created by Sajjad Aboutalebi on 3/8/18.
//  Copyright © 2018 Sajjad Aboutalebi. All rights reserved.
//

import UIKit
import MZDownloadManager
import SnapKit
import MBCircularProgressBar


class DownloadCell: UITableViewCell {

    @IBOutlet weak var stackview: UIStackView!
    @IBOutlet weak var progressview: MBCircularProgressBarView!
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var remaining: UILabel!
    @IBOutlet weak var speed: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        progressview?.snp.makeConstraints { (make) in
            make.height.width.equalTo(67)
            make.leftMargin.topMargin.bottomMargin.equalToSuperview().offset(2)
        }
        stackview.snp.makeConstraints { (make) in
            make.leftMargin.equalTo(progressview.snp.right).offset(3)
            make.topMargin.bottomMargin.rightMargin.equalToSuperview().offset(2)
            
        }
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateCellForRowAtIndexPath(_ indexPath : IndexPath, downloadModel: MZDownloadModel) {
        
        titlelabel.text = downloadModel.fileName
        remaining.text = "\(downloadModel.progress.roundTo())% - \(downloadModel.downloadedFile?.size.roundTo() ?? "0") \(downloadModel.downloadedFile?.unit ?? "KB") of \(downloadModel.file?.size.roundTo() ?? "0") \(downloadModel.file?.unit ?? "KB")"
        speed.text = "\(downloadModel.speed?.speed.roundTo() ?? "0") \(downloadModel.speed?.unit ?? "KB")/s - \(downloadModel.remainingTime?.hours ?? 0) houre(s) and \(downloadModel.remainingTime?.minutes ?? 0) remaining"
        progressview.value = CGFloat(downloadModel.progress)
    }
    
    
}
