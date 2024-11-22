//
//  HomeView.swift
//  SampleApp
//
//  Created by Ejay Torres on 11/21/24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        VStack (alignment: .center, spacing: -20) {
            createButton(name: "Button 1", color:.red)
            createButton(name: "Button 2", color:.blue)
            createButton(name: "Button 3", color:.yellow)
            createButton(name: "Button 4", color:.green)
        }
    }
    
    private func createButton(name: String, color: Color) -> some View {
        return AnyView(Button(action: {click(name: name)}) {
            Text(name)
              .padding()
              .bold()
              .frame(maxWidth: .infinity)
              .foregroundColor(.white)
              .background(color)
              .cornerRadius(10)
              .accessibilityIdentifier(name)
        }.padding(40))
    }

    private func click(name: String) {
        withAnimation {
            let log = Log(buttonName: name)
            modelContext.insert(log)
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Log.self, configurations: config)
        let log = Log(buttonName: "Button 1")
        return HomeView().modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
