//
//  ListViewController.swift
//  ShoppingList
//
//  Created by Juan Francisco Dorado Torres on 6/2/19.
//  Copyright © 2019 Juan Francisco Dorado Torres. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {

  // MARK: - Public Properties

  var items = [String]()

  // MARK: - View cycle

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  // MARK: - Actions

  @IBAction func addItem() {
    let ac = UIAlertController(title: "New Item", message: nil, preferredStyle: .alert)
    ac.addTextField()
    ac.addAction(UIAlertAction(title: "Add", style: .default, handler: { [unowned self, ac] (action) in
      if let item = ac.textFields?.first?.text, !item.isEmpty {
        self.items.insert(item, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.insertRows(at: [indexPath], with: .automatic)
      }
    }))
    ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    present(ac, animated: true)
  }

  @IBAction func shareList() {
    let list = items.joined(separator: "\n")
    let vc = UIActivityViewController(activityItems: [list], applicationActivities: [])
    vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    present(vc, animated: true)
  }
}

// MARK: - Table View Delegates

extension ListViewController {

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
    cell.textLabel?.text = items[indexPath.row]
    return cell
  }
}
