//
//  FirstCollectionViewCell.swift
//  QQ说说上传照片
//
//  Created by 吴小苏 on 16/1/8.
//  Copyright © 2016年 苏杰. All rights reserved.
//

import UIKit


class PhotoCollectionViewCell: UICollectionViewCell{
    @IBOutlet weak var img: UIImageView!
    func setcell(_ image:UIImage){
        img.image = image
    }
}


