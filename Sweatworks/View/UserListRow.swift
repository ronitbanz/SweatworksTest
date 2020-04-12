//
//  UserListRow.swift
//  Sweatworks
//
//  Created by Ronit Banze on 2020-04-10.
//  Copyright © 2020 Ronit. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserListRow: View {
    let user: User?
    var body: some View {
        HStack {
            WebImage(url: URL(string: user?.imageUrl ?? "https://randomuser.me/api/portraits/women/94.jpg"))
                .frame(width: 55.0, height: 55.0, alignment: Alignment.center)
                .scaledToFit()
                .cornerRadius(10)
                .clipped()
            VStack(alignment: .leading) {
                Text("\(user?.lastName?.lowercased() ?? ""), \(user?.firstName?.lowercased() ?? "")")
                    .font(Font.custom("Roboto-Bold", size: 20))
                Text("\(user?.phoneNumber ?? "")")
                    .font(Font.custom("Roboto-Regular", size: 12))
            }
        }
    }
}
