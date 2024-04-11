//
//  AppState.swift
//  SwiftUIAsyncAppInit
//
//  Created by Viacheslav Tkachenko on 11.04.2024.
//

import Foundation

@globalActor
actor AppStateActor {
    static let shared = AppStateActor()
}

@AppStateActor 
class AppState {
    var isLoggedIn: Bool = true
}
