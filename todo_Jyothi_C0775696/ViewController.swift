//
//  ViewController.swift
//  todo_Jyothi_C0775696
//
//  Created by user176475 on 6/24/20.
//  Copyright © 2020 user176475. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var table: UITableView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var result:[MyList] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetch()
        table.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "id", for: indexPath) as! pCellTableViewCell
        let rslt = result[indexPath.row]
        cell.task.text = rslt.task
        cell.priority.text = rslt.priority
        cell.priority.textColor = rslt.color
        return cell
    }
    func fetch()
    {
        let request = NSFetchRequest<MyList>(entityName: "MyList")
        do{
            result = try context.fetch(request)
        }
        catch{
            print(error)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140    }



}

