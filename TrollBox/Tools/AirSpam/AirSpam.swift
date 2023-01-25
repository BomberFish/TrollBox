import SwiftUI
import Photos

struct AirSpam: View {
    // For opening donation page
    @Environment(\.openURL) var openURL
    
    // Which people are selected
    @State var selectedPeople: [TDKSFNode: Bool] = [:]
    
    // Troll Controller, manages airdrop stuff
    @StateObject var trollController = TrollController(sharedURL: Bundle.main.url(forResource: "Trollface", withExtension: "png")!, rechargeDuration: 0.5)
    @State var rechargeDuration: Double = 0.5
    @State var showingImagePicker: Bool = false
    
    @State var totalAirDrops: Int = 0
    
    /// Custom selected image
    @State var imageURL: URL?
    
    private var gridItemLayout = [GridItem(.adaptive(minimum: 75, maximum: 100))]
    
    var body: some View {
        NavigationView {
            Group {
                VStack {
                    if trollController.people.count == 0 { // No users in radius
                        ProgressView()
                        Text("Searching for devices...")
                            .foregroundColor(.secondary)
                            .padding()
                    }
                    else {
                        LazyVGrid(columns: gridItemLayout, spacing: 8) {
                            ForEach(trollController.people.sorted(by: { a, b in a.displayName ?? "" < b.displayName ?? "" }), id: \.node) { p in
                                PersonView(person: p, selected: $selectedPeople[p.node])
                                    .environmentObject(trollController)
                            }
                        }
                        .padding()
                        VStack {
                            if trollController.isRunning { Text("Sent AirDrops: \(totalAirDrops)") }
                            HStack { // delay control between airdrops
                                Image(systemName: "timer")
                                Slider(value: $rechargeDuration, in: 0...3.5)
                                Text(String(format: "%.1fs", rechargeDuration))
                            }
                            
                            Button(action: {
                                toggleTrollButtonTapped()
                            }) {
                                Text(!trollController.isRunning ? "Start trolling" : "Stop trolling")
                                    .padding(16)
                                    .frame(maxWidth: .infinity)
                                    .background(Color.accentColor)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                        .padding()
                    }
                }
                }
            .navigationTitle("AirSpammer")
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .onAppear {
                // Start searching nodes
                trollController.startBrowser()
            }
            .onChange(of: rechargeDuration) { newValue in
                trollController.rechargeDuration = newValue
            }
            
        }
    // shows a privacy req dialog if needed
    func showPicker() {
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
            DispatchQueue.main.async {
                // show picker if authorized
                showingImagePicker = status == .authorized
            }
        }
    }
    
    func toggleTrollButtonTapped() {
        UIImpactFeedbackGenerator(style: .medium).impactOccurred() // mmm
        
        guard selectedPeople.values.filter({ $0 == true }).count > 0 else {
            UIApplication.shared.alert(title: "No people selected", body: "Select users by tapping on them.")
            return
        }
        
        if !trollController.isRunning {
            UIApplication.shared.confirmAlert(title: "\(UIDevice.current.name)", body: "This is the current name of this device and the name people will see when receiving an AirDrop. Are you sure you want to continue?", onOK: {
                trollController.startTrolling(shouldTrollHandler: { person in
                    return selectedPeople[person.node] ?? false // troll only selected people
                }, eventHandler: { event in
                    switch event {
                    case .operationEvent(let event1):
                        if event1 == .canceled || event1 == .finished || event1 == .blocked {
                            totalAirDrops += 1
                            UISelectionFeedbackGenerator().selectionChanged()
                        }
                    case .cancelled:
                        totalAirDrops += 1
                        UISelectionFeedbackGenerator().selectionChanged()
                    }
                }) // start trolling :troll:
                trollController.isRunning.toggle()
            }, noCancel: false)
        } else {
            trollController.stopTrollings()
            trollController.isRunning.toggle()
        }
    }
    
    struct PersonView: View {
        @State var person: TrollController.Person
        @Binding var selected: Bool?
        @EnvironmentObject var trollController: TrollController
        
        var body: some View {
            Button(action: {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                if selected == nil { selected = false }
                selected?.toggle()
                remLog("selected", selected!)
            }) {
                VStack {
                    ZStack {
                        Image((selected ?? false) ? "TrolledPerson" : "NonTrolledPerson")
                    }
                    Text(person.displayName ?? "Unknown")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.5)
                        .foregroundColor(.init(uiColor14: .label))
                }
            }
            .disabled(trollController.isRunning)
        }
    }
}
struct AirSpam_Previews: PreviewProvider {
        static var previews: some View {
            AirSpam()
        }
    }
