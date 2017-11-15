//
//  ViewController.swift
//  passingData
//
//  Created by AnhHao on 11/14/17.
//  Copyright © 2017 AnhHao. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var displayedNumberTextfield: UITextField!
    @IBOutlet weak var displayedNumberLabel: UILabel!
    var data: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayedNumberTextfield.delegate = self
        
        registerNotification()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadData(_:)), name: .updateData
            , object: nil)
    }
  
    @objc func reloadData(_ notification: NSNotification) {
        displayedNumberLabel.text = notification.object as? String
        
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    @IBAction func dismissVC(_ sender: Any) {
        NotificationCenter.default.post(name: .receiveData, object: displayedNumberTextfield.text)
        dismiss(animated: true, completion: nil)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
}

