import SwiftUI

struct ContentView: View {
    @State private var origin: String = ""
    @State private var destination: String = ""
    @State private var departureDate: Date = Date()
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        NavigationView {
            VStack {
                TextField("Origin", text: $origin)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                TextField("Destination", text: $destination)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                DatePicker("Departure Date", selection: $departureDate, displayedComponents: .date)
                    .padding()

                Button(action: addFlight) {
                    Text("Add Flight")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                NavigationLink(destination: FlightResultsView()) {
                    Text("View Flights")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()

                Spacer()
            }
            .navigationTitle("Flight Search")
        }
    }

    private func addFlight() {
        let newFlight = Flight(context: viewContext)
        newFlight.origin = origin
        newFlight.destination = destination
        newFlight.departureDate = departureDate
        newFlight.price = 200.0 // Placeholder price

        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
