//
//  LogView.swift
//  SampleApp
//
//  Created by Ejay Torres on 11/21/24.
//

import SwiftData
import SwiftUI

struct LogView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Log.timestamp, order: .reverse), SortDescriptor(\Log.buttonName)]) var logs: [Log]

    var body: some View {
        if logs.count == 0 {
            Text("Logs are empty.")
                .font(.title)
        }
        
        else {
            List {
                ForEach(logs) { log in
                    NavigationLink(value: log) {
                        VStack(alignment: .leading) {
                            Text("\(log.buttonName) pressed")
                                .font(.headline)
                            
                            Text(log.timestamp.formatted(date: .numeric, time: .shortened))
                        }
                    }
                }
            }
        }
    }

    init(sort: SortDescriptor<Log>) {
        _logs = Query(sort: [sort])
    }
}

#Preview {
    LogView(sort: SortDescriptor(\Log.buttonName))
}

