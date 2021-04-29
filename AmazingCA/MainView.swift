//
//  ContentView.swift
//  Amazing.ca
//
//  Created by Djallil Elkebir on 2021-04-26.
//

import SwiftUI

struct MainView: View {
    @State var selectedTab: Int = 0
    var body: some View {
        ZStack {
            
            if selectedTab == 0{
                HomeView()
            }
            if selectedTab == 1{
                ProfilView()
            }
            if selectedTab == 2{
                CartView()
            }
            if selectedTab == 3{
                MenuView()
            }
            TabBar(selectedTab: $selectedTab)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct TabBar: View {
    @Binding var selectedTab: Int
    var body: some View {
        VStack{
            Spacer()
            HStack {
                Spacer()
                Button(action: {selectedTab = 0}, label: {
                    VStack {
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous).frame(width: 50, height: 5)
                            .offset(y: -16.0).foregroundColor(Color("selectedTab"))
                            .opacity(selectedTab == 0 ? 1 : 0)
                    Image(systemName: "house").padding(.horizontal,24)
                        .font(.title2)
                        .foregroundColor(selectedTab == 0 ? Color("selectedTab") : Color.black)
                    }
                })
                Spacer()
                Button(action: {selectedTab = 1}, label: {
                    VStack {
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous).frame(width: 50, height: 5)
                            .offset(y: -18.5).foregroundColor(Color("selectedTab"))
                            .opacity(selectedTab == 1 ? 1 : 0)
                    Image(systemName: "person").padding(.horizontal,24)
                        .font(.title2)
                        .foregroundColor(selectedTab == 1 ? Color("selectedTab") : Color.black)
                    }
                })
                Spacer()
                Button(action: {selectedTab = 2}, label: {
                    VStack {
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous).frame(width: 50, height: 5)
                            .offset(y: -17.0).foregroundColor(Color("selectedTab"))
                            .opacity(selectedTab == 2 ? 1 : 0)
                    Image(systemName: "cart").padding(.horizontal,24)
                        .font(.title2)
                        .foregroundColor(selectedTab == 2 ? Color("selectedTab") : Color.black)
                    }
                })
                Spacer()
                Button(action: {selectedTab = 3}, label: {
                    VStack {
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous).frame(width: 50, height: 5)
                            .offset(y: -17.0).foregroundColor(Color("selectedTab"))
                            .opacity(selectedTab == 3 ? 1 : 0)
                        Image(systemName: "line.horizontal.3.circle").padding(.horizontal,24)
                            .font(.title2)
                            .foregroundColor(selectedTab == 3 ? Color("selectedTab") : Color.black)
                    }
                })
                Spacer()
            }
            .padding()
            .background(Color.white.edgesIgnoringSafeArea(.all))
            
        }.shadow(color: .black.opacity(0.1), radius: 1, x: 0.0, y: -1)
    }
}




