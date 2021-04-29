//
//  ProfilView.swift
//  Amazing.ca
//
//  Created by Djallil Elkebir on 2021-04-27.
//

import SwiftUI

struct ProfilView: View {
    var body: some View {
        
        ZStack {
            
            ScrollView(.vertical) {
                VStack{
                    Spacer(minLength: 41)
                    Group {
                        Group {
                        ProfilSubHeader()
                        ProfilHorizontalButtons()
                        OrdersView()
                        Separator()
                        WishListView()
                        Separator()
                        }
                        Group{
                        YourAccountView()
                        Separator()
                        KeepShoppingView()
                        Separator()
                        }
                        HStack{
                            Text("Gift Card Balance: $0.00").font(.system(size: 24, weight: .bold, design: .default))
                            Spacer()
                        }.padding()
                        HStack {
                            Text("Redeem Gift Card")
                                .padding()
                                .background(Color("backgroundProduct"))
                                .cornerRadius(5)
                                .shadow(color: .black.opacity(0.5), radius: 1, x: 0.0, y: 0.0)
                                .padding(8)
                            Text("Reload Balance")
                                .padding()
                                .background(Color("backgroundProduct"))
                                .cornerRadius(5)
                                .shadow(color: .black.opacity(0.5), radius: 1, x: 0.0, y: 0.0)
                                .padding(8)
                                
                        }
                        HStack {
                            Button(action: {}, label: {
                                Text("Manage and view activity")
                            }).foregroundColor(Color("selectedTab"))
                            .padding(.leading)
                            Spacer()
                        }
                    }
                    Spacer(minLength: 70)
                }
            }
            VStack {
                ProfilHeader()
                Spacer()
            }
        }
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}

struct ProfilHorizontalButtons: View {
    var body: some View {
        HStack{
            VStack{
                Button(action: {}, label: {
                    Text("Your Orders")
                        .foregroundColor(.black)
                        .frame(width: 180, height: 60, alignment: .center)
                        .background(Color("backgroundProduct"))
                        .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                        .shadow(color: Color.black.opacity(0.8), radius: 1, x: 0.0, y: 0.0)
                })
                Button(action: {}, label: {
                    Text("Your Account")
                        .foregroundColor(.black)
                        .frame(width: 180, height: 60, alignment: .center)
                        .background(Color("backgroundProduct"))
                        .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                        .shadow(color: Color.black.opacity(0.8), radius: 1, x: 0.0, y: 0.0)
                }).padding(.top)
            }
            VStack{
                Button(action: {}, label: {
                    Text("Buy Again")
                        .foregroundColor(.black)
                        .frame(width: 180, height: 60, alignment: .center)
                        .background(Color("backgroundProduct"))
                        .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                        .shadow(color: Color.black.opacity(0.8), radius: 1, x: 0.0, y: 0.0)
                })
                Button(action: {}, label: {
                    Text("Your Wish List")
                        .foregroundColor(.black)
                        .frame(width: 180, height: 60, alignment: .center)
                        .background(Color("backgroundProduct"))
                        .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                        .shadow(color: Color.black.opacity(0.8), radius: 1, x: 0.0, y: 0.0)
                }).padding(.top)
            }
            
        }
    }
}

struct OrdersView: View {
    var body: some View {
        Group {
            HStack {
                Text("Your Orders").font(.system(size: 24, weight: .bold, design: .default))
                Spacer()
            }.padding()
            ScrollView(.horizontal,showsIndicators: false) {
                HStack{
                    ForEach(0 ..< 5) { item in
                        ZStack {
                            Color.white
                            
                            
                            HStack {
                                Image("iphone1")
                                    .resizable()
                                    .scaledToFit()
                                
                                Image("product3")
                                    .resizable()
                                    .scaledToFit()
                            }
                            
                        }.frame(width: 240, height: 150)
                        .cornerRadius(7)
                        .shadow(color: .black.opacity(0.4), radius: 1, x: 0.0, y: 0.0)
                        .padding(.leading)
                    }
                }.frame(height: 170)
            }
            HStack {
                Button(action: {}, label: {
                    Text("See all orders")
                }).foregroundColor(Color("selectedTab"))
                .padding(.leading)
                Spacer()
            }
        }
    }
}

struct Separator: View {
    var body: some View {
        Rectangle().frame(height: 5).foregroundColor(Color("grayBackground"))
    }
}

struct WishList: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text("Shoping List")
                Text("Private").font(.caption2).foregroundColor(.gray)
            }.padding()
            Spacer()
            ZStack{
                Color("backgroundProduct")
                Image("product2")
                    .resizable()
                    .frame(width: 60, height: 60)
            }.frame(width: 70, height: 70)
            .cornerRadius(4)
            .padding()
        }.frame(width: 330, height: 100, alignment: .center)
        .background(Color.white)
        .cornerRadius(7)
        .shadow(color: .black.opacity(0.2), radius: 2, x: 0.0, y: 0.0)
    }
}

