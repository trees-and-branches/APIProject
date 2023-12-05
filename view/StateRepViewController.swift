//
//  StateRepViewController.swift
//  APIProject
//
//  Created by shark boy on 12/4/23.
//

import UIKit

class StateRepViewController: UIViewController{
    
    @IBOutlet weak var stateRepsTableView: UITableView!
    
    var stateRepController = StateRepController()
    var stateReps: [StateRep] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stateRepsTableView.delegate = self
        stateRepsTableView.dataSource = self
        Task {
            do {
                stateReps = try await stateRepController.fetchStateReps()
                DispatchQueue.main.async {
                    self.stateRepsTableView.reloadData() // Ensure this is on the main thread
                }
            } catch {
                print(error)
            }
        }

        
    }
}


extension StateRepViewController: UITableViewDataSource, UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(stateReps.count)
        return stateReps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StateRepCell", for: indexPath) as! StateRepTableViewCell
        let stateRep = stateReps[indexPath.row]
        cell.update(with:stateRep)
        
        
        return cell
    }
}

//Task {
//    do {
//        stateReps = try await stateRepController.fetchStateReps()
//        DispatchQueue.main.async {
//            self.stateRepsTableView.reloadData() // Ensure this is on the main thread
//        }
//    } catch {
//        print(error)
//    }
//}
