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
    @IBOutlet weak var titleTextField: UITextField!
    
    
    var imagePicker = UIImagePickerController()
    var singleThing : Thing? = nil
    
    @IBAction func photoButtonAction(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        photoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cameraButtonAction(_ sender: Any) {
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let thing = Thing(context:context)
        thing.title = titleTextField.text
        thing.image = UIImagePNGRepresentation(photoImageView.image!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        if singleThing != nil {
            //photoImageView.image = singleThing.image
            titleTextField.text = singleThing!.title
        } else {
            titleTextField.text = "not passed"
        }
    }
    
}
