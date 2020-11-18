//
//  ContentView.swift
//  Bullseye
//
//  Created by Angel Daniel Alcudia on 15/11/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    
    var body: some View {
        VStack {
            Spacer()
            // Target row
            HStack {
                Text("Put the bullesye as close as you can to:")
                Text("\(target)")
            }
            
            Spacer()
            
            //Slider row
            HStack {
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
            }
            
            Spacer()

            //Button row
            Button(action: {
                print("Button pressed!")
                alertIsVisible = true
            }) {
                Text("Hit Me!")
            }
            .alert(isPresented: $alertIsVisible) { () ->
                Alert in
                return Alert(title: Text("Hello there!"), message: Text("The slider's value is \(sliderValueRounded()).\n" + "You scored \(self.pointsForCurrentRound()) points this round."), dismissButton: .default(Text("Awesome!")))
            }
            
            Spacer()
            
            //Score row
            HStack {
                Button(action: {
                    
                }, label: {
                    Text("Start over")
                })
                Spacer()
                Text("Score:")
                Text("9999")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: {
                    
                }, label: {
                    Text("Info")
                })
            }
            .padding(.bottom, 20)
    
        }
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    
    func pointsForCurrentRound() -> Int {
        100 - abs(target - sliderValueRounded())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
 
