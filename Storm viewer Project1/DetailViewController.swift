//
//  DetailViewController.swift
//  Storm viewer Project1
//
//  Created by MacBook Air on 23/08/2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var ImageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = selectedImage
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

        if let imageToLoad = selectedImage {
            ImageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.hidesBarsOnSwipe = false
    }

   @objc func shareTapped (){
       guard let image = ImageView.image?.jpegData(compressionQuality: 0.8)
       else{
           print("no image")
           return
       }
       let vc = UIActivityViewController(activityItems: [image,selectedImage as Any], applicationActivities: [])
       vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
       present(vc, animated: true)
    }

}
