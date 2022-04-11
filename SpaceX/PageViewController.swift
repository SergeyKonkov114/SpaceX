//
//  PageViewController.swift
//  SpaceX
//
//  Created by Сергей Коньков on 05.04.2022.
//

import UIKit

class PageViewController: UIPageViewController {
    
    private var pageViewModel = PageViewModel()
    
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle,
                  navigationOrientation: UIPageViewController.NavigationOrientation,
                  options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: options)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        var components = URLComponents()
//        components.scheme = "https"
//        components.host = "api.spacexdata.com"
//        components.path = "/v4/launches"
//        let json = [
//            "query":[
//               "upcoming":true
//            ],
//            "options":[
//               "limit":1,
//               "sort":[
//                  "flight_number":"asc"
//               ]
//            ]
//         ]
//        let jsonString = try? JSONSerialization.data(withJSONObject: json, options: [])
//        print(jsonString)
//
//        print(components.url)
        
        
        dataSource = self
        //delegate = self
        
        pageViewModel.fetchRockets {
            if let mainViewController = self.showViewController(atIndex: 0) {
                self.setViewControllers([mainViewController], direction: .forward, animated: true, completion: nil)
            }
            
        }
        
//        if let mainViewController = showViewController(atIndex: 0) {
//            setViewControllers([mainViewController], direction: .forward, animated: true, completion: nil)
//        }
    
//        pageViewModel.fetchRockets {
//            <#code#>
//        }
    }
    
    func showViewController(atIndex index: Int) -> MainViewController? {
        guard index >= 0 else { return nil }
        guard index < pageViewModel.numberOfTableViews() else { return nil }
        
        let tableViewModel = pageViewModel.tableViewViewModel(forPage: index)
        guard let tableViewModel = tableViewModel else { return nil }
        
        //let mainViewController = MainViewController(viewModel: tableViewModel)
        let mainViewController = MainViewController()
        //mainViewController.viewModel = pageViewModel.tableViewViewModel(forPage: index)
        mainViewController.viewModel = tableViewModel
        return mainViewController
    }
    
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let mainVC = viewController as? MainViewController,
              let viewModel = mainVC.viewModel
        else { return nil }
        
        //var pageNumber = (viewController as! MainViewController).viewModel.getCurrentPage()
        var pageNumber = viewModel.getCurrentPage()
        pageNumber -= 1
        return showViewController(atIndex: pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let mainVC = viewController as? MainViewController,
              let viewModel = mainVC.viewModel
        else { return nil }
        
        //var pageNumber = (viewController as! MainViewController).viewModel.getCurrentPage()
        var pageNumber = viewModel.getCurrentPage()
        pageNumber += 1
        return showViewController(atIndex: pageNumber)
    }
    
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return pageViewModel.numberOfTableViews()
//    }
//    
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        return 0
//    }
}
 
