# SimpleChart

SimpleChart currently only supports bar charts.

# Swift Package Manager
Get this package with the Swift Package Manager
```swift
.package(url: "https://github.com/knoggl/SimpleChart.git", .upToNextMinor(from: "1.0.0")),
```

# Example
```swift
struct ContentView: View {
    
    private var data: [ChartData] = [
        ChartData(label: "Mon", value: 300.34),
        ChartData(label: "Tue", value: 93),
        ChartData(label: "Wed", value: 634),
        ChartData(label: "Thu", value: -82.1),
        ChartData(label: "Fri", value: 380),
        ChartData(label: "Sat", value: 222),
        ChartData(label: "Sun", value: 132)
    ]
    
    private var data2: [ChartData] = [
        ChartData(label: "Fri", value: 1700),
        ChartData(label: "Sat", value: 3213),
        ChartData(label: "Sun", value: 2122)
    ]
    
    private var data3: [ChartData] = [
        ChartData(label: "", value: 170),
        ChartData(label: "", value: 432),
        ChartData(label: "", value: 655),
        ChartData(label: "", value: 145),
        ChartData(label: "", value: 864),
        ChartData(label: "", value: 343),
        ChartData(label: "", value: 234),
        ChartData(label: "", value: 543),
        ChartData(label: "", value: 572)
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Chart(data)
                
                Chart(data3, type: .bar(1, withSidebar: false), height: 80, color: .secondary, showValue: false, showBorderLines: false)
                
                Chart(data, type: .bar(withSidebar: true), height: 200, color: .cyan)
                
                Chart(data2, type: .bar(1, withSidebar: false), height: 100, color: .yellow, showBorderLines: false)
            }
            .padding()
        }
    }
}
```
<img src="https://user-images.githubusercontent.com/96697201/148650462-0418944b-3a98-4beb-be49-837187347147.png" width="480" >
