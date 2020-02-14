//
//  ViewController.swift
//  Week7MyNoteBook
//
//  Created by Khoi Hoang on 14/02/2020.
//  Copyright © 2020 Khoi Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
 
    
    var TextInsert = ""
    
    //TextArray for list
    var TextArray = [String]() //initialize an empty String array.
    
    //EditingFeature
    var editingRow = -1 //-1 to check if exists.
    
    //Assigning filename
    let fileName = "textFile.txt"
    
    
    //For the TextView.
    @IBOutlet weak var textviewX: UITextView!
    
    //For the tableView.
    @IBOutlet weak var tableView: UITableView!


    override func viewDidLoad() { // <- This method only gets called at the start of the launch of the app.
          super.viewDidLoad()
        TextArray.append("------------------")
        TextArray.append("Start of monologue")
        TextArray.append("------------------")
        tableView.dataSource = self
        tableView.delegate = self
      }
    
     //Animated boolean type
     func appearingView(_ animated: Bool){
        textviewX.text = TextInsert
        
    }
    
    //Our UIButton, with the applied functionality init.
    @IBAction func SaveButton2(_ sender: UIButton) {
        TextInsert = textviewX.text
       if editingRow > -1 {
            TextArray[editingRow] = TextInsert
            editingRow = -1
        
       } else {
       
        TextArray.append(TextInsert) // adding the new text in the text box to the array.
       
        }
        tableView.reloadData()
        textviewX.text = ""
        saveStringToFile(str: TextInsert, filename: fileName)
        print(readStringFromFile(filename: fileName ))
        
    }
    
    
    //Method added through 'Fix' Button (UITableViewDataSource)  L11 - Otherwise a regular 'tableView' method.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TextArray.count //Defining the size of the array by adding "TextArray.count"
    
    }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1")
        cell?.textLabel?.text = TextArray[indexPath.row]
        return cell!
        
     }
    
    //Making new func tableView for - Click row in TableView into Textview functionality.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       textviewX.text = TextArray[indexPath.row]
        
    //Adding editing specific row underneath.
       editingRow = indexPath.row
       textviewX.text = TextArray[editingRow]
    }
    
    //Deleting row:
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.TextArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    //Save String to file:
    func saveStringToFile(str:String, filename:String){
        let filepath = getDocumentDIR().appendingPathComponent(filename)
        do {
            try str.write(to: filepath, atomically: true, encoding: .utf8)
            print("No issues saving the string: \(str)")
        } catch {
            print("Error writing the string \(str)")
        }
        
    }
    
    //Reading the String from file:
    func readStringFromFile(filename:String) -> String {
    let filepath = getDocumentDIR().appendingPathComponent(filename)
        do {
            let string = try String (contentsOf: filepath, encoding: .utf8)
            return string
        } catch {
            print("Error while reading file" + filename)
        }
        return "empty"
        }
    
    }

    //Getting the specific directory. .documentDirectory
    func getDocumentDIR() -> URL {
          let documentDIR = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return documentDIR[0]
    
}

    


