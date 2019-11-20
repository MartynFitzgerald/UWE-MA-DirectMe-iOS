//
//  SwiftUIView.swift
//  DirectMe
//
//  Created by martyn on 13/11/2019.
//  Copyright © 2019 martyn.fitzgerald. All rights reserved.
//


import SwiftUI

struct SelectionModel{
    var selectionBackground: Int = 2 {
        didSet {
            switch selectionBackground {
                case 0:
                    UITabBar.appearance().backgroundColor = UIColor(red: 0/255, green: 255/255, blue: 155/255, alpha: 1)
                case 1:
                    UITabBar.appearance().backgroundColor = UIColor(red: 153/255, green: 15/255, blue: 153/255, alpha: 1)
                case 2:
                    UITabBar.appearance().backgroundColor = UIColor(red: 15/255, green: 157/255, blue: 88/255, alpha: 1)
                case 3:
                    UITabBar.appearance().backgroundColor = UIColor(red: 153/255, green: 15/255, blue: 15/255, alpha: 1)
                case 4:
                    UITabBar.appearance().backgroundColor = UIColor(red: 15/255, green: 135/255, blue: 153/255, alpha: 1)
                default:
                    UITabBar.appearance().backgroundColor = UIColor(red: 15/255, green: 157/255, blue: 88/255, alpha: 1)
            }
        }
    }
}

struct NavView: View {
    
    init () {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor(red: 15/255, green: 157/255, blue: 88/255, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 204/255, green: 204/255, blue: 204/255, alpha: 1)
        UITabBar.appearance().isTranslucent = true
        
        //Set defualt background color as green color
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().backgroundColor = UIColor(red: 15/255, green: 157/255, blue: 88/255, alpha: 1)
        UINavigationBar.appearance().barTintColor = UIColor(red: 15/255, green: 157/255, blue: 88/255, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = true
        //UINavigationBar.appearance().edgesIgnoringSafeArea(.all)
    }
    
    @State private var selection = SelectionModel()
    
    var body: some View {
        TabView(selection: $selection.selectionBackground){
            InformationView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "info.circle.fill")
                            //Not working yet
                        .animation(.interpolatingSpring(mass: 0.7, stiffness: 200, damping: 10, initialVelocity: 4))
                        Text("Info")
                    }
                }
                .tag(0)
            UnknownView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "questionmark.circle")
                        Text("Unknown")
                    }
                }
                .tag(1)
            MapView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "map")
                        Text("Map")
                    }
                }
                .tag(2)
            HistoryView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "clock")
                        Text("History")
                    }
                }
                .tag(3)
            AccountView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "person.crop.circle.fill")
                        Text("Account")
                    }
                }
                .tag(4)
        }
        .accentColor(.white)
    }
}

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView()
    }
}