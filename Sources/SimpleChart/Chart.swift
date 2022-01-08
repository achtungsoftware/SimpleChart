//  Copyright © 2021 - present Julian Gerhards
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//  GitHub https://github.com/knoggl/SimpleChart
//

import SwiftUI
import SwiftPlus

struct Chart: View {
    
    enum ChartType {
        case bar(_ spacing: Double = 8, withSidebar: Bool = true)
    }
    
    var data: Array<ChartData>
    var type: ChartType
    var height: Double
    var color: Color
    var showValue: Bool
    var backgroundColor: Color
    var showBorderLines: Bool
    
    init(_ data: Array<ChartData>,
         type: ChartType = .bar(),
         height: Double = 250,
         color: Color = .green,
         showValue: Bool = true,
         backgroundColor: Color = .gray.opacity(0.14),
         showBorderLines: Bool = true
    ) {
        self.data = data
        self.type = type
        self.height = height
        self.color = color
        self.showValue = showValue
        self.backgroundColor = backgroundColor
        self.showBorderLines = showBorderLines
    }
    
    var body: some View {
        VStack {
            switch type {
            case .bar(let spacing, let withSidebar):
                barChart(spacing, withSidebar: withSidebar)
            }
        }
        .frame(height: height)
    }
    
    func barChart(_ spacing: Double, withSidebar: Bool) -> some View {
        VStack(spacing: 0) {
            if showBorderLines {
                Divider()
            }
            
            HStack {
                if withSidebar {
                    VStack {
                        Text(data.max.stringRepresentation)
                        Spacer()
                        Text(Double(data.max / 2).stringRepresentation)
                        Spacer()
                        Text("0")
                    }
                    .padding(4)
                    
                    Divider()
                }
                
                HStack(spacing: spacing) {
                    ForEach(data, id: \.id) { _data in
                        BarChart(_data, allData: data, chartHeight: height, color: color, showValue: showValue, backgroundColor: backgroundColor)
                    }
                }
            }
            
            if showBorderLines {
                Divider()
            }
        }
        .font(.caption2)
    }
}
