//
//  ViewController.swift
//  SpaceX
//
//  Created by Сергей Коньков on 02.04.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var viewModel: TableViewViewModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            pageControl.currentPage = viewModel.getCurrentPage()
            pageControl.isEnabled = false
        }
    }
    
    var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.backgroundColor = .white   //!!!!
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    private lazy var footerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = 4
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: "customHeader")
        tableView.register(FirstCustomCell.self, forCellReuseIdentifier: "firstCell")
        tableView.register(SecondCustomCell.self, forCellReuseIdentifier: "secondCell")
        tableView.register(ThirdCustomCell.self, forCellReuseIdentifier: "thirdCell")
        tableView.register(FourthCustomCell.self, forCellReuseIdentifier: "fourthCell")
        tableView.register(FifthCustomCell.self, forCellReuseIdentifier: "fifthCell")
        tableView.register(SixthCustomCell.self, forCellReuseIdentifier: "sixthCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.topItem?.title = "Назад"
        self.tableView.contentInsetAdjustmentBehavior = .never
    }
    
}

//MARK: - Configuration

extension MainViewController {
    
    private func configureView() {
        view.addSubview(tableView)
        view.addSubview(footerView)
        footerView.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footerView.heightAnchor.constraint(equalToConstant: 72),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: footerView.bottomAnchor, constant: 42),
            
            pageControl.centerXAnchor.constraint(equalTo: footerView.centerXAnchor),
            pageControl.centerYAnchor.constraint(equalTo: footerView.centerYAnchor),
        ])
    }
}

// MARK: - Table View Data Source

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let viewModel = viewModel else { return UITableViewCell() }
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell") as? FirstCustomCell
            else { return UITableViewCell() }
            let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath) as? TableViewFirstCellViewModel
            cell.viewModel = cellViewModel
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell") as? SecondCustomCell
            else { return UITableViewCell() }
            let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath) as? TableViewSecondCellViewModel
            cell.viewModel = cellViewModel
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "thirdCell") as? ThirdCustomCell
            else { return UITableViewCell() }
            let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath) as? TableViewThirdCellViewModel
            cell.viewModel = cellViewModel
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "fourthCell") as? FourthCustomCell
            else { return UITableViewCell() }
            let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath) as? TableViewFourthCellViewModel
            cell.viewModel = cellViewModel
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "fifthCell") as? FifthCustomCell
            else { return UITableViewCell() }
            let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath) as? TableViewFifthCellViewModel
            cell.viewModel = cellViewModel
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "sixthCell") as? SixthCustomCell
            else { return UITableViewCell() }
            let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath) as? TableViewSixthCellViewModel
            cell.viewModel = cellViewModel
            return cell
        default:
            return UITableViewCell()
        }
    }
}

//MARK: - Table View Delegate

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0: return 112
        case 1: return 100
        case 2: return 144
        case 3: return 184
        case 4: return 184
        case 5: return 210
        default: return 100
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let viewModel = viewModel else { return nil }
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "customHeader") as! CustomHeader
        view.viewModel = viewModel.headerViewModel()
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.height / 2
    }
}

//MARK: - Button Actions

extension MainViewController {
    
    @objc func didTapLaunchesButton() {
        guard let viewModel = viewModel else { return }
        let launchesVC = LaunchesViewController()
        launchesVC.viewModel = viewModel.launchesViewControllerViewModel()
        navigationController?.pushViewController(launchesVC, animated: true)
    }
    
    @objc func didTapSettingsButton() {
        guard let viewModel = viewModel else { return }
        let settingsVC = SettingsViewController()
        settingsVC.viewModel = viewModel.settingsViewControllerViewModel()
        self.present(settingsVC, animated: true, completion: nil)
    }
}
