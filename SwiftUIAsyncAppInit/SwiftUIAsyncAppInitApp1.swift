//
//  SwiftUIAsyncAppInitApp1.swift
//  SwiftUIAsyncAppInit
//
//  Created by Viacheslav Tkachenko on 11.04.2024.
//

import SwiftUI

@MainActor
class SwiftUIAsyncAppInitAppViewModel1: ObservableObject {
    var isLoggedIn: Bool = false
    func detectState() async {
        await Task.sleep(interval: 3) // just to see the LoginView
        isLoggedIn = await AppState().isLoggedIn
    }
}



// The first idea that comes to mind is to put our initial setup into the onAppear method of the root view
@main
struct SwiftUIAsyncAppInitApp1: App {
    @StateObject var viewModel = SwiftUIAsyncAppInitAppViewModel2()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if viewModel.isLoggedIn {
                    MainView()
                } else {
                    LoginView()
                }
            }.onAppear() {
                Task {
                    await viewModel.detectState()
                }
            }
        }
    }
}
