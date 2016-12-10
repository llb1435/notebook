//
//  ViewController.swift
//  notebook
//
//  Created by llb on 16/12/10.
//  Copyright © 2016年 llb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var inputText: UITextView!
    
    @IBOutlet weak var outputText: UITextView!
    
    @IBOutlet weak var fileNameForSave: UITextField!
    
    @IBOutlet weak var fileNameForQry: UITextField!
    
    //using dict saving files
    
    var file = Dictionary<String, String>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        inputText.text = "Please text here ..."
        inputText.textColor = UIColor.grayColor()
    }
    
    
    @IBAction func saveFile(sender: UIButton) {
        //如果文件名不空且内容不空，就保存；否则给出提示
        if !fileNameForSave.text!.isEmpty   {
            if !inputText.text!.isEmpty  {
                file[fileNameForSave.text!] = inputText.text
                print(file)
            } else {
                inputText.text = "Input text here ..."
            }
        } else {
            fileNameForSave.placeholder = "Input filename for save ! "
        }
        
    }
    
    
    @IBAction func qryFile(sender: UIButton) {
        outputText.text = ""
        //如果文件名不空, 查询给出结果；否则给出提示
        if !fileNameForQry.text!.isEmpty {
            let txt = fileNameForQry.text!
            for (name, cnt) in file {
                if txt == name {
                    outputText.text = cnt
                    break
                }
            }
            if outputText.text! == "" {
                outputText.text = "Not found this file !"
            }
        } else {
            fileNameForQry.placeholder = "Input aname for Query ! "
        }
            
    }
    
    
    
    @IBAction func qryAllFile(sender: UIButton) {
        outputText.text = ""
      
        if file.isEmpty {
            outputText.text = "No files found !"
        } else {
            let files = file.sort({(t1, t2) -> Bool in return t1.0 < t2.0 ? true:false })
            for (name, ctn) in files {
                outputText.text = outputText.text + name + "  " + ctn + "\n"
            }
        }
    }   
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

