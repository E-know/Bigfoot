//
//  NotifyWODSubView.swift
//  Bigfoot
//
//  Created by Inho Choi on 4/27/25.
//

import SwiftUI

extension NotifyWODView {
    @ViewBuilder
    var NavigationTop: some View {
        HStack {
            Text("와드 알리미")
                .font(.system(size: 25, weight: .black))
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}
