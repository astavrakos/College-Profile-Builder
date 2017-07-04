//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by Alexandra Stavrakos on 7/3/17.
//  Copyright © 2017 Alexandra Stavrakos. All rights reserved.
//

import UIKit
import RealmSwift
import SafariServices

class DetailViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var enrollmentTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var siteTextField: UITextField!
    
    let realm = try! Realm()
    
    var detailItem: College? {
        didSet {
            // Update the view.
            configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let college = self.detailItem {
            if nameTextField != nil{
                nameTextField.text = college.name
                locationTextField.text = college.location
                enrollmentTextField.text = String(college.enrollment)
                siteTextField.text = college.website
                imageView.image = UIImage(data: college.image)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTappedSaveButton(_ sender: Any) {
        if let college = self.detailItem{
            try! realm.write({
                college.name = nameTextField.text!
                college.location = locationTextField.text!
                college.enrollment = Int(enrollmentTextField.text!)!
                college.image = UIImagePNGRepresentation(imageView.image!)!
            })
        }
    }
   
    @IBAction func onGoTapped(_ sender: Any) {
        let urlString = siteTextField.text!
        let url = URL(string: urlString)
        let svc = SFSafariViewController(url: url!)
        present(svc, animated: true, completion: nil)

    }

}

