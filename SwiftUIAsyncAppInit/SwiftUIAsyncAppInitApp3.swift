//
//  SwiftUIAsyncAppInitApp3.swift
//  SwiftUIAsyncAppInit
//
//  Created by Viacheslav Tkachenko on 11.04.2024.
//

import SwiftUI

fileprivate var isLoggedInUnsafe: Bool = false

@MainActor
class SwiftUIAsyncAppInitAppViewModel3: ObservableObject {
    var isLoggedIn: Bool = false
    init() {
        Task.synchronous {
            await Task.sleep(interval: 3) // just to be sure that the LoginView is not shown
            isLoggedInUnsafe = await AppState().isLoggedIn
        }
        isLoggedIn = isLoggedInUnsafe
    }
}

//@main
struct SwiftUIAsyncAppInitApp3: App {
    @StateObject var viewModel = SwiftUIAsyncAppInitAppViewModel3()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if viewModel.isLoggedIn {
                    MainView()
                } else {
                    LoginView()
                }
            }
        }
    }
}
