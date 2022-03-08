//
//  ContentView.swift
//  Sales_Recreation_App
//
//  Created by adam janusewski on 3/7/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                Color(red: 0.9, green: 0.9, blue: 0.9)
                    .edgesIgnoringSafeArea(.all)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: Image(systemName: "chevron.backward").padding(.all, 12))
                    .background(Color.white)
                    .cornerRadius(8.0)
                
                
                ScrollView {
                    VStack {
                        Image("Painting1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                        Spacer()
                        
                        DescriptionView()
                            .offset(y: -40)
                    }
                    .edgesIgnoringSafeArea(.top)
                    
                    HStack{
                        Text("$6990")
                            .font(.custom("Copperplate", size: 28))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            Text("Place Bid")
                                .padding()
                                .padding(.horizontal)
                                .background(Color.white)
                                .cornerRadius(10.0)
                                .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                        })
                    }
                    .padding()
                    .padding(.horizontal)
                    .background(Color(red: 0.4, green: 0.4, blue: 0.4))
                    .cornerRadius(50, corners: .topLeft)
                    .frame(maxHeight: .infinity)
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
}
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DescriptionView: View {
    var body: some View {
        VStack (alignment: .leading){
            Text("A Night in France")
                .font(.custom("Copperplate", size: 28))
                .fontWeight(.bold)
            
            HStack(spacing:3) {
                Image(systemName: "hand.thumbsup")
                Text("25")
                    .opacity(0.5)
                Spacer()
                
            }
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Text("Painted by famed French Renasaunce artist Lafluer La Calacha, this extravigent piece brings peace and tranquility to the city streets.  Its fond usage of colours are divine, yet subtle. Painted in all transient oil, this is a piece of the ages.")
                .lineSpacing(8.0)
                .opacity(0.6)
            
            HStack (alignment: .top){
                VStack(alignment: .leading) {
                    Text("Size")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("Height: 44 cm")
                        .opacity(0.6)
                    Text("Width: 60 cm")
                        .opacity(0.6)
                    Text("Canvas: Canvas")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading) {
                    Text("Stats")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("Year: 1602")
                        .opacity(0.6)
                    Text("Condition: A-")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            
            HStack (alignment: .bottom){
                VStack(alignment: .leading) {
                    Text("Primary Colors")
                        .fontWeight(.semibold)
                    
                    
                        HStack {
                            ColorDotView(color: .blue)
                            ColorDotView(color: .yellow)
                            ColorDotView(color: .purple)
                        }
                    }
                    
                    Spacer()
                
                
                VStack (alignment: .leading){
                    Text("Quantity")
                        .fontWeight(.semibold)
                    
                    
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "minus")
                                .padding(.all, 8)
                            }
                        .frame(width: 30, height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                    }
                }
                
                Text("1")
                    .font(.custom("Times", size: 20))
                    .fontWeight(.bold)
                    .padding(.horizontal, 8)
                
                Button(action: {}) {
                    Image(systemName: "plus")
                        .padding(.all, 8)
                }
//                .frame(width: 30, height: 30)
                .background(Color(.black))
                .clipShape(Circle())
                .foregroundColor(.white)
            }
        }
        .padding()
        .padding(.top)
        .background(Color.white)
        .cornerRadius(40.0)
    }
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}
