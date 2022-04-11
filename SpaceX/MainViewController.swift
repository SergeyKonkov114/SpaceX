//
//  ViewController.swift
//  SpaceX
//
//  Created by Сергей Коньков on 02.04.2022.
//

import UIKit

class MainViewController: UIViewController {
    
//    private let fetcher  = NetworkDataFetcher(networkService: NetworkService())
//    private var rockets: [Rocket]?
//    private var viewModel: TableViewViewModel?
//    private var viewModel = TableViewViewModel()
//    var viewModel: TableViewViewModel
    var viewModel: TableViewViewModel? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            pageControl.currentPage = viewModel.getCurrentPage()
            pageControl.isEnabled = false
        }
    }
    
//    private lazy var imageView: UIImageView = {
//        let iw = UIImageView()
//        iw.backgroundColor = .cyan       //!!!!
//        iw.translatesAutoresizingMaskIntoConstraints = false
//        return iw
//    }()
    
//    private lazy var pageContol: UIPageControl = {
//        let pc = UIPageControl()
//        pc.numberOfPages = 5       //!!!!
//        pc.backgroundColor = UIColor(red: 0.07, green: 0.07, blue: 0.07, alpha: 1)  //!!!!
//        pc.translatesAutoresizingMaskIntoConstraints = false
//        return pc
//    }()
    
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
        //pc.backgroundColor = .green
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        viewModel = TableViewViewModel()
        
//        viewModel.fetchRockets {
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
        
        configureView()
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.layer.cornerRadius = 20
        
        tableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: "customHeader")
        
        tableView.register(FirstCustomCell.self, forCellReuseIdentifier: "firstCell")
        tableView.register(SecondCustomCell.self, forCellReuseIdentifier: "secondCell")
        tableView.register(ThirdCustomCell.self, forCellReuseIdentifier: "thirdCell")
        tableView.register(FourthCustomCell.self, forCellReuseIdentifier: "fourthCell")
        tableView.register(FifthCustomCell.self, forCellReuseIdentifier: "fifthCell")
        tableView.register(SixthCustomCell.self, forCellReuseIdentifier: "sixthCell")
        
        //pageControl.currentPage = viewModel?.getCurrentPage() ?? 0
        //tableView.tableHeaderView
        
//        viewModel.fetchRockets {
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
        
//        fetcher.getRocketsInfo { rockets in
//            guard let rockets = rockets else { return }
//            print(rockets)
//        }
        
//        print(tableView.tableHeaderView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.topItem?.title = "Назад"
        self.tableView.contentInsetAdjustmentBehavior = .never
    }
    
//    init(viewModel: TableViewViewModel) {
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}

//MARK: - Configuration
extension MainViewController {
    
    private func configureView() {
        
//        view.backgroundColor = .yellow   //!!!!
        
//        view.addSubview(imageView)
//        view.addSubview(pageContol)
        view.addSubview(tableView)
        view.addSubview(footerView)
        footerView.addSubview(pageControl)
        
        //tableView.tableHeaderView = UIView()
        
        //tableView.tableHeaderView?.backgroundColor = .green
        
        //self.navigationItem.title = "KUKU"
        
//        guard let tv = tableView.tableHeaderView else {
//            print("NO")
//            return
//        }
        
        NSLayoutConstraint.activate([
            //Image View
//            imageView.topAnchor.constraint(equalTo: view.topAnchor),
//            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            //Page Control
//            pageContol.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -72),
//            pageContol.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            pageContol.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            pageContol.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            //Footer View
            footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footerView.heightAnchor.constraint(equalToConstant: 72),
            
            //Table View
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: footerView.bottomAnchor, constant: 42),
            
            //Page Control
            //pageControl.leadingAnchor.constraint(equalTo: footerView.leadingAnchor),
            //pageControl.trailingAnchor.constraint(equalTo: footerView.trailingAnchor),
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
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "\(section)"
//    }
   
    //!!!!!!!!!!!!!!!!
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let viewModel = viewModel else { return nil }
        
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "customHeader") as! CustomHeader
        view.viewModel = viewModel.headerViewModel()
        //view.viewModel = viewModel.headerViewModel {
        //    tableView.reloadData()
        //}
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.height / 2
    }
}

//MARK: - Table View Delegate

extension MainViewController: UITableViewDelegate {
    
}

//MARK: - Button Action

extension MainViewController {
    
    @objc func didTapLaunchesButton() {
//        navigationController?.popViewController(animated: true)
        
        guard let viewModel = viewModel else { return }
        let launchesVC = LaunchesViewController()
        //launchesVC.title = "WTF"
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
