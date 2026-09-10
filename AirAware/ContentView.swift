import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
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

                VStack(spacing: 0) {

                    // MARK: Header
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Good morning, Deas")
                            .font(.subheadline)
                            .foregroundStyle(
                                Color(red: 0.05, green: 0.20, blue: 0.40)
                            )

                        Text("Your Environment")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundStyle(
                                Color(red: 0.03, green: 0.18, blue: 0.38)
                            )

                        Text("Today")
                            .font(.subheadline)
                            .foregroundStyle(
                                Color(red: 0.10, green: 0.25, blue: 0.42)
                            )
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)

                    Color.clear
                        .frame(height: 60)

                    // MARK: Environment Status
                    NavigationLink(destination: DetailsView()) {
                        VStack(alignment: .leading, spacing: 14) {

                            HStack {
                                Text("Environment Status")
                                    .font(.headline)

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .font(.caption)
                            }

                            HStack(spacing: 12) {
                                Circle()
                                    .fill(
                                        Color(
                                            red: 0.52,
                                            green: 0.70,
                                            blue: 0.86
                                        )
                                    )
                                    .frame(width: 38, height: 38)

                                Text("Good")
                                    .font(.system(size: 34, weight: .bold))
                            }

                            Text(
                                "Your environment is comfortable, with slightly high humidity."
                            )
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .fixedSize(
                                horizontal: false,
                                vertical: true
                            )

                            Divider()

                            HStack {
                                EnvironmentMetric(
                                    icon: "thermometer.medium",
                                    value: "29°C",
                                    title: "Temperature"
                                )

                                Divider()
                                    .frame(height: 60)

                                EnvironmentMetric(
                                    icon: "drop.fill",
                                    value: "72%",
                                    title: "Humidity"
                                )

                                Divider()
                                    .frame(height: 60)

                                EnvironmentMetric(
                                    icon: "wind",
                                    value: "Moderate",
                                    title: "Air Quality"
                                )
                            }
                        }
                        .padding(20)
                        .background(.white.opacity(0.88))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 22)
                        )
                        .shadow(
                            color: .black.opacity(0.08),
                            radius: 12,
                            y: 6
                        )
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal, 20)

                    // MARK: Quick Insight
                    HStack(spacing: 14) {

                        Image(systemName: "lightbulb")
                            .font(.system(size: 28))
                            .foregroundStyle(
                                Color(
                                    red: 0.15,
                                    green: 0.42,
                                    blue: 0.68
                                )
                            )

                        VStack(alignment: .leading, spacing: 6) {
                            Text("Quick Insight")
                                .font(.headline)

                            Text(
                                "Humidity is slightly high today. Consider improving ventilation if the room feels stuffy."
                            )
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        }

                        Spacer()

                        NavigationLink(destination: InsightsView()) {
                            Circle()
                                .fill(
                                    Color(
                                        red: 0.18,
                                        green: 0.43,
                                        blue: 0.68
                                    )
                                )
                                .frame(width: 36, height: 36)
                                .overlay {
                                    Image(systemName: "arrow.right")
                                        .foregroundStyle(.white)
                                }
                        }
                    }
                    .padding(16)
                    .background(
                        Color(
                            red: 0.72,
                            green: 0.83,
                            blue: 0.93
                        )
                        .opacity(0.85)
                    )
                    .clipShape(
                        RoundedRectangle(cornerRadius: 20)
                    )
                    .padding(.horizontal, 20)
                    .padding(.top, 16)
                    
                    Spacer()

                    // MARK: Bottom Navigation
                    HStack {

                        NavigationItem(
                            icon: "house.fill",
                            title: "Home",
                            selected: true
                        )

                        Spacer()

                        NavigationLink(destination: HistoryView()) {
                            NavigationItem(
                                icon: "clock",
                                title: "History",
                                selected: false
                            )
                        }
                        .buttonStyle(.plain)

                        Spacer()

                        NavigationLink(destination: InsightsView()) {
                            NavigationItem(
                                icon: "sparkles",
                                title: "Insights",
                                selected: false
                            )
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.horizontal, 35)
                    .padding(.top, 12)
                    .padding(.bottom, 10)
                    .background(.white.opacity(0.92))
                }
            }
        }
    }
}

// MARK: - Metric Component

struct EnvironmentMetric: View {
    let icon: String
    let value: String
    let title: String

    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 25))
                .foregroundStyle(
                    Color(
                        red: 0.20,
                        green: 0.50,
                        blue: 0.78
                    )
                )

            Text(value)
                .font(.system(size: 17, weight: .bold))

            Text(title)
                .font(.caption2)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Navigation Component

struct NavigationItem: View {
    let icon: String
    let title: String
    let selected: Bool

    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 20))

            Text(title)
                .font(.caption2)
        }
        .foregroundStyle(
            selected
            ? Color(
                red: 0.10,
                green: 0.40,
                blue: 0.75
            )
            : Color.gray
        )
    }
}

#Preview {
    ContentView()
}
