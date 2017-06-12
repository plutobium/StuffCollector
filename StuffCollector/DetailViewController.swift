//
//  DetailViewController.swift
//  StuffCollector
//
//  Created by vux on 12/6/17.
//  Copyright © 2017 crypticmantra. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,
                            UIImagePickerControllerDelegate,
                            UINavigationControllerDelegate {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    @IBAction func photoButtonAction(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        photoImageView.image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cameraButtonAction(_ sender: Any) {
        
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
}
