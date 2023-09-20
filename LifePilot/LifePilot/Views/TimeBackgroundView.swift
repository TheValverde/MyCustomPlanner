//
//  TimeBackgroundView.swift
//  LifePilot
//
//  Created by Hugo Valverde on 9/20/23.
//

import SwiftUI

struct TimeBackgroundView: View {
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<96) { i in  // 24 hours * 4 quarters = 96
                Rectangle()
                    .fill(i % 4 == 0 ? Color.gray.opacity(0.2) : Color.gray.opacity(0.1))
                    .frame(height: 15)
            }
        }
    }
}

struct TimeBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        TimeBackgroundView()
    }
}
