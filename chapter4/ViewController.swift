//
//  ViewController.swift
//  chapter4
//
//  Created by Jack Sexton on 5/7/18.
//  Copyright © 2018 Jack Sexton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imagePick: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("Loaded")
    }

    @IBAction func imageTapped(_ sender: Any)
    {
        print("Tapped")
        var ran = Int(arc4random_uniform(5))
        image.image = UIImage(named: "runner\(ran)")
    }
    
    @IBAction func moveUp(_ sender: UIButton)
    {
        self.image.alpha = 1
        UIImageView.animate(withDuration: 1.0, animations: {self.image.frame.origin.y -= 100})
        
    }
    
    @IBAction func moveDown(_ sender: UIButton)
    {
        self.image.alpha = 1
         UIImageView.animate(withDuration: 1.0, animations: {self.image.frame.origin.y += 100})
    }
    
    @IBAction func dissapear(_ sender: UIButton)
    {
        UIImageView.animate(withDuration: 1.0, animations: {self.image.alpha = 0})
    }
    
    @IBAction func run(_ sender: UIButton)
    {
        self.image.alpha = 1
        UIImageView.animate(withDuration: 1.0, animations: {self.image.frame.origin.x += 100})
    }
    
    @IBAction func getBig(_ sender: UIButton)
    {
        self.image.alpha = 1
        let largerRunner = CGRect(x: image.bounds.origin.x - 60, y: image.bounds.origin.x + 60, width: image.bounds.width + 60, height: image.bounds.height + 60)
        UIImageView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 20, animations: {self.image.bounds = largerRunner})
       // UIImageView.animate(withDuration: 1, animations: {self.image.bounds = largerRunner})
    }
    
    @IBAction func punchImage(_ sender: Any)
    {
        //Original size
        let bounds = self.image.bounds
        //Temporarily make smaller
        self.image.alpha = 1
        self.image.bounds = CGRect(x: image.bounds.origin.x + 60, y: image.bounds.origin.x + 60, width: image.bounds.width-60, height: image.bounds.height-60)
        //Back to normal size
        UIImageView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 20, animations: {self.image.bounds = bounds})
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imagePick.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func takePhoto(_ sender: UIButton)
    {
        imagePicker.sourceType = .camera
        
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func cameraRoll(_ sender: UIButton)
    {
        imagePicker.sourceType = .photoLibrary
        
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
    
}

