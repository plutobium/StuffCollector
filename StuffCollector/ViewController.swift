//
//  ViewController.swift
//  StuffCollector
//
//  Created by vux on 12/6/17.
//  Copyright © 2017 crypticmantra. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var stuffTableView: UITableView!
    
    var thingArray:[Thing] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()
            let thing = thingArray[indexPath.row]
            cell.textLabel?.text = thing.title
            cell.imageView?.image = UIImage(data:thing.image as Data!)
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: thingArray[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! DetailViewController
        nextVC.singleThing = sender as? Thing
    }

    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            thingArray = try context.fetch(Thing.fetchRequest())
        } catch {
            print("Error fetching thingarray")
        }
        stuffTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stuffTableView.dataSource = self
        stuffTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

