//
//  HomeView.swift
//  Amazing.ca
//
//  Created by Djallil Elkebir on 2021-04-26.
//

import SwiftUI

struct HomeView: View {
    @State var searchText: String = ""
    @State var tabBarSelection: Int = 0
    let timer = Timer.publish(every: 6, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("firstBackgroundColor"), Color("secondBackgroundColor")]), startPoint: .leading, endPoint: .trailing).edgesIgnoringSafeArea(.all)
            VStack{
                TopSearchBar(searchText: $searchText)
                ScrollView(.vertical, showsIndicators: false) {
                    TopLocationView()
                    ZStack {
                        VStack {
                            TabView(selection:$tabBarSelection){
                            Image("colorbackground2")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 210)
                                .clipped()
                                .offset(y: -170)
                                .tag(0)
                            Image("colorbackground1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 210)
                                    .clipped()
                                    .offset(y: -170)
                                .tag(1)
                            }.onReceive(timer) { input in
                                if tabBarSelection == 1{
                                    withAnimation{
                                tabBarSelection = 0
                                    }
                                } else {
                                    withAnimation{
                                    tabBarSelection += 1
                                    }
                                }
                            }
                                
                              Spacer()
                        }
                        VStack {
                            Spacer()
                            HorizontalProductBar()
                            Image("headerpic1")
                                .resizable()
                                .frame(height: 70, alignment: .center)
                                .hueRotation(Angle(degrees: 20))
                                .overlay(Rectangle().foregroundColor(Color("backgroundSecondHeader")).opacity(0.8))
                                .overlay(Text("Welcome to Amazing.ca").font(.system(size: 24, weight: .bold, design: .default)).foregroundColor(Color.white)
                                            .shadow(color: .black.opacity(0.1), radius: 3, x: 1, y: 2)
                                )
                                .shadow(color: .white.opacity(0.1), radius: 3, x: 0.0, y: 0)
                            SecondHeaderHomeView().offset(y:-5)
                        }
                        
                    }.frame(height: 600)
                    .offset(y: -8)
                    FirstProductView().offset(y: -8)
                    FirstProductView(title: "Your Recommandations").offset(y: -8)
                    VStack{
                        HStack {
                            Text("Some Categories 'caus why not ?")
                                .font(.title3)
                            Spacer()
                        }
                        ForEach(0 ..< 4) { item in
                            CategorySmallBanner()
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .offset(y: -16)
                    Spacer(minLength: 80)
                }.background(Color("grayBackground"))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
struct TopSearchBar: View {
    @Binding var searchText: String
    var body: some View {
        VStack {
            HStack{
                Image(systemName:"magnifyingglass")
                TextField("Search Amazing.ca", text: $searchText)
                Image(systemName:"camera")
            }
            .padding(12)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: .black, radius: 1, x: 0.0, y: 0.0)
            .padding(.horizontal)
        }
    }
}

struct TopLocationView: View {
    var body: some View {
        HStack{
            Image(systemName:"pin")
            Text("Deliver to Full Name - Montreal H2X 1W7")
            Spacer()
        }.padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color("headerColor"), Color("headerColor").opacity(0.8)]), startPoint: .leading, endPoint: .trailing))
    }
}

