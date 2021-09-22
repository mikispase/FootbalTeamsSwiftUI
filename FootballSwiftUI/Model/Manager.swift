//
//  Manager.swift
//  FootballSwiftUI
//
//  Created by Dimitar Spasovski on 9/21/21.
//

import Foundation

enum Job : String {
    case manager = "Manager"
    case headCoach = "Head Coach"
}


struct Manager {
    let name:String
    let job:Job
}
