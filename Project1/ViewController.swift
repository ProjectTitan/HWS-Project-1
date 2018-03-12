//
//  ViewController.swift
//  Project3
//
//  Created by Rodney Simba Masarirambi on 3/5/18.
//  Copyright © 2018 Rodney Simba Masarirambi. All rights reserved.
//  Always remember to check the spelling... you now... reasons...
//  Same as Project 1 but adding the ability to share photos.

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try!
        fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix( "nssl" ) {
                pictures.append(item)
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
          print(pictures)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return pictures.count
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller & typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
        // 2: sucess! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]
        // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }


}

