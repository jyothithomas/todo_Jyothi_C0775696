//
//  SaveViewController.swift
//  todo_Jyothi_C0775696
//
//  Created by user176475 on 6/25/20.
//  Copyright © 2020 user176475. All rights reserved.
//

import UIKit

class SaveViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var task: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var priority: UITextField!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var ref = 0
    
    let priorityArray = ["High","Medium","Low"]
    let colorArray = [UIColor.red,UIColor.orange,#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker.dataSource = self

        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        priorityArray.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        priority.text = priorityArray[row]
        ref = row
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attrb = NSAttributedString(string: priorityArray[row], attributes: [NSAttributedString.Key.foregroundColor : colorArray[row]])
        
        return attrb
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func save(_ sender: Any) {
        let model = MyList(context: context)
        model.task = task.text
        model.priority = priority.text
        model.color = colorArray[ref]
        saveContext()
    }
    
}
