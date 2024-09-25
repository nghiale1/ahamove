//
//  RepoRow.swift
//  ahamove
//
//  Created by Nghia on 21/09/2024.
//

import Foundation
import SwiftUI

struct RepoRow: View {
    var repo: RepositoryElement
    
    var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Text(repo.name ?? "")
                        .foregroundColor(.blue)
                        .font(.headline)
                        .padding(.bottom, 2)
                    
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(width: 60, height: 25)
                        Text(repo.visibility ?? "")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .frame(width: 60, height: 25)
                            .background(Color.white)
                            .cornerRadius(5)
                    }
                }
                
                Text(repo.description ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.vertical, 5)
                
                HStack() {
                    
                    if let language = repo.language {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .scaledToFit()
                            .foregroundColor(LanguageColor(from: language)?.color)
                        
                        Text(language)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    
                    Image("star").resizable().frame(width: 20, height: 20).scaledToFit()
                    Text("\(roundToK(repo.stargazersCount ?? 0))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    
                    Image("code-fork").resizable().frame(width: 20, height: 20).scaledToFit()
                    Text("\(roundToK(repo.forksCount ?? 0))")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
            .frame(maxWidth: .infinity)
        
        
    }
}
