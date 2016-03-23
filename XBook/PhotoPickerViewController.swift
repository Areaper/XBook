//
//  PhotoPickerViewController.swift
//  XBook
//
//  Created by leon on 16/3/23.
//  Copyright © 2016年 leon. All rights reserved.
//

import UIKit

protocol PhotoPickerDelegate {
    func getImageFromPicker(image: UIImage)
}

class PhotoPickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, VPImageCropperDelegate {

    
    var alert: UIAlertController?
    
    var picker: UIImagePickerController!
    
    var delegate: PhotoPickerDelegate?

    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        
        // 透明效果
        self.modalPresentationStyle = .OverFullScreen
        self.view.backgroundColor = UIColor.clearColor()
        
        picker = UIImagePickerController()
        picker.allowsEditing = false
        picker.delegate = self
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if alert == nil {
            alert = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
            alert?.addAction(UIAlertAction(title: "从相机选择", style: .Default, handler: { (action) -> Void in
                self.localPhoto()
            }))
            alert?.addAction(UIAlertAction(title: "打开相机", style: .Default, handler: { (action) -> Void in
                self.takePhoto()
            }))
            alert?.addAction(UIAlertAction(title: "取消", style: .Cancel, handler: { (action) -> Void in
                
            }))
            
        }
        
        self.presentViewController(alert!, animated: true, completion: nil)
    }
    
    func takePhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            self.picker.sourceType = .Camera
            self.presentViewController(self.picker, animated: true, completion: { () -> Void in
                
            })
        }
        else {
            let alert = UIAlertController(title: "此机型无相机", message:  nil, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "关闭", style: .Cancel, handler: { (action) -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        
    }
    
    func localPhoto() {
        self.picker.sourceType = .PhotoLibrary
        self.presentViewController(self.picker, animated: true, completion: nil)
        
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.picker.dismissViewControllerAnimated(true) { () -> Void in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        self.picker.dismissViewControllerAnimated(true) { () -> Void in
            self.dismissViewControllerAnimated(true, completion: { () -> Void in
                let vcImageCor = VPImageCropperViewController(image: image, cropFrame: CGRectMake(0, 100, ScreenWidth, ScreenWidth * 1.273), limitScaleRatio: 3)
                vcImageCor.delegate = self
                self.presentViewController(vcImageCor, animated: true, completion: nil)
                
                
                
            })
        }
        
    }
    
    func imageCropper(cropperViewController: VPImageCropperViewController!, didFinished editedImage: UIImage!) {
        delegate!.getImageFromPicker(editedImage)
        cropperViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imageCropperDidCancel(cropperViewController: VPImageCropperViewController!) {
        cropperViewController.dismissViewControllerAnimated(true, completion: nil)
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
