import SwiftUI

struct DetailsView: View {
    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                colors: [
                    Color(red: 0.48, green: 0.70, blue: 0.88),
                    Color(red: 0.88, green: 0.94, blue: 0.98)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            // Cloud background
            Image("cloudBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {

                    // Header
                    HStack {
                        Image(systemName: "chevron.left")
                            .font(.headline)

                        Text("Environmental Details")
                            .font(.title2)
                            .fontWeight(.bold)

                        Spacer()
                    }
                    .foregroundStyle(
                        Color(red: 0.03, green: 0.18, blue: 0.38)
                    )

                    // Temperature
                    detailCard(
                        icon: "thermometer.medium",
                        title: "Temperature",
                        value: "29°C",
                        status: "Warm",
                        description:
                            "The temperature is warm today. Stay hydrated and avoid prolonged exposure to direct sunlight."
                    )

                    // Humidity
                    detailCard(
                        icon: "drop.fill",
                        title: "Humidity",
                        value: "72%",
                        status: "Slightly High",
                        description:
                            "Humidity is slightly high. You may feel warmer than the actual temperature."
                    )

                    // Air Quality
                    detailCard(
                        icon: "wind",
                        title: "Air Quality",
                        value: "Moderate",
                        status: "Acceptable",
                        description:
                            "Air quality is acceptable, but sensitive individuals may want to reduce prolonged outdoor activity."
                    )
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
            }
        }
        .navigationBarBackButtonHidden(false)
    }

    // MARK: Detail Card

    func detailCard(
        icon: String,
        title: String,
        value: String,
        status: String,
        description: String
    ) -> some View {

        VStack(alignment: .leading, spacing: 14) {

            HStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundStyle(
                        Color(red: 0.20, green: 0.50, blue: 0.78)
                    )

                Text(title)
                    .font(.headline)

                Spacer()
            }

            HStack(alignment: .firstTextBaseline, spacing: 10) {
                Text(value)
                    .font(.system(size: 30, weight: .bold))

                Text(status)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Text(description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .lineSpacing(3)
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
    DetailsView()
}
