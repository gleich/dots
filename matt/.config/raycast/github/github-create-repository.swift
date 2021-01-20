import Foundation
import Combine
import SwiftUI

NSApplication.shared.start { () -> CreateGitHubRepoApp in
  guard CommandLine.arguments.count > 2 else {
    print("Create GitHub Repo - Script Command")
    print("You must inform accessToken and the name for the repository")
    print("Example: ./github-create-repository.swift <Access Token> <Repository Name>")
    exit(1)
  }

  let accessToken = CommandLine.arguments[1].trimmedText
  let repository = CommandLine.arguments[2].trimmedText

  return CreateGitHubRepoApp(
    token: accessToken,
    repository: repository
  )
}

extension NSApplication {
  public func start<V: View>(@ViewBuilder view: () -> V) {
    let appDelegate = AppDelegate(view())
    
    NSApp.setActivationPolicy(.regular)
    mainMenu = customMenu
    delegate = appDelegate
    
    run()
  }
}

// Inspired by https://www.cocoawithlove.com/2010/09/minimalist-cocoa-programming.html

extension NSApplication {
  var customMenu: NSMenu {
    let appMenu = NSMenuItem()
    appMenu.submenu = NSMenu()
    
    let appName = "Create GitHub Repository"
    appMenu.submenu?.addItem(
      NSMenuItem(
        title: "Quit \(appName)", 
        action: #selector(NSApplication.terminate(_:)), 
        keyEquivalent: "q"
      )
    )
    
    let mainMenu = NSMenu(title: "Main Menu")
    mainMenu.addItem(appMenu)
    
    return mainMenu
  }
}

final class AppDelegate<V: View>: NSObject, NSApplicationDelegate, NSWindowDelegate {
  var window: NSWindow
  var hostingView: NSView
  var contentView: V
  
  init(_ contentView: V) {
    self.contentView = contentView
    
    self.hostingView = NSHostingView(
      rootView: contentView
    )
    
    self.window = NSWindow(
      contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
      styleMask: [.titled, .fullSizeContentView],
      backing: .buffered, 
      defer: false
    )
  }
  
  func applicationDidFinishLaunching(_ notification: Notification) {
    window.center()
    window.setFrameAutosaveName("Main Window")
    window.titlebarAppearsTransparent = true

    window.contentView = hostingView
    window.makeKeyAndOrderFront(nil)
    window.delegate = self
    window.title = "Create GitHub Repo"
    
    NSApp.activate(
        ignoringOtherApps: true
    )
  }
}

struct CreateGitHubRepoApp: View {
  var token: String
  var repository: String
  
  var body: some View {
    contentView
      .frame(
        width: 480,
        height: 300
      )
  }
  
  @ViewBuilder
  var contentView: some View {
    if token.isEmpty {
      WarningView()
    }
    else {
      CreateGitHubRepoView(
        viewModel: CreateGitHubRepoViewModel(
          accessToken: token,
          repositoryName: repository
        )
      )
    }
  }
}

struct WarningView: View {
  var body: some View {
    VStack {
      Text("⚠️ Warning")
        .font(.largeTitle)
      
      Group {
        Text("You need to set a")
          .fontWeight(.medium)
        
          + Text(" GitHub Access\nToken ")
          .fontWeight(.bold)
        
          + Text("to use this Script Command.")
          .fontWeight(.medium)
      }
      .font(.title3)
      .multilineTextAlignment(.center)
      .padding(.vertical, 20)
      
      VStack(alignment: .leading) {
        Text("Pro Tip:")
          .padding(.bottom, 1)
          .font(.headline)
        
        Text("Open the .sh of this Script Command in any editor and set your GitHub Access Token to the variable \'access_token\' at the top of the file.")
          .font(.body)
      }
      .padding(.top, 20)
    }
    .frame(
      width: 300,
      height: 300,
      alignment: .top
    )
    .padding(.top, 40)
  }
}

struct DoneView: View {
  @Binding
  var isPresented: Bool
  
  @Binding
  var repositoryName: String
  
  var repository: Repository
  
  var body: some View {
    VStack {
      informationView
      buttonsView
      
      Spacer()
      
      closeView
    }
    .frame(alignment: .top)
    .padding(.all, 20)
  }
  
