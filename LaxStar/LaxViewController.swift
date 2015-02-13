//
//  LaxViewController.swift
//  LaxStar
//
//  Created by Vik Denic on 2/12/15.
//  Copyright (c) 2015 Nektar Labs. All rights reserved.
//

import UIKit

class LaxViewController: UITableViewController, UIScrollViewDelegate {

    @IBOutlet var laxImageView: UIImageView!

    var headerView: UIView!
    let kTableHeaderHeight: CGFloat = 180.0

    override func viewDidLoad() {
        super.viewDidLoad()
        //Dynamically size cell's according to content (i.e. the label's text)
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension

        //take control of headerview
        //to allow us to manage the table header we can't use the tableHeaderView property of UITableView because the table view manages the frame of its table header. We need to create and manage our own view.
        //the header view is not automatically reloaded when you reload the UITableView. You have to manage this view yourself.
        //these elements are not repainted when a [UITableView reloadData] is issued; you have to manually issue field / image resets yourself.
        //heightForHeaderInSection only applies to section headers; not the table header view
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        //this will add the view above the cells and move the cells down by the height of the added view.
        tableView.addSubview(headerView)

        //makes the scroll view content area larger without changing the size of the subview or the size of the view’s content
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        //always the current location of the top-left corner of the scroll bounds, whether scrolling is in progress or not.
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

        //If user pulling down
        if tableView.contentOffset.y <= -kTableHeaderHeight
        {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        //If user pulling up
        else
        {
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
