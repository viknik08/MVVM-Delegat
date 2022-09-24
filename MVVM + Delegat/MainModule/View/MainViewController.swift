//
//  ViewController.swift
//  MVVM + Delegat
//
//  Created by Виктор Басиев on 16.09.2022.
//

import UIKit

class MainViewController: UIViewController, MainViewModelDelegat {
    
    private var viewModel: MainViewModel!
    private var testView: TestView!
    
    override func viewDidLoad() {
        viewModel = MainViewModel()
        super.viewDidLoad()
        viewModel.delegat = self
        view.backgroundColor = .white
        creatView()
        setupTargetButton()
    }
    
//MARK: - Delegat
    
    func updateViewData(_ data: ViewData) {
        testView.viewData = data
    }
    
    func updateUserData(_ userData: UserData) {
        testView?.titleLable.text = userData.title
        testView?.descriptionLabel.text = userData.description
        testView?.imageView.image = UIImage(systemName: userData.icon ?? "")
    }
    
//MARK: - Setup
    
    private func creatView() {
        testView = TestView()
        testView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        testView.center = view.center
        view.addSubview(testView)
    }
    
    private func setupTargetButton() {
        testView.startButton.addTarget(self, action: #selector(startAction), for: .touchUpInside)
    }
}

extension MainViewController {
    @objc func startAction() {
        viewModel.startFetch()
    }
}