  private var informationView: some View {
    VStack {
      Text("🎉 Congratulations")
        .font(.largeTitle)
      
      Text("Your new repository was created.")
        .font(.title2)
        .fontWeight(.medium)
        .multilineTextAlignment(.center)
        .padding(.vertical, 20)
      
      Text(repository.url)
    }
  }
  
  private var buttonsView: some View {
    HStack(spacing: 10) {
      Button(action: {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.writeObjects([repository.url as NSPasteboardWriting])
        print("Copied Repository HTTP URL: \(repository.url)")
      }) {
        Text("Copy HTTP URL")
      }
      
      Button(action: {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.writeObjects([repository.sshUrl as NSPasteboardWriting])
        print("Copied Repository SSH URL: \(repository.sshUrl)")
      }) {
        Text("Copy SSH URL")
      }
      
      if let url = URL(string: repository.url) {
        Button(action: { NSWorkspace.shared.open(url) }) {
          Text("Open Repository")
        }
      }
    }
    .padding(.top, 20)
  }
  
  private var closeView: some View {
    HStack {
      Button(action: {
        self.repositoryName = ""
        
        withAnimation {
          self.isPresented.toggle()
        }
      }) {
        Text("Create another")
          .padding(.horizontal, 10)
      }
      
      Spacer()
      
      Button(action: { exit(0)}) {
        Text("Quit")
          .padding(.horizontal, 10)
      }
      .keyboardShortcut(.defaultAction)
    }
    .padding(.top, 10)
  }
}

final class RequestManager {
  private let accessTokenData: Data
  private let apiURL: URL
  
  private var authorizationValue: String {
    "Basic " + accessTokenData.base64EncodedString(
      options: Data.Base64EncodingOptions(rawValue: 0)
    )
  }
  
  init(accessToken: String) {
    guard accessToken.isEmpty == false, let tokenData = accessToken.data(using: .utf8) else {
      fatalError("Access Token was not defined")
    }
    
    guard let apiURL = URL(string: "https://api.github.com/graphql") else {
      fatalError("URL cannot be created")
    }
    
    self.apiURL          = apiURL
    self.accessTokenData = tokenData
  }
  
  func createRequest(for query: String, variables: [String: Any]? = nil) -> URLRequest? {
    var request = URLRequest(url: apiURL)
    request.httpMethod = "POST"
    request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
    request.addValue(authorizationValue,                forHTTPHeaderField: "Authorization")
    
    var bodyDictionary: [String: Any] = [:]
    bodyDictionary["query"] = query
    
    if let variables = variables {
      bodyDictionary["variables"] = variables
    }
    
    if let bodyData = try? JSONSerialization.data(withJSONObject: bodyDictionary, options: []) {
      request.httpBody = bodyData
    }
    
    return request
  }
}

// MARK: -

extension Binding {
  init<Object>(_ object: Object, keyPath: ReferenceWritableKeyPath<Object, Value>) {
    self.init(get: { object[keyPath: keyPath] }) { newValue in
      object[keyPath: keyPath] = newValue
    }
  }
}

extension String {
  var sanitized: String {
    var value = self
    
    value = value.replacingOccurrences(of: " ", with: "-")
    value = value.replacingOccurrences(of: ".", with: "-")
    value = value.replacingOccurrences(of: ",", with: "-")
    value = value.replacingOccurrences(of: "+", with: "-")
    value = value.replacingOccurrences(of: "|", with: "-")
    value = value.replacingOccurrences(of: "/", with: "-")
    value = value.replacingOccurrences(of: "\\", with: "-")
    value = value.replacingOccurrences(of: "@", with: "-")
    value = value.replacingOccurrences(of: "%", with: "-")
    value = value.replacingOccurrences(of: "#", with: "-")
    
    return value.trimmedText
  }
  
  var trimmedText: String {
    trimmingCharacters(in: .whitespacesAndNewlines)
  }
}

extension NSImage {
  static func convertImage(from base64: String) -> NSImage {
    guard let base64Data = Data(base64Encoded: base64, options: .init(rawValue: 0)) else {
      return NSImage()
    }
    
    guard let image = NSImage(data: base64Data) else {
      return NSImage()
    }
    
    image.isTemplate = true
    
    return image
  }
  
