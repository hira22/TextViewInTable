//
//  ViewController.swift
//  TextViewInTable
//
//  Created by hiraoka on 2021/07/29.
//

import UIKit

class ViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TextViewCell.self, forCellReuseIdentifier: TextViewCell.reuseIdentifier)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        let constrains = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]

        view.addSubview(tableView)
        NSLayoutConstraint.activate(constrains)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 3 == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TextViewCell.reuseIdentifier, for: indexPath) as? TextViewCell else {
                fatalError()
            }
            cell.thumbnailView?.image = UIImage(systemName: "person.circle")
            cell.textView?.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

            cell.readLabel?.text = "read"
            cell.dateLabel?.text = {
                let f = DateFormatter()
                f.dateStyle = .short
                f.timeStyle = .short
                return f.string(from: Date())
            }()
            return cell
        }

        let cell = UITableViewCell()
        cell.textLabel?.text = "label text"
        return cell
    }
}
