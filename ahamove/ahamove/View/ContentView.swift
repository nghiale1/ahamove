//
//  ContentView.swift
//  ahamove
//
//  Created by Nghia on 19/09/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var isLoading = true
    @StateObject var viewModel = RepoViewModel()
    
    var body: some View {
        NavigationView {
            if let errorMessage = viewModel.errorMessage {
                           Text(errorMessage)
                               .foregroundColor(.red)
           } else if isLoading {
               ProgressView("Loading...")
                   .padding()
           } else if let organ = viewModel.organization, let repos = viewModel.repositories {
                    ScrollView {
                        VStack(alignment: .leading){
                            OrganizationView(organ: organ)
                            Text("Popular repositories").padding(.top,16)
                            ForEach(repos, id: \.self.id) { repo in
                                RepoRow(repo: repo)
                            }
                            Spacer()
                        }.padding(16)
                    }
                    
                }
            }
        
        .onAppear {
            isLoading = true
            viewModel.fetchOrganization {
                isLoading = false
            }
        }
        
    }
    
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