  // Inspirated by https://gist.github.com/usagimaru/c0a03ef86b5829fb9976b650ec2f1bf4
  func tintColor(_ color: Color) -> NSImage {
    let color = NSColor(color)
    
    guard isTemplate == true else {
      return self
    }
    
    let image = copy() as! NSImage
    image.lockFocus()
    
    color.set()
    
    let rect = NSRect(origin: .zero, size: image.size)
    rect.fill(using: .sourceAtop)
    
    image.unlockFocus()
    image.isTemplate = false
    
    return image
  }
}

extension Color {
  static var darkGreen = Color(
    red: 105/255,
    green: 162/255,
    blue: 59/255
  )
}

// MARK: -

protocol NodesProtocol {
  associatedtype T
  
  var nodes: [T] { get set}
}

protocol DataProtocol {
  associatedtype T
  
  var data: T { get set}
}

// MARK: -

enum Visibility: String, CaseIterable, Identifiable, CustomStringConvertible, Comparable {
  static func < (lhs: Visibility, rhs: Visibility) -> Bool {
    lhs.rawValue > rhs.rawValue
  }
  
  case `private`
  case `public`
  
  var id: String {
    rawValue
  }
  
  var description: String {
    switch self {
    case .private:
      return "You can choose who can see and commit to this repository."
    case .public:
      return "Anyone can see this repository. You choose who can commit."
    }
  }
}

struct Organization: Codable, Identifiable {
  let id: String
  let login: String
  let name: String
}

extension Organization: Hashable {
  static var empty: Self = .init(id: "", login: "", name: "")
}

struct Organizations: Codable, NodesProtocol {
  var nodes: [Organization]
}

struct Viewer: Codable, Identifiable {
  let id: String
  let login: String
  let name: String
  let organizations: Organizations
}

struct DataViewer: Codable {
  let viewer: Viewer
}

struct MainOrganizationData: Codable, DataProtocol {
  var data: DataViewer
}

struct Repository: Codable, Identifiable {
  let id: String
  let name: String
  let url: String
  let sshUrl: String
}

struct GraphQLError: Codable {
  let type: String
  let path: [String]
  let message: String
}

struct DataCreateRepository: Codable {
  let createRepository: DataRepository?
}

struct MainCreateRepositoryData: Codable, DataProtocol {
  var data: DataCreateRepository
  var errors: [GraphQLError]?
}

struct DataRepository: Codable {
  let repository: Repository?
}

struct MainRepositoryData: Codable, DataProtocol {
  var data: DataRepository
}

// MARK: - Protocols

protocol ViewStateProtocol {
  static var idle: Self { get }
  static func error(_ message: String) -> Self
  static func loading(_ message: String) -> Self
}

// MARK: - ViewState Protocols
protocol ViewStateObjectProtocol: ViewStateProtocol {
  static var object: Self { get }
}

// MARK: - ViewState Object
enum ViewStateObject: Equatable {
  case idle
  case error(String)
  case loading(String)
  case object
}

extension ViewStateObject: ViewStateObjectProtocol {}

extension ViewStateObject: CustomStringConvertible {
  var description: String {
    switch self {
    case .error(let description):
      return description.isEmpty ? "Something went wrong" : description
    case .loading(let description):
      return description
    default:
      return ""
    }
  }
}

// MARK: - Array

extension Array where Element == Organization {
  func find(by identifier: String) -> Organization? {
    guard let organization = self.first(where: { $0.id == identifier }) else {
      return nil
    }
    
    return organization
  }
}

// MARK: - View Model

final class CreateGitHubRepoViewModel: ObservableObject {
  
  // MARK: - Stored properties
  
  private let requestManager: RequestManager
  private var cancellable: AnyCancellable?
  
  private var viewer: Viewer? {
    didSet {
      var organizations = viewer?.organizations.nodes ?? []
      
      if let viewer = viewer {
        let personal = Organization(
          id: viewer.id,
          login: viewer.login,
          name: "\(viewer.name) (\(viewer.login))"
        )
        
        organizations.insert(personal, at: 0)
        
        selectedOwner = personal
      }
      
      self.organizations = organizations
    }
  }
  
  private(set) var organizations: [Organization] {
    didSet {
      if isLoading == false {
        checkRepoAvailability()
      }
    }
  }
  
  private(set) var repositoryCreated: Repository?
  private(set) var repositoryCreationError: GraphQLError?
  