struct WishListView: View {
    var body: some View {
        Group {
            HStack{
                Text("Your Wish List").font(.system(size: 24, weight: .bold, design: .default))
                Spacer()
            }.padding()
            
            TabView {
                WishList().offset(y:-20)
                WishList().offset(y:-20)
                WishList().offset(y:-20)
                WishList().offset(y:-20)
                
            }
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 160)
            
            HStack {
                Button(action: {}, label: {
                    Text("View all lists")
                }).foregroundColor(Color("selectedTab"))
                .padding(.leading)
                Spacer()
            }
        }
    }
}

struct YourAccountView: View {
    var body: some View {
        Group {
            HStack{
                Text("Your Account").font(.system(size: 24, weight: .bold, design: .default))
                Spacer()
            }.padding()
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    Text("Your Browsing History")
                        .padding()
                        .background(Color("backgroundProduct"))
                        .cornerRadius(5)
                        .shadow(color: .black.opacity(0.5), radius: 1, x: 0.0, y: 0.0)
                        .padding(.leading)
                    Text("Gift Cards")
                        .padding()
                        .background(Color("backgroundProduct"))
                        .cornerRadius(5)
                        .shadow(color: .black.opacity(0.5), radius: 1, x: 0.0, y: 0.0)
                    
                    Text("Subscribe & Save")
                        .padding()
                        .background(Color("backgroundProduct"))
                        .cornerRadius(5)
                        .shadow(color: .black.opacity(0.5), radius: 1, x: 0.0, y: 0.0)
                    
                    Text("Amazing")
                        .padding()
                        .background(Color("backgroundProduct"))
                        .cornerRadius(5)
                        .shadow(color: .black.opacity(0.5), radius: 1, x: 0.0, y: 0.0)
                        .padding(.trailing)
                    
                }.frame(height: 100)
            }
        }
    }
}

struct ProfilHeader: View {
    var body: some View {
        HStack{
            Text("Amazing").font(.system(size: 24, weight: .black, design: .rounded))
            Text(".ca")
                .offset(x: -8.0, y: 5.0)
            Spacer()
            Image(systemName: "bell").font(.title).padding(.horizontal)
            Image(systemName: "magnifyingglass").font(.title).padding(.trailing)
        }.padding(8)
        .background(LinearGradient(gradient: Gradient(colors: [Color("firstBackgroundColor"), Color("secondBackgroundColor")]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all))
        
    }
}

struct ProfilSubHeader: View {
    var body: some View {
        HStack{
            Text("Hello,\n Username").font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(Color("strongGray"))
            Spacer()
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(Color("strongGray"))
        }.padding(16)
        .background(VStack {
            LinearGradient(gradient: Gradient(colors: [Color("firstBackgroundColor"), Color("secondBackgroundColor").opacity(0)]), startPoint: .top, endPoint: .bottom)
            Spacer(minLength: 40)
        })
    }
}

struct KeepShoppingView: View {
    var body: some View {
        Group {
            HStack{
                Text("Keep shopping for").font(.system(size: 24, weight: .bold, design: .default))
                Spacer()
                Button(action: {}, label: {
                    Text("Edit").foregroundColor(Color("selectedTab"))
                })
            }.padding()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(0 ..< 5) { item in
                        ZStack {
                            Color.white
                            
                            
                            HStack {
                                Image("iphone1")
                                    .resizable()
                                    .scaledToFit()
                                
                            }
                            
                        }.frame(width: 180, height: 150)
                        .cornerRadius(7)
                        .shadow(color: .black.opacity(0.4), radius: 1, x: 0.0, y: 0.0)
                        .padding(.leading)
                    }
                }.frame(height: 170)
            }
            HStack {
                Button(action: {}, label: {
                    Text("View your browsing history")
                }).foregroundColor(Color("selectedTab"))
                .padding(.leading)
                Spacer()
            }
        }
    }
}
