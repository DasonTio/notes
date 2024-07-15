//
//  notesApp.swift
//  notes
//
//  Created by Dason Tiovino on 09/07/24.
//

import SwiftUI
import SwiftData

@main
struct notesApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(NavigationViewModel())
        }.modelContainer(for: [
            Note.self,
            NoteLog.self,
            HabitCategory.self,
            Habit.self,
            HabitLog.self,
            Folder.self,
            Checklist.self,
        ])
    }
}
