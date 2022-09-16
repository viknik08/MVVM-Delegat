//
//  MainModel.swift
//  MVVM + Delegat
//
//  Created by Виктор Басиев on 16.09.2022.
//

import Foundation

enum ViewData {
    case initial
    case loading
    case success
    case failure
}

struct UserData {
    let icon: String?
    let title: String?
    let description: String?
}
