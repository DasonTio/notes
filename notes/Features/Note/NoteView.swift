//
//  NoteView.swift
//  notes
//
//  Created by Dason Tiovino on 10/07/24.
//

import Foundation
import SwiftUI
import SwiftData

extension Date{
    func noteFormatted() -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: self)
    }
}

struct NoteView: View {
    var id:String
    @Environment(\.modelContext) var modelContext
    @StateObject private var viewModel = NoteViewModel()

    var body: some View {
        ZStack{
            ScrollView{
                    VStack(alignment: .leading){
                        if let note = viewModel.data.first{
                            Text(note.title)
                                .font(.title)
                                .fontWeight(.bold)
                            
                            HStack{
                                Text("Repeat")
                                Button{
                                    viewModel.isActive = true
                                }label:{
                                    Text("Select")
                                }
                            }
                            
                            Divider()
                            
                            Text("My Goals")
                                .font(.headline)
                            
                            TextField(text: $viewModel.data[0].goal){}
                            
                            Text("My Action Plan")
                                .font(.headline)
                            
                            ForEach($viewModel.data[0].plans){ $list in
                                Toggle(
                                    list.content,
                                    isOn: $list.done
                                ).toggleStyle(ToggleCheckboxStyle(
                                    text: $list.content,
                                    axis: .vertical
                                ))
                            }
                            Divider()
                            ForEach($viewModel.data[0].note.contents) { $note in
                                VStack(alignment: .leading) {
                                    
                                    Text(note.createdAt.noteFormatted())
                                        .font(.headline)
                                    
                                    TextView(
                                        attributedText: $note.content,
                                        allowsEditingTextAttributes: true,
                                        font: .systemFont(ofSize: 24)
                                    )
                                    .frame(maxWidth: .infinity, minHeight: 200, maxHeight: .infinity)
                                }
                                .padding(.vertical)
                            }
                        }
                    }.padding(.horizontal)
            }
            
            if viewModel.isActive {
                RepeatNoteView(isActive: $viewModel.isActive)
            }
        }.onAppear{
            print(id)
            viewModel.modelContext = modelContext
            viewModel.fetchById(id: id)
        }
    }
}

