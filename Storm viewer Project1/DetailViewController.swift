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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
