//
//  PostCellTableViewCell.swift
//  my-hood
//
//  Created by Nathan Worcester on 9/12/16.
//  Copyright © 2016 Nathan Worcester. All rights reserved.
//

import UIKit

class PostCellTableViewCell: UITableViewCell {

    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        postImg.layer.cornerRadius = postImg.frame.size.width / 3
        postImg.clipsToBounds = true
    }

    func configureCell(post: Post) {
        titleLbl.text = post.title
        descLbl.text = post.postDesc
        postImg.image = DataService.instance.imageForPath(post.imagePath)
    }
}
