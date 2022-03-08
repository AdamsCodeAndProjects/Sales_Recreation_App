//
//  Home.swift
//  Sales_Recreation_App
//
//  Created by adam janusewski on 3/7/22.
//

import SwiftUI
struct Home: View {
    var body: some View {
        
        NavigationView {
            VStack {
                HomeView()
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image(systemName: "case")
                    .padding().background(Color(.white))
                    .cornerRadius(10.0)
            }
            Spacer()
            Button(action: {}) {
                Image("RandomGirl")
                    .resizable()
                    .frame(width:42, height: 42)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Jano Art")
            .fontWeight(.bold)
            .font(.title)
            .foregroundColor(.black)
            .padding(.horizontal)
            .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z:0))
            .shadow(color: .accentColor, radius: 2, x: 0, y: 15)
    }
}

struct SearchView: View {
    @State private var search: String = ""
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.trailing, 8)
                TextField("Search", text: $search)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10.0)
            
            Image(systemName: "arrowshape.turn.up.forward")
                .padding(.all, 20)
                .background(Color(red: 0.2, green: 0.3, blue: 0.9))
                .cornerRadius(10.0)
                .padding(.trailing)
            
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0){
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color(red: 0.0, green: 0.0, blue: 0.0): Color.black.opacity(0.2))
            
            if (isActive) {
                Color(red: 0.0, green: 0.0, blue: 0.0)
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
            
        }
        .padding(.trailing)
    }
}

struct ProductView: View {
    let image: Image
    let size: CGFloat
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200*(size/210))
                .cornerRadius(20.0)
            
            Text("Night in France")
                .font(.custom("Copperplate", size: 18))
                .fontWeight(.bold)
            
            HStack {
                Text("25")
                    .font(.custom("Copperplate", size:18))
                Image(systemName: "hand.thumbsup")
                
                Spacer()
                Text("$1299")
                    .font(.custom("Copperplate", size: 20))
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
    }
}

struct BottomNavBarView: View {
    let image: Image
    let action: ()-> Void
    var body: some View {
        Button(action: action, label: {
            image
                .frame(maxWidth: .infinity)
                .foregroundColor(Color.black)
        })
    }
}

struct HomeView: View {
    @State private var selectedIndex: Int = 0
    private let categories = ["All", "Realism", "Impressionism", "Dark", "Abstract"]
    var body: some View {
        ZStack {
            Color(red: 0.9, green: 0.9, blue: 0.9)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading) {
                    AppBarView()
                    
                    TagLineView()
                        .padding()
                    
                    SearchView()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< categories.count) { i in
                                CategoryView(isActive: i == selectedIndex, text: categories[i])
                                    .onTapGesture {
                                        selectedIndex = i
                                    }
                            }
                        }
                        .padding()
                    }
                    
                    Text("Most Popular")
                        .font(.custom("Copperplate", size: 28))
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< 4) { i in
                                NavigationLink (
                                    destination: ContentView(),
                                    label: {
                                        ProductView(image: Image("Painting\(i+1)"), size: 210)
                                    })
                                    .navigationBarHidden(true)
                                    .foregroundColor(.black)
                            }
                            .padding(.trailing)
                        }
                        .padding(.horizontal)
                    }
                    
                    Text("Recently Sold")
                        .font(.custom("Copperplate", size: 28))
                        .padding(.horizontal)
                        .padding(.top)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< 4) { i in
                                ProductView(image: Image("Painting\(i+1)"), size: 160)
                            }
                            .padding(.trailing)
                        }
                        .padding(.horizontal)
                    }
                }
            }
            
            // Custom NavBar Bottom
            HStack {
                BottomNavBarView(image: Image(systemName: "house")){}
                BottomNavBarView(image: Image(systemName: "heart")){}
                BottomNavBarView(image: Image(systemName: "cart")){}
                BottomNavBarView(image: Image(systemName: "person")){}
            }
            .padding()
            .background(Color.white)
            .clipShape(Capsule())
            .padding(.horizontal)
            .shadow(color: Color.black.opacity(0.4), radius: 8, x: 2, y: 6)
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}
