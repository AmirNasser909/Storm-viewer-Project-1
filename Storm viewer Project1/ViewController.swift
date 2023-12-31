//
//  ViewController.swift
//  Storm viewer Project1
//
//  Created by MacBook Air on 23/08/2023.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Recommend", style: .plain, target: self, action: #selector(recommendButtonTapped))
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
                // this is a picture to load!
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        cell.textLabel?.text = "Picture \(indexPath.row + 1) of \(pictures.count)"
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            var sortedData = pictures
            sortedData = pictures.sorted()
            vc.selectedImage = sortedData[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    @objc func recommendButtonTapped() {
        let textToShare = "Check out this amazing app!"
        let appStoreURL = URL(string: "https://www.hackingwithswift.com/read/3/3/wrap-up")!
        
        let activityViewController = UIActivityViewController(activityItems: [textToShare, appStoreURL], applicationActivities: [])
        present(activityViewController, animated: true, completion: nil)
        
    }
}
