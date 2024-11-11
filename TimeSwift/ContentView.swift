//
//  ContentView.swift
//  TimeShift
//
//  Created by Chaher Machhour on 23/12/2023.
//

import SwiftUI

enum TimeUnit: String {
    case seconds = "seconds"
    case minutes = "minutes"
    case hours = "hours"
    case days = "days"
    
    func toSeconds(value: Decimal) -> Decimal {
        switch self {
        case .seconds:
            return value
        case .minutes:
            return value * 60
        case .hours:
            return value * 3600
        case .days:
            return value * 86400
        }
    }

    func fromSeconds(value: Decimal) -> Decimal {
        switch self {
        case .seconds:
            return value
        case .minutes:
            return value / 60
        case .hours:
            return value / 3600
        case .days:
            return value / 86400
        }
    }
}

struct ContentView: View {
    @State private var inputUnit: TimeUnit = .seconds
    @State private var outputUnit: TimeUnit = .minutes
    @State private var inputValue: String = ""
    @FocusState private var inputValueIsFocused: Bool // FocusState uniquement pour gérer le clavier

    var convertedValue: Decimal {
        let input = Decimal(string: inputValue) ?? 0
        let valueInSeconds = inputUnit.toSeconds(value: input)
        return outputUnit.fromSeconds(value: valueInSeconds)
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input Unit")) {
                    Picker("Input Unit", selection: $inputUnit) {
                        Text("seconds").tag(TimeUnit.seconds)
                        Text("minutes").tag(TimeUnit.minutes)
                        Text("hours").tag(TimeUnit.hours)
                        Text("days").tag(TimeUnit.days)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Output Unit")) {
                    Picker("Output Unit", selection: $outputUnit) {
                        Text("seconds").tag(TimeUnit.seconds)
                        Text("minutes").tag(TimeUnit.minutes)
                        Text("hours").tag(TimeUnit.hours)
                        Text("days").tag(TimeUnit.days)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Value to Convert")) {
                    TextField("Value", text: $inputValue)
                        .keyboardType(.decimalPad)
                        .focused($inputValueIsFocused) // Liaison avec FocusState
                }

                Section(header: Text("Result")) {
                    Text("\(NSDecimalNumber(decimal: convertedValue).doubleValue, specifier: "%.2f") \(outputUnit.rawValue)")
                }
            }
            .navigationTitle("TimeSwift")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if inputValueIsFocused {
                        Button("Done") {
                            inputValueIsFocused = false // Ferme le clavier en retirant le focus
                        }
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView()
}
