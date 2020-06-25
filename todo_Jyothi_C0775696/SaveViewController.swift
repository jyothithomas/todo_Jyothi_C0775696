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
    let priorityArray = ["High","Medium","Low"]
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func save(_ sender: Any) {
    }
    
}
