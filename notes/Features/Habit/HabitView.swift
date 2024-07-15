//
//  HabitView.swift
//  notes
//
//  Created by Dason Tiovino on 09/07/24.
//

import SwiftUI
import SwiftData


struct HabitView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.modelContext) var modelContext
    @StateObject private var viewModel = HabitViewModel()
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            List{
                ForEach($viewModel.folderData.filter{$0.wrappedValue.parentId == nil}){ folder in
                    FolderCard(
                        model: folder,
                        folderData: $viewModel.folderData,
                        data: $viewModel.data
                    )
                }
                ForEach($viewModel.data){content in
                    HabitCard(model: content)
                        .swipeActions{
                            Button("Delete", systemImage: "trash", role: .destructive){
                                viewModel.deleteHabit(content.wrappedValue)
                            }
                        }
                }
            }.listRowSeparator(.hidden)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
            }
        })
        .frame(
            maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
            maxHeight: .infinity,
            alignment: Alignment(
                horizontal: .leading,
                vertical: .top
            )
        )
        .onAppear{
            viewModel.modelContext = modelContext
            viewModel.fetchHabitData()
            viewModel.fetchFolderData()
        }
    }
}

