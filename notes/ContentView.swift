//
//  ContentView.swift
//  notes
//
//  Created by Dason Tiovino on 09/07/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var navigationViewModel: NavigationViewModel
    
    var body: some View {
        NavigationStack{
            switch navigationViewModel.currentDestination {
                case .home:
                    VStack{
                        List{
                            Section{
                                NavigationLink{
                                    // code here
                                }label:{
                                    HStack{
                                        Image(systemName: "folder")
                                        Text("Regular Notes")
                                    }
                                }
                            }
                            
                            Section{
                                NavigationLink{
                                    HabitView()
                                }label:{
                                    HStack{
                                        Image(systemName: "folder")
                                        Text("Habit Journey")
                                    }
                                }
                            }
                        }
                        .listSectionSpacing(.compact)
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                           HStack {
                               Text("NotePal")
                                   .bold()
                                   .font(.largeTitle)
                                   .padding(.leading)
                               Spacer()
                           }
                       }
                    }
                case .detail(let data):
                    NoteView(id: data)
            }
        }.onOpenURL{ url in
            guard url.scheme == "mynotes" else {return}
            
            if let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems {
                var newParams: [String: String] = [:]
                for queryItem in queryItems {
                    newParams[queryItem.name] = queryItem.value
                }
                
                navigationViewModel.navigateToDetail(with: newParams["id"] ?? "")
            }
        }
    }
}

#Preview {
    ContentView()
}