struct HorizontalProductBar: View {
    var body: some View {
        ZStack {
            Color("grayBackground").opacity(1).frame(height: 160)
                .blur(radius: 5)
                .overlay(Color("grayBackground").opacity(0.8).blur(radius: 10).offset(y: -5))
                
            ScrollView(.horizontal) {
                HStack(spacing: 8){
                    ForEach(0 ..< 3) { item in
                        
                        VStack {
                            HStack {
                                Text("Your Orders").padding(8)
                                    .foregroundColor(Color("textOrderColor"))
                                Spacer()
                            }
                            Spacer()
                            Image("iphone2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .shadow(color: Color.black.opacity(0.1), radius: 2, x: 1, y: 2)
                                
                            
                        }
                        .background(Color.white)
                        .frame(width: 150, height: 160, alignment: .center)
                        .cornerRadius(5)
                        VStack {
                            Image("iphone1")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .shadow(color: Color.black.opacity(0.1), radius: 2, x: 1, y: 2)
                            Spacer()
                            HStack {
                                Spacer()
                                Text("Diffrent Layout").padding(8)
                                    .foregroundColor(Color("textOrderColor"))
                                Spacer()
                            }
                            
                        }
                        .background(Color.white)
                        .frame(width: 150, height: 160, alignment: .center)
                        .cornerRadius(5)
                        VStack {
                            Image("product2")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                .shadow(color: Color.black.opacity(0.1), radius: 2, x: 1, y: 2)
                                .padding(.top,8)
                                .padding(.horizontal,8)
                            Spacer()
                            HStack {
                                Spacer()
                                Text("Another one !").padding(8)
                                    .foregroundColor(Color("strongGray"))
                                Spacer()
                            }
                            
                        }
                        .background(Color.white)
                        .frame(width: 150, height: 160, alignment: .center)
                        .cornerRadius(5)
                    }
                }.padding(.leading, 8)
            }
        }
    }
}

struct SecondHeaderHomeView: View {
    var body: some View {
        HStack{
            VStack{
                HStack {
                    Text("Customer Orders Update").font(.system(size: 24, weight: .bold, design: .default))
                        .foregroundColor(Color("SecondHeaderTitle"))
                    Spacer()
                }
                HStack {
                    Text("We're working to deliver orders while keeping employees safe.").foregroundColor(.white)
                    Spacer()
                }
                HStack {
                    Text("Questions?")
                        .foregroundColor(.white)
                    Text(" Contact Customer Service").underline()
                        .foregroundColor(.white)
                        .onTapGesture {
                                //do something
                            }
                    Spacer()
                }
            }.padding(.leading,24)
        }
        .frame(maxWidth: .infinity, maxHeight: 150, alignment: .center)
        .background(Color("backgroundSecondHeader"))
    }
}

struct FirstProductView: View {
    var title: String = "Related to Items that you've viewed"
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.title3)
                Spacer()
            }.padding(.leading)
            HStack{
                VStack {
                    Image("iphone2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                    Text("Product Name")
                        .padding()
                        
                }
                
                .frame(width: 170, height: 200)
                .background(Color("backgroundProduct"))
                VStack {
                    Image("tv1")
                        .resizable()
                        .aspectRatio(contentMode: .fit).shadow(color: Color.black.opacity(0.3), radius: 2, x: 1, y: 2)
                    Spacer()
                    Text("Product Name")
                        .padding()
                        
                }
                
                .frame(width: 170, height: 200)
                .background(Color("backgroundProduct"))
            }
            HStack{
                VStack {
                    Image("iphone1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 1, y: 2)
                    Spacer()
                    Text("IPhone 7")
                        .padding()
                        
                }
                
                .frame(width: 170, height: 200)
                .background(Color("backgroundProduct"))
                VStack {
                    Image("product3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .aspectRatio(contentMode: .fit).shadow(color: Color.black.opacity(0.2), radius: 2, x: 1, y: 2)
                    Spacer()
                    Text("Product Name")
                        .padding()
                        
                }
                
                .frame(width: 170, height: 200)
                .background(Color("backgroundProduct"))
            }
        }
        .padding()
        .background(Color.white)
        .offset(y:-8.0)
    }
}


struct CategorySmallBanner: View {
    var body: some View {
        HStack{
            VStack {
                Image("product1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 180, height: 60, alignment: .center)
                    .clipped()
                Text("A random category")
                    .font(.system(size: 18, weight: .light, design: .default))
            }
            VStack {
                Image("product1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 180, height: 60, alignment: .center)
                    .clipped()
                Text("A random category")
                    .font(.system(size: 18, weight: .light, design: .default))
            }
            
        }.onTapGesture {
            // go to this category pls
        }
    }
}
