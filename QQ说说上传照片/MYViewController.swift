//
//  MYViewController.swift
//  QQ说说上传照片
//
//  Created by  on 16/1/8.
//  Copyright © 2016年 苏杰. All rights reserved.
//  自己oc写过Swift没怎么接触第一次用swift写写看有不足的地方或者有更好 的思路麻烦指教下
//QQ819950208

import UIKit

class MYViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    var photo : UIImageView = UIImageView()
    var arr : NSMutableArray = NSMutableArray()
        @IBOutlet weak var collection: UICollectionView!
        override func viewDidLoad() {
        super.viewDidLoad()
            let firstimg : UIImageView = UIImageView()
            firstimg.image = UIImage.init(named: "添加照片")
            self.arr.add(firstimg.image!)
    }
   
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arr.count
    }
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photo", for: indexPath)as! PhotoCollectionViewCell
        if (indexPath.item==0)
        {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photo", for: indexPath)as! PhotoCollectionViewCell
            cell.setcell(self.arr[indexPath.item] as! UIImage)
            return cell
         }
       if(indexPath.item>0)
      {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photo", for: indexPath)as! PhotoCollectionViewCell
        cell.setcell(self.arr[indexPath.item] as! UIImage)
        return cell
       }
        //不知道为什么不能return nil
        return cell
    }
    internal func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(indexPath.item==0)
        {
            let AlertController : UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
            let Action1 : UIAlertAction = UIAlertAction(title: "相机", style: UIAlertActionStyle.default, handler: { (UIAlertAction) -> Void in
                if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera))
                {
                    let Picker : UIImagePickerController = UIImagePickerController()
                   Picker.allowsEditing = true
                   Picker.delegate = self
                    self.navigationController?.delegate = self
                    //指定源为相机
                    Picker.sourceType = UIImagePickerControllerSourceType.camera
                    self .present(Picker, animated: true, completion: nil)
                }
                
                
            })
            let Action2 : UIAlertAction = UIAlertAction(title: "相册", style: UIAlertActionStyle.default, handler: { (UIAlertAction) -> Void in
                if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary))
                {
                    let Picker2 : UIImagePickerController = UIImagePickerController()
                    Picker2.allowsEditing = true
                    Picker2.delegate = self
                    self.navigationController?.delegate = self
                    //指定源为相册
                    Picker2.sourceType = UIImagePickerControllerSourceType.photoLibrary
                    self .present(Picker2, animated: true, completion: nil)
                }
                
            })
            
            let Action3 : UIAlertAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
            AlertController .addAction(Action1)
            AlertController .addAction(Action2)
            AlertController .addAction(Action3)
            self .present(AlertController, animated: true, completion: nil)
        }
        //不知道为什么!=0会报红
        if(indexPath.item>0)
        {
            let AlertController : UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
            let Action1 : UIAlertAction = UIAlertAction(title: "删除", style: UIAlertActionStyle.default, handler: { (UIAlertAction) -> Void in
               self.arr .remove(self.arr[indexPath.item])
                self.collection.reloadData()
            })
            let Action2 : UIAlertAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
            AlertController .addAction(Action1)
            AlertController .addAction(Action2)
            self .present(AlertController, animated: true, completion: nil)
        }
        
    }
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //申明的时候初始化过了
       self.photo.image = info[UIImagePickerControllerEditedImage]as? UIImage
        self.arr.add(self.photo.image!)
        self.collection.reloadData()
        picker .dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
