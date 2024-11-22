//
//  ContentView.swift
//  SampleApp
//
//  Created by Ejay Torres on 11/21/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var selectedTab:Tab = .home
    @State private var sortOrder = SortDescriptor(\Log.timestamp, order: .reverse)
    
    var body: some View {
        VStack {
            if selectedTab == .home{
                Text("Home")
                    .font(.system(size: 26))
                    .bold()
                HomeView()
            }
            
            if selectedTab == .logs{
                Text("Logs")
                    .font(.system(size: 26))
                    .bold()
                
                Menu("Sort By", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Button Name")
                            .tag(SortDescriptor(\Log.buttonName))
                        
                        Text("Date")
                            .tag(SortDescriptor(\Log.timestamp, order: .reverse))
                    }
                    .pickerStyle(.inline)
                }
                
                LogView(sort: sortOrder)
            }
            
            Spacer()
            
            NavigationBar(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Log.self, inMemory: true)
}
