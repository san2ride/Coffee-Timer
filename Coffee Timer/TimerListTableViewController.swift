//
//  TimerListTableViewController.swift
//  Coffee Timer
//
//  Created by don't touch me on 8/1/16.
//  Copyright © 2016 trvl, LLC. All rights reserved.
//

import UIKit

extension TimerListTableViewController: TimerEditViewControllerDelegate {
    
    func timerEditViewControllerDidCancel(_ viewController: TimerEditViewController) {
        
    }
    
    func timerEditViewControllerDidSave(_ viewController: TimerEditViewController) {
        let model = viewController.timerModel
        let type = model?.type
        
        if type == .coffee {
            if !coffeeTimers.contains(model!) {
                coffeeTimers.append(model!)
            }
            
            teaTimers = teaTimers.filter({ (item) -> Bool in return item != model
            })
        } else { //Type must be.Tea
            if !teaTimers.contains(model!) {
                teaTimers.append(model!)
            }
            
            coffeeTimers = coffeeTimers.filter({ (item) -> Bool in
                return item != model
            })
            
        }
    }
}



class TimerListTableViewController: UITableViewController {
    
    var coffeeTimers: [TimerModel]!
    var teaTimers: [TimerModel]!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        coffeeTimers = [
            TimerModel(name: "Colombian", duration: 240, type: .coffee),
            TimerModel(name: "Mexican", duration: 200, type: .coffee)
        ]
        teaTimers = [
            TimerModel(name: "Green Tea", duration: 400, type: .tea),
            TimerModel(name: "Oolong", duration: 400, type: .tea),
            TimerModel(name: "Rooibos", duration: 400, type: .tea)
        ]

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if presentedViewController != nil {
            tableView.reloadData()
        }
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
                return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return coffeeTimers.count
        } else {
            return teaTimers.count
        }
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) 
        
        let timerModel: TimerModel = {
            
            if (indexPath as NSIndexPath).section == 0 {
                return self.coffeeTimers[(indexPath as NSIndexPath).row]
            } else {
                return self.teaTimers[(indexPath as NSIndexPath).row]
            }
        }()

        cell.textLabel?.text = timerModel.name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.isEditing {
            let cell = tableView.cellForRow(at: indexPath)
            performSegue(withIdentifier: "editDetail", sender: cell)
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "Coffees"
        } else {
            return "Teas"
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Delete the data from the array.
            
            if (indexPath as NSIndexPath).section == 0 {
                coffeeTimers.remove(at: (indexPath as NSIndexPath).row)
            } else { // Must be 1
                teaTimers.remove(at: (indexPath as NSIndexPath).row)
            }
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
//    public override func tableView(tableView: UITableView, shouldShowMenuForRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        
//        return true
//    }
//    
//    override public func tableView(tableView: UITableView,
//        canPerformAction action: Selector,
//        forRowAtIndexPath indexPath: NSIndexPath,
//        withSender sender: AnyObject?) {
//        
//        if action == #selector(NSObject.copy(_:)) {
//            
//            return true
//        }
//        return false
//    }
//    
//    override public func tableView(tableView: UITableView,
//        performAction action: Selector,
//        forRowAtIndexPath indexPath: NSIndexPath,
//        withSender sender: AnyObject?) {
//        
//        let timerModel: TimerModel = {
//            if indexPath.section == 0 {
//                return self.coffeeTimers[indexPath.row]
//            } else {
//                return self.teaTimers[indexPath.row]
//            }
//        }()
//        
//        let pasteBoard = UIPasteboard.generalPasteboard()
//        pasteBoard.string = timerModel.name
//    }
//    
//    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
//        
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let cell = sender as? UITableViewCell {
            let indexPath = tableView.indexPath(for: cell)!
            
            let timerModel: TimerModel = {
                if (indexPath as NSIndexPath).section == 0 {
                    return self.coffeeTimers[(indexPath as NSIndexPath).row]
                } else {
                    return self.teaTimers[(indexPath as NSIndexPath).row]
                }
            }()
            
            if segue.identifier == "pushDetail" {
                
            let detailViewController = segue.destination as! TimerDetailViewController
            detailViewController.timerModel = timerModel
            } else if segue.identifier == "editDetail" {
                
                let navigationController = segue.destination as! UINavigationController
                let editViewController = navigationController.topViewController as! TimerEditViewController
                
                editViewController.timerModel = timerModel
                editViewController.delegate = self
            }
            
        } else if let _ = sender as? UIBarButtonItem {
            if segue.identifier == "newTimer" {
                let navigationController = segue.destination as! UINavigationController
                let editViewController = navigationController.topViewController as! TimerEditViewController
                
                editViewController.creatingNewTimer = true
                editViewController.timerModel = TimerModel(name: "", duration: 240, type: .coffee)
                editViewController.delegate = self
            }
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "pushDetail" {
            if tableView.isEditing {
                return false
            }
        }
        return true
        
    }
    
    
    
}
