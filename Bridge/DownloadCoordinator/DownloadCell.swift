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
import MBProgressHUD

class DownloadCell: UITableViewCell {

    @IBOutlet weak var stackview: UIStackView!
    @IBOutlet weak var progressview: UIView!
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var remaining: UILabel!
    @IBOutlet weak var speed: UILabel!
    var hud: MBProgressHUD?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        hud = MBProgressHUD.showAdded(to: contentView, animated: true)
        hud?.mode = .annularDeterminate
        hud?.bezelView.color = .white
        hud?.bezelView.style = .solidColor
        
        //hud?.label.text = "Downloadnign"
        hud?.snp.makeConstraints { (make) in
            //make.width.equalTo(10)
            make.left.top.bottom.equalToSuperview()
        }
        stackview.snp.makeConstraints { (make) in
            make.leftMargin.equalTo(hud!.snp.right)
            make.topMargin.bottom.rightMargin.equalToSuperview()
            
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateCellForRowAtIndexPath(_ indexPath : IndexPath, downloadModel: MZDownloadModel) {
        
        titlelabel.text = downloadModel.fileName
        remaining.text = "\(downloadModel.progress)% - \(downloadModel.downloadedFile?.size) \(downloadModel.downloadedFile?.unit) of \(downloadModel.file?.size) \(downloadModel.file?.unit)"
        speed.text = "\(downloadModel.speed?.speed) \(downloadModel.speed?.unit) - \(downloadModel.remainingTime?.hours)"
        hud?.progress = downloadModel.progress
    }
}