  var checkmarkImage: NSImage {
    let image = NSImage.convertImage(from: "iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAHRQAAB0UB+BYeMAAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAADhSURBVEiJ1ZUtjgJBEEbfR4CgOAtuAgdYiSZh1aoRKBI8l+AGyF1+LBqLWMkpNoCnENCkgZnZwHQLKinVX71nqtIyM2JWJSr97QSSEklTSRtJqaQGZhakgS/gCJjXw5hwA7Yx4QasYsIN6MaEj80MF24BE2AANEPB3RH37h7/gCQE3AnWGaEd0C4Ld4LfnPAe6JSBO0FaMHQAPoHRK3AnqAPLguH/Ohfub1ENWISGXwWeZB4SfiPwJLNQ8AeBJ/kJAc8UXCRV4LssPFfgSfqcD3EJfDwLNzPkdjVWvdefnFUnXRonMslO1PMAAAAASUVORK5CYII=")
    
    return image.tintColor(.darkGreen)
  }
  
  var errorImage: NSImage {
    let image = NSImage.convertImage(from: "iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAH9QAAB/UBBhmj/QAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAACkSURBVEiJxZbJDYAwDARHvKgvfVALFdFG2jEfvziC18iAFAkp9iw4mzgAM7AAHdiAZmZkBtCc0Z054y92GGsCvl5wFlztOCGJ3MDN2Ww3kyGRAdycTRsEDEUe4Aa0aOBJJJojJ8ix6lepf5upq1bK5OKFzZC1X9xpLzwe2isT1c8vJRLh2iIn4TGbBuD5jaYkSrHlhx3VxzUfNJzyllne9EuvLTv0XJ+Y585mjQAAAABJRU5ErkJggg==")
    
    return image.tintColor(.red)
  }
  
  @Published
  private(set) var viewState: ViewStateObject = .idle
  
  @Published
  var presentDoneViewModal = false
  
  @Published
  var presentErrorAlert = false
  
  @Published
  var isRepoNameAvailable: Bool = false
  
  @Published
  var selectedOwner = Organization.empty {
    didSet {
      self.checkRepoAvailability()
    }
  }
  
  @Published
  var selectedRepositoryName: String = ""
  
  @Published
  var selectedDescription: String = ""
  
  @Published
  var selectedVisibility: Visibility = .`public`
  
  // MARK: - Computed properties
  
  var repositoryFullURL: String {
    guard selectedOwner.id.isEmpty == false else {
      return ""
    }
    
    return "https://github.com/\(selectedOwner.login)/\(selectedRepositoryName.sanitized)"
  }
  
  var isOrganizationEmpty: Bool {
    organizations.isEmpty
  }
  
  var isLoading: Bool {
    guard case .loading = viewState else {
      return false
    }
    
    return true
  }
  
  var loadingDescription: String {
    switch viewState {
    case .loading(let description):
      return description
    default:
      return ""
    }
  }
  
  var errorDescription: String {
    viewState.description
  }
  
  var isFormValid: Bool {
    if isOrganizationEmpty {
      return false
    }
    
    if selectedRepositoryName.isEmpty {
      isRepoNameAvailable = false
      viewState = .error("Repository name cannot be empty")
      return false
    }
    
    viewState = .object
    return true
  }
  
  // MARK: - Init
  
  init(accessToken: String, repositoryName: String) {
    self.requestManager         = RequestManager(accessToken: accessToken)
    self.selectedRepositoryName = repositoryName
    self.organizations          = []
  }
  
  // MARK: - Network methods
  
  func fetchOrganizations() {
    let query = "query SearchOrganizations($numberOfItems:Int!){viewer{id login name organizations(first:$numberOfItems){nodes{id login name}}}}"
    let variables = ["numberOfItems": 50]
    
    guard let request = requestManager.createRequest(for: query, variables: variables) else {
      return
    }
    
    viewState = .loading("Loading account owners...")
    
    cancellable = URLSession.shared.dataTaskPublisher(for: request)
      .map { $0.data }
      .decode(type: MainOrganizationData.self, decoder: JSONDecoder())
      .map { $0.data.viewer }
      .receive(on: RunLoop.main)
      .catch { error -> AnyPublisher<Viewer, Never> in
        print(error)
        self.viewState = .error("")
        
        return Empty<Viewer, Never>(completeImmediately: true)
          .eraseToAnyPublisher()
      }
      .sink { value in
        self.viewState = .object
        self.viewer = value
      }
  }
  
