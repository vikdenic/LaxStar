//
//  LaxViewController.swift
//  LaxStar
//
//  Created by Vik Denic on 2/12/15.
//  Copyright (c) 2015 Nektar Labs. All rights reserved.
//

import UIKit

class LaxViewController: UITableViewController, UIScrollViewDelegate {

    let kTableHeaderHeight: CGFloat = 300.0
    var headerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //Dynamically size cell's according to content (i.e. the label's text)
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension


        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)

        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        updateHeaderView()
    }

    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    //Helper
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)

        if tableView.contentOffset.y < -kTableHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        headerView.frame = headerRect
    }

    //UIScrollViewDelegate
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }

    //UITableViewDelegate
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as NewsItemTableViewCell
        return cell
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
}
