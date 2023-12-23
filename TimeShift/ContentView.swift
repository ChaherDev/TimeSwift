//
//  ContentView.swift
//  TimeShift
//
//  Created by Chaher Machhour on 23/12/2023.
//

// Je vais choisir time
// on devra utiliser .number avec format
// Pour le temps il n'existe pas de format spécifique
// donc on va utiliser le .number

import SwiftUI

struct ContentView: View {
    
    @State private var userInput = 0.0
    
    let unities = ["seconds", "minutes", "hours", "days"]
    
    @State private var inputSelectedUnity = "seconds"
    @State private var outputSelectedUnity = "seconds"
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Your number") {
                    TextField("Put the number you want", value: $userInput, format: .number)
                        .keyboardType(.decimalPad)
                }
                Section("Input unit") {
                    Picker("Select an unity", selection: $inputSelectedUnity) {
                        ForEach(unities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Output unit") {
                    Picker("Select an unity", selection: $outputSelectedUnity) {
                        ForEach(unities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Conversion") {
                    Text("")
                }
            }
            .navigationTitle("TimeShift")
        }
    }
}

#Preview {
    ContentView()
}


// Il ne reste plus que la partie calcul