  func checkRepoAvailability() {
    guard isLoading == false else {
      return
    }
    
    guard isFormValid else {
      return
    }
    
    let query = "query CheckRepositoryAvailability($user:String!,$repository:String!){repository(name:$repository, owner:$user){id name url sshUrl}}"
    let variables = [
      "repository": selectedRepositoryName,
      "user"      : selectedOwner.login
    ]
    
    guard let request = requestManager.createRequest(for: query, variables: variables) else {
      return
    }
    
    self.viewState = .loading("Checking repository availability...")
    
    cancellable = URLSession.shared.dataTaskPublisher(for: request)
      .map { $0.data }
      .decode(type: MainRepositoryData.self, decoder: JSONDecoder())
      .map { $0.data }
      .receive(on: RunLoop.main)
      .catch { error -> AnyPublisher<DataRepository, Never> in
        print(error)
        self.viewState = .error("")
        
        return Empty<DataRepository, Never>(completeImmediately: true)
          .eraseToAnyPublisher()
      }
      .sink { value in
        if value.repository != nil {
          self.isRepoNameAvailable = false
          self.viewState = .error("Repository name not available")
        }
        else {
          self.isRepoNameAvailable = true
          self.viewState = .object
        }
      }
  }
  
  func createRepository() {
    let query = "mutation CreateRepository($repository:String! $owner:String! $description:String! $visibility:RepositoryVisibility!){createRepository(input:{name:$repository ownerId:$owner description:$description visibility:$visibility}){repository{id name url sshUrl}}}"
    let variables = [
      "repository" : selectedRepositoryName.sanitized,
      "owner"      : selectedOwner.id,
      "description": selectedDescription,
      "visibility" : selectedVisibility.rawValue.uppercased()
    ]
    
    guard let request = requestManager.createRequest(for: query, variables: variables) else {
      return
    }
    
    viewState = .loading("Creating repository...")
    
    cancellable = URLSession.shared.dataTaskPublisher(for: request)
      .map { $0.data }
      .decode(type: MainCreateRepositoryData.self, decoder: JSONDecoder())
      .map { $0 }
      .receive(on: RunLoop.main)
      .catch { error -> AnyPublisher<MainCreateRepositoryData, Never> in
        print(error)
        self.viewState = .error("")
        
        return Empty<MainCreateRepositoryData, Never>(completeImmediately: true)
          .eraseToAnyPublisher()
      }
      .sink { main in
        if let create = main.data.createRepository, let repository = create.repository {
          self.viewState            = .object
          self.repositoryCreated    = repository
          self.presentDoneViewModal = true
        }
        else if let errors = main.errors, let error = errors.first {
          self.repositoryCreationError = error
          self.viewState               = .object
          self.presentErrorAlert       = true
        }
      }
  }
}

// MARK: - View

struct CreateGitHubRepoView: View {
  @ObservedObject
  private var viewModel: CreateGitHubRepoViewModel
  
  init(viewModel: CreateGitHubRepoViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    let presentAlert = Binding<Bool>(self.viewModel, keyPath: \.presentErrorAlert)
    let presentModal = Binding<Bool>(self.viewModel, keyPath: \.presentDoneViewModal)
    let selectedRepositoryName = Binding<String>(self.viewModel, keyPath: \.selectedRepositoryName)
    
    return contentView
      .padding()
      .onAppear {
        if viewModel.viewState == .idle {
          viewModel.fetchOrganizations()
        }
      }
      .sheet(isPresented: presentModal) {
        if let repository = self.viewModel.repositoryCreated {
          DoneView(
            isPresented: presentModal,
            repositoryName: selectedRepositoryName,
            repository: repository
          )
        }
      }
      .alert(isPresented: presentAlert) {
        Alert(
          title: Text("😩 Oh no!"),
          message: Text(self.viewModel.repositoryCreationError?.message ?? "Something went wrong"),
          dismissButton: .default(Text("Got it"))
        )
      }
  }
}

private extension CreateGitHubRepoView {
  
