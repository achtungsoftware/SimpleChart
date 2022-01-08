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

internal struct BarChart: View {
    
    var data: ChartData
    var allData: Array<ChartData>
    var chartHeight: Double
    var color: Color
    var showValue: Bool
    var backgroundColor: Color
    
    internal init(_ data: ChartData,
                  allData: Array<ChartData>,
                  chartHeight: Double,
                  color: Color,
                  showValue: Bool,
                  backgroundColor: Color
    ) {
        self.data = data
        self.allData = allData
        self.chartHeight = chartHeight
        self.color = color
        self.showValue = showValue
        self.backgroundColor = backgroundColor
    }
    
    internal var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .fill(data.overrideColor == .clear ? color : data.overrideColor)
                .frame(height: height)
            
            VStack {
                if showValue {
                    Text(data.value.stringRepresentation)
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
                
                Text(data.label)
                    .multilineTextAlignment(.center)
            }
            .padding(4)
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
        .background(backgroundColor)
        .cornerRadius(6)
    }
    
    private var height: Double {
        var allValues: [Double]    {
            var values = [Double]()
            for _data in allData {
                values.append(_data.value)
            }
            return values
        }
        
        guard let max = allValues.max() else {
            return chartHeight
        }
        
        if max != 0 {
            return (Double(data.value / Double(max)).minValue(0.005)) * chartHeight
        } else {
            return chartHeight
        }
    }
}
