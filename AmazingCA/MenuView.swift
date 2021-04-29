//
//  MenuView.swift
//  Amazing.ca
//
//  Created by Djallil Elkebir on 2021-04-28.
//

import SwiftUI

struct MenuView: View {
    @State var searchText: String = ""
    @State var revealAll: Bool = false
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("firstBackgroundColor"), Color("secondBackgroundColor").opacity(0.8)]), startPoint: .leading, endPoint: .trailing).edgesIgnoringSafeArea(.all).blur(radius: 300)
            ScrollView(.vertical) {
                VStack {
                    Spacer(minLength: 70)
                    Group{
                    MenuRow()
                    MenuRow(title: "Buy Again")
                    MenuRow(title: "Your Wish List")
                    MenuRow(title: "Your Account")
                    }
                    Group {
                    // programs & Features
                    SubMenuRow()
                    SubMenuRow(title:"Subscribe & Save")
                    SubMenuRow(title:"Baby Registry")
                        if revealAll{
                            SmallSeparator()
                            SubMenuRow(title:"Amazing Business")
                            SubMenuRow(title:"Amazing Cash")
                            SubMenuRow(title:"Amazing Rewards")
                            SubMenuRow(title:"Amazing Family")
                            SubMenuRow(title:"I'm Amazingly lazy")
                            SubMenuRow(title:"To do other rows")
                        }
                    RevealAll(revealAll: $revealAll)
                    }
                    MenuRow(title: "Shop by Department")
                    // banniere
                    MenuRow(title: "Settings 🇨🇦")
                    MenuRow(title: "Customer Service")

                    Spacer(minLength: 80)
                }
            }
            VStack {
                ZStack {
                    VStack {
                        LinearGradient(gradient: Gradient(colors: [Color("firstBackgroundColor"), Color("secondBackgroundColor")]), startPoint: .leading, endPoint: .trailing).frame(height: 100).edgesIgnoringSafeArea(.all)
                        Spacer()
                    }
                    VStack {
                        TopSearchBar(searchText: $searchText)
                        Spacer()
                    }
                }
                   
                Spacer()
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuRow: View {
    var title: String = "Your Orders"
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Text(title).font(.system(size: 24, weight: .medium, design: .default)).foregroundColor(.black)
            }).padding(.leading,24)
            Spacer()
        }.padding()
    }
}

struct SubMenuRow: View {
    var title: String = "Today's Deals"
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Text(title).font(.system(size: 18, weight: .regular, design: .default)).foregroundColor(.black)
            }).padding(.leading,32)
            Spacer()
        }.padding()
    }
}

struct RevealAll: View {
    @Binding var revealAll: Bool
    var body: some View {
        HStack {
            Button(action: {revealAll.toggle()}, label: {
                HStack {
                    if !revealAll {
                        Image(systemName: "arrow.down").font(.headline)
                        Text("See All").font(.headline)
                    }
                    if revealAll {
                        Image(systemName: "arrow.up").font(.headline)
                        Text("See less").font(.headline)
                    }
                }.foregroundColor(.black)
                .padding()
            })
            Spacer()
        }.padding(.leading, 24)
    }
}

struct SmallSeparator: View {
    var body: some View {
        Rectangle().frame(width: 300, height: 1, alignment: .center).opacity(0.1)
            .shadow(color: .black.opacity(0.5), radius: 10, x: 0.0, y: 3)
    }
}
