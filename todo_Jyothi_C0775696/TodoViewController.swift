//
//  TodoViewController.swift
//  todo_Jyothi_C0775696
//
//  Created by user176475 on 6/27/20.
//  Copyright © 2020 user176475. All rights reserved.
//

import UIKit
import CoreData

class TodoViewController: UIViewController {

    
    @IBOutlet weak var todoTitleLabel: UITextField!
    
    var todo: Todo?
//    delegate for previous screen to call methods
    var delegate: TaskListViewController?
    
    @IBOutlet weak var deadlineLabel: UIDatePicker!
    
    @IBOutlet weak var buttonStack: UIStackView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        hides completed and deleted buttons if new todo
        if todo == nil {
            buttonStack.isHidden = true
        }
//        sets the field values if old todo opened
        if let todoData = todo
        {
            todoTitleLabel.text = todoData.name
            deadlineLabel.date = todoData.due_date!
        }
    }
    
    
    @IBAction func saveTask(_ sender: Any) {
        if(checkTitle())
        {
            if todo == nil
            {
                delegate?.saveTodo(title: todoTitleLabel!.text!, dueDate: deadlineLabel!.date)
            }
            else
            {
                todo?.name = todoTitleLabel!.text!
                todo?.due_date = deadlineLabel!.date
                delegate?.updateTodo()
            }
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func markCompleted(_ sender: Any) {
        
        if(checkTitle()) {
            todo?.name = todoTitleLabel!.text!
            todo?.due_date = deadlineLabel!.date
            delegate?.markTodoCompleted()
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    @IBAction func deleteTask(_ sender: Any) {
        
        delegate?.deleteTodoFromList()
        navigationController?.popViewController(animated: true)
    }
    
    
//    method to check weather title is empty or not
    func checkTitle() -> Bool {
        if (todoTitleLabel.text?.isEmpty ?? true) {
            let alert = UIAlertController(title: "Enter the Task to Add!", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }
        else {
            return true
        }
    }
}

