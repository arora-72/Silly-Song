//
//  ViewController.swift
//  Silly Song
//
//  Created by arora_72 on 08/04/17.
//  Copyright © 2017 indresh arora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        nameField.returnKeyType = UIReturnKeyType.done
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    @IBAction func reset(_ sender: Any) {
        
        
        nameField.text = ""
        lyricsView.text = ""
        
    }
    
    
    @IBAction func displayLyrics(_ sender: Any) {
        if (nameField.text != nil){
            //shortNameForName(name: nameField.text)
            var finalResult:String = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
            lyricsView.text = finalResult
        }
        else
        {
            print("null entry given")
        }
        
    }
    
    func shortNameForName(name: String) -> String{
            let len = name.characters.count
        
        var names: String = name
        //print(names)
        //var final = [String]()
        
//        let first = name.characters.index(after: name.startIndex)
              var new = names.characters.removeFirst()
                return names
    }
    
    
    //print(shortNameFromName(name: "alia"))
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"].joined(separator: "\n")
    
    func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
        
        let shortName = shortNameForName(name: fullName)
        
        let lyrics = lyricsTemplate
            .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
            .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
        
        print(lyrics)
        return lyrics
    }

}
//uitextfield delegate

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
