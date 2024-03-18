//
//  TabBarView.swift
//  SMARTBUY
//
//  Created by apprenant60 on 28/06/2022.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        barView()
    }
}
struct barView : View{
    @State var selectedtab = "house"
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    @State var xAxis : CGFloat = 0
    
    var body : some View{
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $selectedtab){
                
                PageDaceuille()
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("house")
                
                DepensesView()
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("dollarsign.square")
                
                ProjetView()
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("list.bullet.indent")
                
                CarteVirtuel()
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("creditcard")
            }
       
        
        HStack(spacing : 0){
            ForEach(tabs,id : \.self ){image in
                
                GeometryReader { reader in
                    Button {
                        withAnimation(.spring()) {
                            selectedtab = image
                            xAxis = reader.frame(in: .global).minX
                        }
                    } label: {
                        Image(systemName: image)
                            .font(.system(size: 30))
                            .foregroundColor(selectedtab == image ? getColor(image: image) : Color.white)
                            .padding(selectedtab == image ? 15 : 0)
                            .background(Color.couleurViolet.opacity(selectedtab == image ? 1 : 0))
                            .clipShape(Circle())
                            .offset(x:reader.frame(in: .global).minX - reader.frame(in: .global).midX,y:selectedtab == image ? -50 : 0)
                            
                            
                    }.onAppear {
                        if image == tabs.first{
                            xAxis = reader.frame(in: .global).minX
                        }
                    }
            
                } .frame(width: 25, height: 25)
                
                if image != tabs.last{Spacer(minLength: 0)}

                
            }
        }.padding(.horizontal,30)
                .padding(.vertical)
                .background(Color.couleurViolet.opacity(0.9).clipShape(CustomShape(xAxis: xAxis)).cornerRadius(15))
                .padding(.horizontal)
                .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            
               
            
        }.ignoresSafeArea(.all, edges: .bottom)
    }
    func getColor (image : String)->Color{
        switch image {
        case "house":
            return Color.indigo
        case "dollarsign.square" :
            return Color.indigo
        case "list.bullet.indent" :
            return Color.indigo
        case "creditcard" :
            return Color.indigo
        default :
            return Color.blue
        }
    }
}

var tabs = ["house","dollarsign.square","list.bullet.indent","creditcard"]


struct CustomShape : Shape {
    var xAxis : CGFloat
    
    func path(in rect: CGRect) -> Path {
        return Path{path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let center = xAxis
            
            path.move(to: CGPoint(x: center - 50 , y: 0))
            
            let to1 = CGPoint(x: center , y: 40)
            let control1 = CGPoint(x: center - 25, y: 0)
            let control2 = CGPoint(x: center - 35, y: 35)
            
            let to2 = CGPoint(x: center + 55, y: 0)
            let control3 = CGPoint(x: center + 40, y: 40)
            let control4 = CGPoint(x: center + 40, y: 0)
            
            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)
        }
    }
    
    
}


struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            
    }
}
