//
//  LaxViewController.swift
//  LaxStar
//
//  Created by Vik Denic on 2/12/15.
//  Copyright (c) 2015 Nektar Labs. All rights reserved.
//

import UIKit

class LaxViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    //UITableViewDelegate
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as NewsItemTableViewCell
        return cell
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}
