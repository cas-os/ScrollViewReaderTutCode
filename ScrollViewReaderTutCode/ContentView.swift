//
//  ContentView.swift
//  ScrollViewReaderTutCode
//
//  Created by HAL-9001 on 11/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var textFiledText: String = ""
    @State var scrollToIndex: Int = 0
    
    var body: some View {
        
        
        VStack {
            TextField("Enter # here...", text: $textFiledText)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            
            Button("Go to pad ## ...") {
                withAnimation(.spring()) {
                    //proxy.scrollTo(30, anchor: .center)
                    if let index = Int(textFiledText) {
                        scrollToIndex = index
                    }
                }
                
            }
            
            ScrollView {
                ScrollViewReader { proxy in
                    
                    
                    
                    ForEach(0..<50) { index in
                        Text("Item # : \(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex, perform: { value in
                        proxy.scrollTo(value, anchor: nil)
                        
                    })
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
