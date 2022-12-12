//
//  ContentView.swift
//  TwoSwiftUIList
//
//  Created by imyanmar on 12/12/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            List{
                ForEach(1...18, id: \.self) { index in
                    InnerView()
                }.frame(maxHeight: .infinity, alignment: .topLeading)
                .frame(minHeight: 150, maxHeight: .infinity)
            }
            .frame(height: CGFloat(18) * geometry.size.height)
        }

       
    }
}

struct InnerView: View {
    @State private var showAll = false

    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                Button("Toggle rows") {
                    // toggle the value of showAll
                    self.showAll.toggle()
                }
                ForEach(1...(showAll ? 7 : 3), id: \.self) { index in
                    //CellView()
//                    HStack{
//                        Text("A")
//                        Text("B")
//                    }
                    VStack{
                        HStack{
                            Text("Hi").frame(width: geometry.size.width * 0.7)
                            Text("Row \(index)").frame(width: geometry.size.width * 0.3)
                        }.frame(width: geometry.size.width)
                        Spacer()
                    }
                }
                 // prevent the list from scrolling by fixing its size
            }
            .frame(width: geometry.size.width)
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct CellView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack{
                HStack{
                    Text("Hi").frame(width: geometry.size.width * 0.7)
                    Text("Row ").frame(width: geometry.size.width * 0.3)
                }.frame(width: geometry.size.width)
                Spacer()
            }
        }
    }
}
