import SwiftUI

struct InsightsView: View {
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
                        Text("Insights")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundStyle(
                                Color(red: 0.03, green: 0.18, blue: 0.38)
                            )

                        Text("What your environment is telling you")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }

                    // Overall
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Overall")
                            .font(.headline)

                        HStack(spacing: 10) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.title2)
                                .foregroundStyle(.green)

                            Text("Good")
                                .font(.title3)
                                .fontWeight(.semibold)
                        }

                        Text(
                            "Your current environment is generally comfortable."
                        )
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
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

                    // Humidity
                    insightCard(
                        icon: "drop.fill",
                        title: "Humidity",
                        value: "72%",
                        message: "Humidity is slightly high today.",
                        recommendation:
                            "Consider improving ventilation if the room feels stuffy."
                    )

                    // Temperature
                    insightCard(
                        icon: "thermometer.medium",
                        title: "Temperature",
                        value: "29°C",
                        message: "The environment feels warm.",
                        recommendation:
                            "Stay hydrated and avoid prolonged direct sunlight."
                    )

                    // Air Quality
                    insightCard(
                        icon: "wind",
                        title: "Air Quality",
                        value: "Moderate",
                        message: "Air quality is acceptable.",
                        recommendation:
                            "Outdoor activities are generally fine."
                    )
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 30)
            }
        }
    }

    // MARK: Insight Card

    func insightCard(
        icon: String,
        title: String,
        value: String,
        message: String,
        recommendation: String
    ) -> some View {

        VStack(alignment: .leading, spacing: 12) {

            HStack {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundStyle(
                        Color(red: 0.20, green: 0.50, blue: 0.78)
                    )

                Text(title)
                    .font(.headline)

                Spacer()

                Text(value)
                    .fontWeight(.bold)
            }

            Text(message)
                .font(.subheadline)

            Text("Recommendation")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(.blue)

            Text(recommendation)
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
    InsightsView()
}
