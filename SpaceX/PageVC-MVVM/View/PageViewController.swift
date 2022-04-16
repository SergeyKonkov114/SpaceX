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
        
        let userDefaults = UserDefaults.standard
        let isFirstAppLaunch = !userDefaults.bool(forKey: "firstLaunch")
        if isFirstAppLaunch {
            userDefaults.set(true, forKey: "heightMetrics")
            userDefaults.set(true, forKey: "diameterMetrics")
            userDefaults.set(true, forKey: "massMetrics")
            userDefaults.set(true, forKey: "payloadWeightMetrics")
        }
        userDefaults.set(true, forKey: "firstLaunch")
        
        dataSource = self

        pageViewModel.rocketsImageData.bind { [weak self] data in
            DispatchQueue.main.async {
                if let mainViewController = self?.showViewController(atIndex: 0) {
                    self?.setViewControllers([mainViewController], direction: .forward, animated: true, completion: nil)
                }
            }
        }
        pageViewModel.fetchRockets()
    }
        
    func showViewController(atIndex index: Int) -> MainViewController? {
        guard index >= 0 else { return nil }
        guard index < pageViewModel.numberOfTableViews() else { return nil }
        
        let tableViewModel = pageViewModel.tableViewViewModel(forPage: index)
        guard let tableViewModel = tableViewModel else { return nil }
        
        let mainViewController = MainViewController()
        mainViewController.viewModel = tableViewModel
        return mainViewController
    }
    
}

//MARK: - Page View Controller Data Source

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let mainVC = viewController as? MainViewController,
              let viewModel = mainVC.viewModel
        else { return nil }
        
        var pageNumber = viewModel.getCurrentPage()
        pageNumber -= 1
        return showViewController(atIndex: pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let mainVC = viewController as? MainViewController,
              let viewModel = mainVC.viewModel
        else { return nil }
        
        var pageNumber = viewModel.getCurrentPage()
        pageNumber += 1
        return showViewController(atIndex: pageNumber)
    }
    
}
 
