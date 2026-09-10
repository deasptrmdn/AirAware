import SwiftUI
import Charts

struct HistoryView: View {
    let data = [
        (day: "Mon", temperature: 28.0, humidity: 68.0),
        (day: "Tue", temperature: 29.0, humidity: 70.0),
        (day: "Wed", temperature: 30.0, humidity: 75.0),
        (day: "Thu", temperature: 29.0, humidity: 72.0),
        (day: "Fri", temperature: 28.0, humidity: 69.0),
        (day: "Sat", temperature: 30.0, humidity: 74.0),
        (day: "Sun", temperature: 29.0, humidity: 72.0)
    ]

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(red: 0.48, green: 0.70, blue: 0.88),
                    Color(red: 0.88, green: 0.94, blue: 0.98)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            Image("cloudBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // Header
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Last 7 Days")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundStyle(
                                Color(red: 0.03, green: 0.18, blue: 0.38)
                            )

                        Text("Your environmental history")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }

                    // Temperature
                    chartCard(title: "Temperature") {
                        Chart {
                            ForEach(data, id: \.day) { item in
                                LineMark(
                                    x: .value("Day", item.day),
                                    y: .value("Temperature", item.temperature)
                                )
                                .interpolationMethod(.catmullRom)

                                PointMark(
                                    x: .value("Day", item.day),
                                    y: .value("Temperature", item.temperature)
                                )
                            }
                        }
                        .frame(height: 180)
                    }

                    // Humidity
                    chartCard(title: "Humidity") {
                        Chart {
                            ForEach(data, id: \.day) { item in
                                LineMark(
                                    x: .value("Day", item.day),
                                    y: .value("Humidity", item.humidity)
                                )
                                .interpolationMethod(.catmullRom)

                                PointMark(
                                    x: .value("Day", item.day),
                                    y: .value("Humidity", item.humidity)
                                )
                            }
                        }
                        .frame(height: 180)
                    }

                    // Air Quality
                    VStack(alignment: .leading, spacing: 14) {
                        Text("Air Quality Trend")
                            .font(.headline)

                        HStack(spacing: 12) {
                            Image(systemName: "wind")
                                .font(.title2)
                                .foregroundStyle(
                                    Color(
                                        red: 0.20,
                                        green: 0.50,
                                        blue: 0.78
                                    )
                                )

                            VStack(alignment: .leading, spacing: 3) {
                                Text("Moderate")
                                    .font(.title3)
                                    .fontWeight(.semibold)

                                Text("Generally acceptable")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }

                            Spacer()
                        }
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.white.opacity(0.90))
                    .clipShape(
                        RoundedRectangle(cornerRadius: 22)
                    )
                    .shadow(
                        color: .black.opacity(0.08),
                        radius: 12,
                        y: 6
                    )
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 30)
            }
        }
    }

    // MARK: Chart Card

    func chartCard<Content: View>(
        title: String,
        @ViewBuilder content: () -> Content
    ) -> some View {

        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)

            content()
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.white.opacity(0.90))
        .clipShape(
            RoundedRectangle(cornerRadius: 22)
        )
        .shadow(
            color: .black.opacity(0.08),
            radius: 12,
            y: 6
        )
    }
}

#Preview {
    HistoryView()
}
