//
//  ContentView.swift
//  TimeShift
//
//  Created by Chaher Machhour on 23/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userInput = 0.0
    
    let inputUnities = ["seconds", "minutes", "hours", "days"]
    let outputUnities = ["seconds", "minutes", "hours", "days"]
    
    @State private var inputSelectedUnity = "seconds"
    @State private var outputSelectedUnity = "seconds"
    
    var convertedValue: Double {
        switch inputSelectedUnity {
        case "seconds":
            switch outputSelectedUnity {
            case "seconds":
                return userInput
            case "minutes":
                return userInput / 60
            case "hours":
                return userInput / 60 / 60
            case "days":
                return userInput / 60 / 60 / 24
            default:
                return 0
            }
        case "minutes":
            switch outputSelectedUnity {
            case "seconds":
                return userInput * 60
            case "minutes":
                return userInput
            case "hours":
                return userInput / 60
            case "days":
                return userInput / 60 / 24
            default:
                return 0
            }
        case "hours":
            switch outputSelectedUnity {
            case "seconds":
                return userInput * 60 * 60
            case "minutes":
                return userInput * 60
            case "hours":
                return userInput
            case "days":
                return userInput / 24
            default:
                return 0
            }
        case "days":
            switch outputSelectedUnity {
            case "seconds":
                return userInput * 24 * 60 * 60
            case "minutes":
                return userInput * 24 * 60
            case "hours":
                return userInput * 24
            case "days":
                return userInput
            default:
                return 0
            }
        default:
            return 0
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Your number") {
                    TextField("Put the number you want", value: $userInput, format: .number)
                        .keyboardType(.decimalPad)
                }
                Section("Input unit") {
                    Picker("Select an unity", selection: $inputSelectedUnity) {
                        ForEach(inputUnities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Output unit") {
                    Picker("Select an unity", selection: $outputSelectedUnity) {
                        ForEach(outputUnities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Conversion") {
                    Text("\(convertedValue)")
                }
            }
            .navigationTitle("TimeShift")
        }
    }
}

#Preview {
    ContentView()
}
