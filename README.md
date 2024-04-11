# SwiftUI-Async-App-Init
An example of Async iniatilization of the SwiftUI app

## Introduction
Writing an app with SwiftUI is a lot of fun, but it can be a bit tricky at times. One such challenge is initializing your app with an async function.

## Initial conditions
Let's discuss a simple application that consists of just two view flows. For instance, the app should show the login screen, and once the user is logged in, it should display the main screen. Let's also assume that our application stores its state  in some kind of thread-safe AppState class, which is guarded by its own AppStateActor actor. This means we can only read it from async functions.

## Question
The pressing question then becomes: how do we initialize the app with an async function to check if the user is logged in?

## Solutions
In this App you can find three approaches of how to solve this problem:
* 1. Using View.onAppear method "SwiftUIAsyncAppInitApp1.swift",
don't solve the screen flickering (if user was previously logged in)
* 2. Using View.task method "SwiftUIAsyncAppInitApp2.swift", 
don't solve the screen flickering (if user was previously logged in)
* 3. Using Task Synchronous and transfer state through global variables
 "SwiftUIAsyncAppInitApp3.swift",
 write a synchronous Task in which we will check the user's state. The problem is that we can't set the state of the app in that Synchronous Task (because we should perform changes on the Main Thread, which is already waiting for us to finish - this will lead to a deadlock). But we can use unsafe global variables to transfer the state to the main thread and finish the initialization of the root viewModel. Of course, global variables are not good practice, but in this case, it is the only way to transfer the state from the async function to the main thread.

The full article you can find [here:](https://medium.com/p/62920f6d2ec9)
 
