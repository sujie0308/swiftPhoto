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
            self.arr.addObject(firstimg.image!)
    }
   
    internal func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arr.count
    }
    internal func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
          let cell = collectionView.dequeueReusableCellWithReuseIdentifier("photo", forIndexPath: indexPath)as! PhotoCollectionViewCell
        if (indexPath.item==0)
        {
       let cell = collectionView.dequeueReusableCellWithReuseIdentifier("photo", forIndexPath: indexPath)as! PhotoCollectionViewCell
            cell.setcell(self.arr[indexPath.item] as! UIImage)
            return cell
         }
       if(indexPath.item>0)
      {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("photo", forIndexPath: indexPath)as! PhotoCollectionViewCell
        cell.setcell(self.arr[indexPath.item] as! UIImage)
        return cell
       }
        //不知道为什么不能return nil
        return cell
    }
    internal func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.item==0)
        {
            let AlertController : UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
            let Action1 : UIAlertAction = UIAlertAction(title: "相机", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
                if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera))
                {
                    let Picker : UIImagePickerController = UIImagePickerController()
                   Picker.allowsEditing = true
                   Picker.delegate = self
                    self.navigationController?.delegate = self
                    //指定源为相机
                    Picker.sourceType = UIImagePickerControllerSourceType.Camera
                    self .presentViewController(Picker, animated: true, completion: nil)
                }
                
                
            })
            let Action2 : UIAlertAction = UIAlertAction(title: "相册", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
                if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary))
                {
                    let Picker2 : UIImagePickerController = UIImagePickerController()
                    Picker2.allowsEditing = true
                    Picker2.delegate = self
                    self.navigationController?.delegate = self
                    //指定源为相册
                    Picker2.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                    self .presentViewController(Picker2, animated: true, completion: nil)
                }
                
            })
            
            let Action3 : UIAlertAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
            AlertController .addAction(Action1)
            AlertController .addAction(Action2)
            AlertController .addAction(Action3)
            self .presentViewController(AlertController, animated: true, completion: nil)
        }
        //不知道为什么!=0会报红
        if(indexPath.item>0)
        {
            let AlertController : UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
            let Action1 : UIAlertAction = UIAlertAction(title: "删除", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
               self.arr .removeObject(self.arr[indexPath.item])
                self.collection.reloadData()
            })
            let Action2 : UIAlertAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
            AlertController .addAction(Action1)
            AlertController .addAction(Action2)
            self .presentViewController(AlertController, animated: true, completion: nil)
        }
        
    }
    internal func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //申明的时候初始化过了
       self.photo.image = info[UIImagePickerControllerEditedImage]as? UIImage
        self.arr.addObject(self.photo.image!)
        self.collection.reloadData()
        picker .dismissViewControllerAnimated(true, completion: nil)
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
