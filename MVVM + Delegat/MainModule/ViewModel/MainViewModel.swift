//
//  MainViewModel.swift
//  MVVM + Delegat
//
//  Created by Виктор Басиев on 16.09.2022.
//

import UIKit

protocol MainViewModelDelegat: AnyObject {
    func updateUserData(_ userData: UserData)
    func updateData(_ data: ViewData)
}

final class MainViewModel {
       
    weak var delegat: MainViewModelDelegat?
    
    public func startFetch() {
        
        delegat?.updateData(.loading)

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.delegat?.updateData(.success)
            self?.delegat?.updateUserData(UserData(icon: "person.fill.checkmark", title: "Hello", description: "No"))
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { [weak self] in
            self?.delegat?.updateData(.failure)
            self?.delegat?.updateUserData(UserData(icon: "person.fill.xmark", title: "GoodBay", description: "yes"))
        }
    }
}


