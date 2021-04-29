//
//  CartView.swift
//  Amazing.ca
//
//  Created by Djallil Elkebir on 2021-04-28.
//

import SwiftUI

struct CartView: View {
    @State var searchText: String = ""
    @State var buyAgainSearchText: String = ""
    @State var selectedTab: Int = 0
    @State var moveCart: CGFloat = 0
    @State var cartDirection: Bool = true
    @State var filtering: Bool = false
    
    var body: some View {
        ZStack {

            VStack {
                Spacer(minLength: 50)
                HeaderCartView(selectedTab: $selectedTab)
                ScrollView(.vertical){
                    
                    if selectedTab == 0 {
                        VStack {
                            Group {
                            TopLocationView()
                            LottieCartHeader(moveCart: $moveCart)
                            Divider()
                            ReturnView()
                            Divider()
                            CreaditCardView()
                            }
                            Divider()
                            Divider().padding(.top)
                            Group {
                                CartHorizontalProduct()
                            Divider()
                            CartHorizontalProduct(title: "Top pick for you")
                            Divider()
                            CartHorizontalProduct(title: "Items from your Wish List")
                            ContinueShopping()
                            }
                            Spacer(minLength: 80)
                        }
                    }
                    if selectedTab == 1 {
                        VStack {
                            BuyAgainSearch(buyAgainSearchText: $buyAgainSearchText, filtering: $filtering)
                            ForEach(0 ..< 4) { item in
                                HorizontalProductsBuyAgain()
                            }
                            Spacer(minLength: 80)
                        }.background(Color("grayBackground").edgesIgnoringSafeArea(.all))
                    }
                }.offset(y:-8)
                
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

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}

struct HeaderCartView: View {
    @Binding var selectedTab: Int
    var body: some View {
        HStack {
            Button(action:{selectedTab = 0}){
                VStack {
                    Text("Cart")
                        .font(.headline)
                        .padding(8)
                    if selectedTab == 0 { Rectangle().frame(width: 40, height: 3, alignment: .center)
                    }
                }.foregroundColor(.black)
            }.offset(y:selectedTab == 0 ? 6 : 0)
            Button(action:{selectedTab = 1}){
                VStack {
                    Text("Buy Again")
                        .font(.headline)
                        .padding(8)
                    if selectedTab == 1 { Rectangle().frame(width: 40, height: 3, alignment: .center)
                    }
                }.foregroundColor(.black)
            }.offset(y:selectedTab == 1 ? 6 : 0)
            Spacer()
        }
        .frame(height: 60)
        .background(LinearGradient(gradient: Gradient(colors: [Color("firstBackgroundColor"), Color("secondBackgroundColor")]), startPoint: .leading, endPoint: .trailing))
    }
}

struct LottieCartHeader: View {
    @Binding var moveCart: CGFloat
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
        HStack {
            LottieCartView().frame(width: 100, height: 100, alignment: .center)
                .offset(x: moveCart)
                .onReceive(timer) { input in
                    if moveCart <= 50 {
                        withAnimation{
                            moveCart += 1
                        }
                    }
                    else  {
                        withAnimation{
                            moveCart = 0
                        }
                    }
                }
            Spacer()
            VStack {
                Text("Your Amazing Cart is Empty")
                    .font(.system(size: 16, weight: .medium, design: .default))
                    .padding()
                HStack {
                    Button(action: {}, label: {
                        Text("See recommendations")
                    }).foregroundColor(Color("selectedTab"))
                    .padding()
                    .padding(.leading,24)
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

struct ReturnView: View {
    var body: some View {
        HStack{
            VStack{
                HStack {
                    Text("Returns are easy")
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .padding(.leading)
                        .padding(.top)
                    Spacer()
                }
                HStack {
                    Text("30-day returns on millions of items")
                        .font(.system(size: 16, weight: .regular, design: .default))
                        .padding(.leading)
                        .padding(.top, 4)
                    Spacer()
                }
            }
            Spacer()
            LottieBoxView()
                .frame(width: 80, height: 60)
                .padding()
        }
    }
}

struct CreaditCardView: View {
    var body: some View {
        HStack{
            Image(systemName:"creditcard.fill")
                .resizable()
                .scaledToFit()
                .frame(height: 50)
                .padding(8)
                .foregroundColor(Color("selectedTab"))
            Text("Username, get a $500 Amazing.ca Gift Card instrantly, plus up to 100% back for 6 mounths after approval for the Amazing.ca Rewards.\n Pay for this order after approval.")
                .font(.system(size: 14, weight: .medium, design: .default))
                .padding(8)
                .multilineTextAlignment(.center)
        }.frame(height: 100)
    }
}

struct CartHorizontalProduct: View {
    var title: String = "Your recently viewed items"
    var body: some View {
        Group {
            HStack{
                Text(title).font(.system(size: 24, weight: .bold, design: .default))
                Spacer()
            }.padding(8)
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 8){
                    ForEach(0 ..< 5) { item in
                        VStack {
                            Image("iphone2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 80)
                                .shadow(color: Color.black.opacity(0.1), radius: 2, x: 1, y: 2)
                            Button(action:{}){
                                Text("Pretty Long product Description").frame(height: 50)
                                    .foregroundColor(Color("selectedTab"))
                            }
                            HStack{
                                Image(systemName: "star.fill").padding(.horizontal,-4).foregroundColor(.orange)
                                Image(systemName: "star.fill").padding(.horizontal,-4).foregroundColor(.orange)
                                Image(systemName: "star.fill").padding(.horizontal,-4).foregroundColor(.orange)
                                Image(systemName: "star.fill").padding(.horizontal,-4).foregroundColor(.orange)
                                Image(systemName: "star").padding(.horizontal,-4).foregroundColor(.orange)
                                Text("420").font(.caption).foregroundColor(Color("strongGray"))
                            }
                            .padding(.top, 4)
                            Text("CDN$118,21").font(.callout)
                                .foregroundColor(Color("brown"))
                                .padding(.trailing, 24)
                            Button(action:{}){
                            Text("Add to Cart").padding(10)
                                .font(.system(size: 14, weight: .regular, design: .default))
                                .background(Color.yellow)
                                .foregroundColor(.black)
                                .cornerRadius(10)
                                .padding(.trailing,24)
                                .shadow(color: .black.opacity(0.2), radius: 2, x: 0.0, y: 0.0)
                            }
                            
                        }
                        .background(Color.white)
                        .frame(width: 150, height: 300, alignment: .center)
                        .cornerRadius(5)
                    }
                }.padding(.leading, 8)
            }
        }
    }
}

struct ContinueShopping: View {
    var body: some View {
        Text("Continue shopping").padding(10)
            .font(.system(size: 16, weight: .regular, design: .default))
            .frame(width: 320)
            .background(Color.yellow)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.2), radius: 2, x: 0.0, y: 0.0)
    }
}

struct BuyAgainSearch: View {
    @Binding var buyAgainSearchText : String
    @Binding var filtering: Bool
    var body: some View {
        Group{
            HStack{
                Text("Username's Buy Again").padding(8)
                    .font(.system(size: 18, weight: .bold, design: .default))
                Spacer()
                Button(action: {filtering.toggle()}, label: {
                    HStack {
                        Text("Filter").font(.body)
                        Image(systemName:filtering ? "arrow.up" : "arrow.down").font(.caption2)
                        
                    }
                    .foregroundColor(.black)
                    .padding(4)
                    .background(Color.white)
                    .cornerRadius(5)
                    .shadow(color: .black.opacity(0.7), radius: 1, x: 0.0, y: 0.0)
                    .padding(8)
                })
            }
            .frame(height: 50)
            HStack{
                Image(systemName:"magnifyingglass").font(.body)
                    .foregroundColor(Color("strongGray"))
                TextField("Search all orders", text: $buyAgainSearchText).font(.system(size: 14, weight: .light, design: .default))
            }.padding(8)
            .frame(height: 50)
            .background(Color.white)
        }
    }
}

struct HorizontalProductsBuyAgain: View {
    var body: some View {
        HStack{
            VStack{
                Image("iphone1")
                    .resizable()
                    .scaledToFit()
                Text("Long test description")
                    .frame(height: 20)
                Text("$13.49")
                Text("Get it by Wed,May 5")
                    .font(.caption)
                    .foregroundColor(Color("strongGray"))
                Text("FREE Shipping on any order over 5000$")
                    .font(.caption)
                    .foregroundColor(Color("strongGray"))
                    .frame(height: 20)
                Button(action: {}, label: {
                    Text("Add to Cart")
                        .font(.system(size: 14, weight: .medium, design: .default))
                        .padding(8)
                        .padding(.horizontal)
                        .foregroundColor(.black)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.yellow.opacity(0.6), Color.yellow]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(4)
                    
                    
                })
            }
            .padding(8)
            .frame(width: 180, height: 250)
            .background(Color.white)
            
            VStack{
                Image("iphone1")
                    .resizable()
                    .scaledToFit()
                Text("Long test description")
                    .frame(height: 20)
                Text("$13.49")
                Text("Get it by Wed,May 5")
                    .font(.caption)
                    .foregroundColor(Color("strongGray"))
                Text("FREE Shipping on any order over 5000$")
                    .font(.caption)
                    .foregroundColor(Color("strongGray"))
                    .frame(height: 20)
                Button(action: {}, label: {
                    Text("Add to Cart")
                        .font(.system(size: 14, weight: .medium, design: .default))
                        .padding(8)
                        .padding(.horizontal)
                        .foregroundColor(.black)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.yellow.opacity(0.6), Color.yellow]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(4)
                    
                    
                })
            }
            .padding(8)
            .frame(width: 180, height: 250)
            .background(Color.white)
            
        }
    }
}
