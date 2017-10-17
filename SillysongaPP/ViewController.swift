//
//  ViewController.swift
//  SillysongaPP
//
//  Created by Vidya Durvasula on 8/2/17.
//  Copyright © 2017 Vidya Durvasula. All rights reserved.
//

import UIKit
func displayshortname(name:String) -> String {
    
   let shortname = name.lowercased()
    let vowelset = CharacterSet(charactersIn: "aeiou")
    if let othername = shortname.rangeOfCharacter(from: vowelset)?.lowerBound {
        return shortname.substring(from:othername)
      
    }else{
     return shortname
    }
    
}
    func lyricforname(fullname:String,template:String) -> String{
        
                let shortname = displayshortname(name: fullname)
        let lyrics = template
            .replacingOccurrences(of: "<SHORT_NAME>", with: shortname)
        .replacingOccurrences(of: "<FULL_NAME>", with: fullname)
        return lyrics
    }
class ViewController: UIViewController,UITextFieldDelegate{
    
        @IBOutlet var lyricsView: UITextView!
    @IBOutlet var nameField: UITextField!
  
    

    @IBAction func displaylyrics(_ sender: Any) {
        let maintemplate = ["<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
                            "Banana Fana Fo F<SHORT_NAME>",
                            "Me My Mo M<SHORT_NAME>",
                            "<FULL_NAME>"].joined(separator: "\n")
        lyricsView.text = lyricforname(fullname: nameField.text!, template: maintemplate)
        
        

    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        textField.resignFirstResponder()
        return false
        
        
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
        
    }
    
    
    
    
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
        
    }

   
    }