  var contentView: some View {
    VStack(alignment: .leading) {
      formView
      
      Spacer()
      
      HStack {
        if case .loading = viewModel.viewState {
          loadingView
            .padding(.leading, 5)
        }
        else if case .error = viewModel.viewState {
          errorView
            .padding(.leading, 8)
        }
        
        Spacer()
        actionButtonsView
      }
    }
  }
  
  var loadingView: some View {
    HStack {
      ProgressView()
        .frame(width: 16, height: 16)
        .scaleEffect(x: 0.5, y: 0.5)
      
      Text(viewModel.loadingDescription)
        .padding(.leading, 5)
    }
  }
  
  var errorView: some View {
    HStack {
      Image(nsImage: viewModel.errorImage)
        .resizable()
        .frame(width: 12, height: 12)
      
      Text(viewModel.errorDescription)
    }
  }
  
  var formView: some View {
    VStack(alignment: .trailing, spacing: 10.0) {
      ownerView
      repositoryView
      descriptionView
      visibilityView
    }
    .frame(width: 460.0)
  }
  
  var ownerView: some View {
    HStack {
      Text("Owner:")
      
      Picker("", selection: Binding<Organization>(self.viewModel, keyPath: \.selectedOwner)) {
        ForEach(viewModel.organizations) { owner in
          Text(owner.name)
            .tag(owner)
        }
      }
      .labelsHidden()
      .disabled(viewModel.isOrganizationEmpty)
      .frame(
        width: 340,
        alignment: .leading
      )
    }
  }
  
  var repositoryView: some View {
    HStack(alignment: .top) {
      Text("Repository Name:")
        .padding(.top, 3)
      
      VStack(alignment: .leading, spacing: 1) {
        ZStack {
          TextField("", text: $viewModel.selectedRepositoryName) { isEditing in
            if isEditing == false {
              viewModel.checkRepoAvailability()
            }
          }
          onCommit: {
            if viewModel.isFormValid {
              viewModel.checkRepoAvailability()
            }
          }
          .disableAutocorrection(true)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          
          if viewModel.isRepoNameAvailable {
            HStack {
              Spacer()
              Image(nsImage: viewModel.checkmarkImage)
                .resizable()
                .frame(width: 16, height: 16)
                .padding(.trailing, 6)
            }
          }
        }
        .frame(width: 340.0)
        
        Text(viewModel.repositoryFullURL)
          .font(.subheadline)
          .foregroundColor(.gray)
          .padding(.leading, 3)
          .frame(
            width: 340,
            alignment: .leading
          )
      }
    }
  }
  
  var descriptionView: some View {
    HStack(alignment: .top) {
      Text("Description:")
      
      ZStack(alignment: .topLeading) {
        TextEditor(text: Binding<String>(self.viewModel, keyPath: \.selectedDescription))
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .font(.body)
          .frame(width: 340.0, height: 70)
          .clipShape(
            RoundedRectangle(
              cornerRadius: 6,
              style: RoundedCornerStyle.continuous
            )
          )
        
        if viewModel.selectedDescription.isEmpty {
          Text("Optional")
            .font(.body)
            .foregroundColor(.gray)
            .padding(.horizontal, 5)
            .opacity(0.6)
        }
      }
      .frame(width: 340, alignment: .leading)
    }
  }
  
  var visibilityView: some View {
    HStack(alignment: .top) {
      Text("Visibility:")
      
      Picker("", selection: Binding<Visibility>(self.viewModel, keyPath: \.selectedVisibility)) {
        ForEach(Visibility.allCases.sorted()) { visibility in
          option(for: visibility)
        }
      }
      .frame(width: 340.0)
      .labelsHidden()
      .pickerStyle(RadioGroupPickerStyle())
    }
  }
  
  func option(for visibility: Visibility) -> some View {
    VStack(alignment: .leading) {
      Text(visibility.rawValue.capitalized)
      Text(visibility.description)
        .font(.subheadline)
        .foregroundColor(Color.gray)
    }
    .tag(visibility)
  }
  
  var actionButtonsView: some View {
    HStack(spacing: 20) {
      Button(action: { exit(0) }) {
        Text("Quit")
          .padding(.horizontal, 10)
      }
      
      Button(action: {
        if viewModel.isFormValid {
          viewModel.createRepository()
        }
      }) {
        Text("Create")
          .padding(.horizontal, 10)
      }
      .keyboardShortcut(.defaultAction)
      .disabled(viewModel.isLoading)
    }
  }
}
