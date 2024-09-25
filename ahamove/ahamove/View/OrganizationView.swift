//
//  OrganizationView.swift
//  ahamove
//
//  Created by Nghia on 23/09/2024.
//

import Foundation
import SwiftUI

struct OrganizationView: View {
    var organ: Organization
    
    var body: some View {
         HStack(alignment: .top) {
            AsyncImage(url: URL(string: organ.avatarURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray, lineWidth: 2)
                    )
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading, spacing: 0){
                Text(organ.name).font(.title).bold()
                Text(organ.description).font(.headline).foregroundStyle(.gray)
                HStack(spacing:0){
                    Image(systemName: "person.2").frame(width: 30, height: 30).scaledToFit()
                    Text("\(roundToK(organ.followers))")
                        .fontWeight(.bold)
                    + Text(" followers")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                HStack(spacing:0){
                    Image("marker").resizable().frame(width: 30,height: 30).scaledToFit()
                    Text(organ.location)
                }
                HStack(spacing:0){
                    Image(systemName: "link").frame(width: 30, height: 30).scaledToFit()
                    Text(organ.blog)
                }
                
            }
        }
        
    }
}
