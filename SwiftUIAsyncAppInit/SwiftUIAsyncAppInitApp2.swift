//
//  SwiftUIAsyncAppInitApp2.swift
//  SwiftUIAsyncAppInit
//
//  Created by Viacheslav Tkachenko on 11.04.2024.
//

import SwiftUI

@MainActor
class SwiftUIAsyncAppInitAppViewModel2: ObservableObject {
    var isLoggedIn: Bool = false
    func detectState() async {
        await Task.sleep(interval: 3) // just to see the LoginView
        isLoggedIn = await AppState().isLoggedIn
    }
}


// Full article can be found here
//The second idea is to use task(priority:_:) method of the View.
//@main
struct SwiftUIAsyncAppInitApp2: App {
    @StateObject var viewModel = SwiftUIAsyncAppInitAppViewModel2()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if viewModel.isLoggedIn {
                    MainView()
                } else {
                    LoginView()
                }
            }.task {
                await viewModel.detectState()
            }
        }
    }
}

