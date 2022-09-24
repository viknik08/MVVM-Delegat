//
//  MainViewModel.swift
//  MVVM + Delegat
//
//  Created by Виктор Басиев on 16.09.2022.
//

import UIKit

protocol MainViewModelDelegat: AnyObject {
    func updateUserData(_ userData: UserData)
    func updateViewData(_ data: ViewData)
}

final class MainViewModel {
       
    weak var delegat: MainViewModelDelegat?
    
    public func startFetch() {
        
        delegat?.updateViewData(.loading)

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.delegat?.updateViewData(.success)
            self?.delegat?.updateUserData(UserData(icon: "person.fill.checkmark", title: "Success", description: "Good job"))
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { [weak self] in
            self?.delegat?.updateViewData(.failure)
            self?.delegat?.updateUserData(UserData(icon: "person.fill.xmark", title: "Fail", description: "Oh no.."))
        }
    }
}


