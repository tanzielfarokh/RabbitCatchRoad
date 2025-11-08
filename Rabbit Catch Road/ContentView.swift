//
//
//
//import SwiftUI
//
//
//struct SplashView: View {
//    @State private var isActive = false
//    @State private var scale = 0.7
//    @State private var opacity = 0.0
//    
//    var body: some View {
//        if isActive {
//            MainMenuView()
//        } else {
//            ZStack {
//                Image("background")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(
//                        width: UIScreen.main.bounds.width,
//                        height: UIScreen.main.bounds.height
//                    )
//                    .ignoresSafeArea()
//            }
//            .onAppear {
//                withAnimation(.easeIn(duration: 1.2)) {
//                    scale = 1.0
//                    opacity = 1.0
//                }
//                
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//                    withAnimation {
//                        isActive = true
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct MainMenuView: View {
//    @State private var showGame = false
//    @State private var showAbout = false
//    @State private var buttonScale: [Double] = [1.0, 1.0, 1.0, 1.0]
//    @State private var playButtonScale: CGFloat = 1.0
//    @State private var aboutButtonScale: CGFloat = 1.0
//    @State private var showHowToPlay = false
//    
//    var body: some View {
//        ZStack {
//            Image("background")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(
//                    width: UIScreen.main.bounds.width,
//                    height: UIScreen.main.bounds.height
//                )
//                .ignoresSafeArea()
//                .blur(radius: 1)
//                .overlay(
//                    LinearGradient(
//                        gradient: Gradient(colors: [Color.white.opacity(0.1), Color.green.opacity(0.6)]),
//                        startPoint: .top,
//                        endPoint: .bottom
//                    )
//                    .ignoresSafeArea()
//                )
//            
//            VStack(spacing: 40) {
//                Spacer()
//                
//                VStack(spacing: 30) {
//                    Image("app_logo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 220, height: 220)
//                        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
//
//                    Spacer()
//                    
//                    Button(action: {
//                        animatePlayButton()
//                        showGame = true
//                    }) {
//                        ZStack {
//                            RoundedRectangle(cornerRadius: 25)
//                                .fill(Color.green.opacity(0.7))
//                                .frame(width: 200, height: 70)
//                                .offset(y: 8)
//                            
//                            RoundedRectangle(cornerRadius: 25)
//                                .fill(
//                                    LinearGradient(
//                                        gradient: Gradient(colors: [
//                                            Color.green,
//                                            Color.green.opacity(0.8)
//                                        ]),
//                                        startPoint: .top,
//                                        endPoint: .bottom
//                                    )
//                                )
//                                .frame(width: 200, height: 70)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 25)
//                                        .stroke(Color.white.opacity(0.3), lineWidth: 2)
//                                )
//                                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
//                            
//                            HStack(spacing: 15) {
//                                Image(systemName: "play.fill")
//                                    .font(.title2)
//                                    .foregroundColor(.white)
//                                
//                                Text("PLAY")
//                                    .font(.system(size: 24, weight: .bold, design: .rounded))
//                                    .foregroundColor(.white)
//                            }
//                        }
//                    }
//                    .scaleEffect(playButtonScale)
//                    .buttonStyle(PlainButtonStyle())
//                    
//                    Button(action: {
//                        animateAboutButton()
//                        showHowToPlay = true
//                    }) {
//                        ZStack {
//                            Circle()
//                                .fill(Color.blue.opacity(0.5))
//                                .frame(width: 80, height: 80)
//                                .offset(y: 4)
//                            
//                            Circle()
//                                .fill(
//                                    LinearGradient(
//                                        gradient: Gradient(colors: [
//                                            Color.white,
//                                            Color.green,
//                                            Color.green.opacity(0.8)
//                                        ]),
//                                        startPoint: .topLeading,
//                                        endPoint: .bottomTrailing
//                                    )
//                                )
//                                .frame(width: 80, height: 80)
//                                .overlay(
//                                    Circle()
//                                        .stroke(
//                                            LinearGradient(
//                                                gradient: Gradient(colors: [
//                                                    Color.white.opacity(0.8),
//                                                    Color.orange.opacity(0.6),
//                                                    Color.white.opacity(0.3)
//                                                ]),
//                                                startPoint: .topLeading,
//                                                endPoint: .bottomTrailing
//                                            ),
//                                            lineWidth: 3
//                                        )
//                                        .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
//                                )
//                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
//                            
//                            Image(systemName: "info.circle.fill")
//                                .font(.system(size: 32, weight: .bold))
//                                .foregroundColor(.white)
//                                .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
//                        }
//                    }
//                    .scaleEffect(aboutButtonScale)
//                    .buttonStyle(PlainButtonStyle())
//                    .padding(.bottom, 30)
//                }
//                
//                Spacer()
//            }
//            .padding()
//            .fullScreenCover(isPresented: $showGame) {
//                GameView()
//            }
//            // In MainMenuView, replace the sheet with:
//            .fullScreenCover(isPresented: $showHowToPlay) {
//                HowToPlayView()
//            }
//        }
//        
//    }
//    
//    private func animatePlayButton() {
//        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
//            playButtonScale = 0.9
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
//                playButtonScale = 1.0
//            }
//        }
//    }
//    
//    private func animateAboutButton() {
//        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
//            aboutButtonScale = 0.9
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
//                aboutButtonScale = 1.0
//            }
//        }
//    }
//
//}
//
//
//// Add this outside GameView struct
//class ScoreManager {
//    static let shared = ScoreManager()
//    
//    private let scoreKey = "totalScore"
//    
//    func saveScore(_ score: Int) {
//        UserDefaults.standard.set(score, forKey: scoreKey)
//    }
//    
//    func getScore() -> Int {
//        return UserDefaults.standard.integer(forKey: scoreKey)
//    }
//}
//
//import SwiftUI
//import AVFoundation
//
//struct GameView: View {
//    @Environment(\.presentationMode) var presentationMode
//    @State private var rabbitPosition = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height - 200)
//    @State private var carrots: [Carrot] = []
//    @State private var obstacles: [Obstacle] = []
//   // @State private var score = 0
//    @State private var carrotsCollected = 0
//    @State private var lives = 3
//    @State private var gameOver = false
//    @State private var gameSuccess = false
//    @State private var showControls = false
//    @State private var gameStarted = false
//    
//    @State private var leftGrassOffset: CGFloat = 0
//    @State private var rightGrassOffset: CGFloat = 0
//    
//    
//    // CHANGE: Sirf ek hi score variable rakho jo UserDefaults se load ho
//    @State private var score: Int = ScoreManager.shared.getScore()
//       
//    
//    @State private var isInvincible = false
//    @State private var lastCollisionTime: Date = Date()
//    let collisionCooldown: TimeInterval = 1.0
//    
//    @State private var scoreTimer: Timer?
//    @State private var showHitEffect = false
//    @State private var hitEffectText = ""
//    
//    let rabbitSize: CGFloat = 140
//    let carrotSize: CGFloat = 110
//    let obstacleSize: CGFloat = 120
//    let roadWidth = UIScreen.main.bounds.width * 0.4
//    let grassWidth = UIScreen.main.bounds.width * 0.3
//
//    let gameSpeed: CGFloat = 6.0
//    let backgroundSpeed: CGFloat = 6.0
//
//    let leftLane: CGFloat
//    let centerLane: CGFloat
//    let rightLane: CGFloat
//    
//    @State private var obstacleTimer: Timer?
//    
//    init() {
//        let screenWidth = UIScreen.main.bounds.width
//        let roadLeftEdge = (screenWidth - roadWidth) / 2
//        let roadRightEdge = (screenWidth + roadWidth) / 2
//        
//        self.leftLane = roadLeftEdge + roadWidth * 0.25
//        self.centerLane = screenWidth / 2
//        self.rightLane = roadRightEdge - roadWidth * 0.25
//    }
//
//    var body: some View {
//        ZStack {
//            Image("background")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(
//                    width: UIScreen.main.bounds.width,
//                    height: UIScreen.main.bounds.height
//                )
//                .ignoresSafeArea()
//            
//            
//
//            ZStack {
//                ZStack {
//                    Image("left_grass")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: grassWidth, height: UIScreen.main.bounds.height * 2)
//                        .offset(y: leftGrassOffset)
//                    
//                    Image("left_grass")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: grassWidth, height: UIScreen.main.bounds.height * 2)
//                        .offset(y: leftGrassOffset - UIScreen.main.bounds.height * 2)
//                }
//                .frame(width: grassWidth, height: UIScreen.main.bounds.height)
//                .clipped()
//                .position(x: grassWidth / 2, y: UIScreen.main.bounds.height / 2)
//                
//                Rectangle()
//                    .fill(LinearGradient(
//                        gradient: Gradient(colors: [
//                            Color(red: 0.6, green: 0.4, blue: 0.2),
//                            Color(red: 0.7, green: 0.5, blue: 0.3),
//                            Color(red: 0.6, green: 0.4, blue: 0.2)
//                        ]),
//                        startPoint: .top,
//                        endPoint: .bottom
//                    ))
//                    .frame(width: roadWidth, height: UIScreen.main.bounds.height)
//                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
//                    .overlay(
//                        ZStack {
//                            ForEach(0..<8) { i in
//                                Rectangle()
//                                    .fill(Color.clear)
//                                    .frame(width: 10, height: 30)
//                                    .position(
//                                        x: UIScreen.main.bounds.width / 2,
//                                        y: CGFloat(i * 120)
//                                    )
//                            }
//                        }
//                    )
//            
//             
//                
//                ZStack {
//                    Image("left_grass")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: grassWidth, height: UIScreen.main.bounds.height * 2)
//                        .offset(y: rightGrassOffset)
//                    
//                    Image("left_grass")
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: grassWidth, height: UIScreen.main.bounds.height * 2)
//                        .offset(y: rightGrassOffset - UIScreen.main.bounds.height * 2)
//                }
//                .frame(width: grassWidth, height: UIScreen.main.bounds.height)
//                .clipped()
//                .position(x: UIScreen.main.bounds.width - grassWidth / 2, y: UIScreen.main.bounds.height / 2)
//            }
//            .ignoresSafeArea()
//            
//         
//
//            ZStack {
//                ForEach(carrots) { carrot in
//                    Image("carrot")
//                        .resizable()
//                        .frame(width: carrotSize, height: carrotSize)
//                        .position(carrot.position)
//                        .shadow(color: .orange.opacity(0.7), radius: 8, x: 0, y: 4)
//                }
//
//                ForEach(obstacles) { obstacle in
//                    Image(obstacle.type == .bull ? "bull" : "farmer")
//                        .resizable()
//                        .frame(width: 100, height: 130)
//                        .position(obstacle.position)
//                        .shadow(color: .black.opacity(0.6), radius: 10, x: 0, y: 5)
//                }
//
//                Image("rabbit")
//                    .resizable()
//                    .frame(width: 160, height: 200)
//                    .position(rabbitPosition)
//                    .shadow(color: .black.opacity(0.4), radius: 8, x: 0, y: 4)
//                    .opacity(isInvincible ? 0.5 : 1.0)
//            }
//
//            if showHitEffect {
//                ZStack {
//                    Rectangle()
//                        .fill(
//                            RadialGradient(
//                                gradient: Gradient(colors: [
//                                    Color.yellow.opacity(0.8),
//                                    Color.orange.opacity(0.6),
//                                    Color.red.opacity(0.4),
//                                    Color.clear
//                                ]),
//                                center: .center,
//                                startRadius: 0,
//                                endRadius: 200
//                            )
//                        )
//                        .frame(width: 400, height: 400)
//                        .blur(radius: 20)
//                    
//                    ForEach(0..<15, id: \.self) { index in
//                        Circle()
//                            .fill(
//                                LinearGradient(
//                                    gradient: Gradient(colors: [
//                                        Color.yellow,
//                                        Color.orange,
//                                        Color.red
//                                    ]),
//                                    startPoint: .top,
//                                    endPoint: .bottom
//                                )
//                            )
//                            .frame(width: CGFloat.random(in: 10...30), height: CGFloat.random(in: 10...30))
//                            .position(
//                                x: rabbitPosition.x + CGFloat.random(in: -100...100),
//                                y: rabbitPosition.y + CGFloat.random(in: -100...100)
//                            )
//                            .opacity(0.7)
//                    }
//                    
//                    Text(hitEffectText)
//                        .font(.system(size: 32, weight: .heavy, design: .rounded))
//                        .foregroundColor(.white)
//                        .shadow(color: .red, radius: 10)
//                        .scaleEffect(1.5)
//                        .position(x: rabbitPosition.x, y: rabbitPosition.y - 80)
//                }
//                .transition(.opacity)
//            }
//
//            VStack {
//                HStack {
//                    Button(action: {
//                        presentationMode.wrappedValue.dismiss()
//                    }) {
//                        Image(systemName: "chevron.left")
//                            .font(.title2)
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color.black.opacity(0.7))
//                            .clipShape(Circle())
//                    }
//
//                    Spacer()
//
//                    HStack(spacing: 8) {
//                        ForEach(0..<3, id: \.self) { index in
//                            Image(systemName: index < lives ? "heart.fill" : "heart")
//                                .foregroundColor(index < lives ? .red : .gray)
//                                .font(.title2)
//                        }
//                    }
//                    .padding(.horizontal, 20)
//                    .padding(.vertical, 10)
//                    .background(Color.black.opacity(0.7))
//                    .cornerRadius(25)
//
//                    Spacer()
//
//                    VStack(spacing: 8) {
//                        Text("Score: \(score)")
//                            .font(.system(size: 18, weight: .bold))
//                            .foregroundColor(.white)
//
//                        HStack(spacing: 6) {
//                            Image(systemName: "carrot")
//                                .foregroundColor(.orange)
//                                .font(.title3)
//                            Text("\(carrotsCollected)/40")
//                                .font(.system(size: 18, weight: .bold))
//                                .foregroundColor(.orange)
//                        }
//                    }
//                    .padding(.horizontal, 20)
//                    .padding(.vertical, 10)
//                    .background(Color.black.opacity(0.7))
//                    .cornerRadius(25)
//                }
//                .padding(.top, 50)
//                .padding(.horizontal)
//
//                Spacer()
//
//                if showControls {
//                    HStack {
//                        Button(action: {
//                            moveRabbitLeft()
//                        }) {
//                            ZStack {
//                                Circle()
//                                    .fill(
//                                        LinearGradient(
//                                            gradient: Gradient(colors: [
//                                                Color.green,
//                                                Color.green.opacity(0.8)
//                                            ]),
//                                            startPoint: .topLeading,
//                                            endPoint: .bottomTrailing
//                                        )
//                                    )
//                                    .frame(width: 70, height: 70)
//                                    .overlay(
//                                        Circle()
//                                            .stroke(Color.white, lineWidth: 4)
//                                            .shadow(color: .black.opacity(0.3), radius: 5)
//                                    )
//                                
//                                Image(systemName: "arrow.left")
//                                    .font(.system(size: 35, weight: .bold))
//                                    .foregroundColor(.white)
//                                    .shadow(color: .black.opacity(0.3), radius: 2)
//                            }
//                        }
//                        .padding(.leading, 40)
//
//                        Spacer()
//
//                        Button(action: {
//                            moveRabbitRight()
//                        }) {
//                            ZStack {
//                                Circle()
//                                    .fill(
//                                        LinearGradient(
//                                            gradient: Gradient(colors: [
//                                                Color.orange,
//                                                Color.orange.opacity(0.8)
//                                            ]),
//                                            startPoint: .topLeading,
//                                            endPoint: .bottomTrailing
//                                        )
//                                    )
//                                    .frame(width: 70, height: 70)
//                                    .overlay(
//                                        Circle()
//                                            .stroke(Color.white, lineWidth: 4)
//                                            .shadow(color: .black.opacity(0.3), radius: 5)
//                                    )
//                                
//                                Image(systemName: "arrow.right")
//                                    .font(.system(size: 35, weight: .bold))
//                                    .foregroundColor(.white)
//                                    .shadow(color: .black.opacity(0.3), radius: 2)
//                            }
//                        }
//                        .padding(.trailing, 40)
//                    }
//                    .padding(.bottom, 80)
//                } else {
//                    VStack {
//                        Spacer()
//                        Button(action: {
//                            startGame()
//                        }) {
//                            ZStack {
//                                Circle()
//                                    .fill(
//                                        LinearGradient(
//                                            gradient: Gradient(colors: [
//                                                Color.green,
//                                                Color.green,
//                                                Color.green
//                                            ]),
//                                            startPoint: .topLeading,
//                                            endPoint: .bottomTrailing
//                                        )
//                                    )
//                                    .frame(width: 70, height: 70)
//                                    .overlay(
//                                        Circle()
//                                            .stroke(
//                                                LinearGradient(
//                                                    gradient: Gradient(colors: [
//                                                        Color.white,
//                                                        Color.yellow
//                                                    ]),
//                                                    startPoint: .topLeading,
//                                                    endPoint: .bottomTrailing
//                                                ),
//                                                lineWidth: 6
//                                            )
//                                            .shadow(color: .black.opacity(0.5), radius: 10)
//                                    )
//                                
//                                Image(systemName: "play.fill")
//                                    .font(.system(size: 35, weight: .bold))
//                                    .foregroundColor(.white)
//                                    .shadow(color: .black.opacity(0.5), radius: 5)
//                                    .offset(x: 4)
//                            }
//                        }
//                        .padding(.bottom, 60)
//                        .scaleEffect(1.1)
//                    }
//                }
//            }
//
//    
//            
//            if gameOver {
//                Color.black.opacity(0.85)
//                    .ignoresSafeArea()
//                GameOverView(
//                    percentage: calculatePercentage(),
//                    carrotsCollected: carrotsCollected,
//                    restartAction: restartGame,
//                    menuAction: { presentationMode.wrappedValue.dismiss() }
//                )
//            }
//
//            if gameSuccess {
//                Color.black.opacity(0.85)
//                    .ignoresSafeArea()
//                GameSuccessView(
//                    score: score,
//                    carrotsCollected: carrotsCollected,
//                    restartAction: restartGame,
//                    menuAction: { presentationMode.wrappedValue.dismiss() }
//                )
//            }
//        }
//    }
//
//    func moveRabbitLeft() {
//        if rabbitPosition.x == rightLane {
//            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
//                rabbitPosition.x = centerLane
//            }
//        } else if rabbitPosition.x == centerLane {
//            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
//                rabbitPosition.x = leftLane
//            }
//        }
//    }
//
//    func moveRabbitRight() {
//        if rabbitPosition.x == leftLane {
//            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
//                rabbitPosition.x = centerLane
//            }
//        } else if rabbitPosition.x == centerLane {
//            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
//                rabbitPosition.x = rightLane
//            }
//        }
//    }
//
//
//    
//    func startGame() {
//         gameStarted = true
//         showControls = true
//         isInvincible = false
//         
//         // Load current saved score
//         score = ScoreManager.shared.getScore()
//         
//         rabbitPosition.x = centerLane
//         obstacles.removeAll()
//         startCarrotGeneration()
//         startObstacleSpawning()
//         startGameLoop()
//         startScoreTimer()
//     }
//    
//    func startScoreTimer() {
//           scoreTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
//               if gameOver || gameSuccess {
//                   timer.invalidate()
//                   return
//               }
//               score += 1
//               // Automatically save to UserDefaults
//               ScoreManager.shared.saveScore(score)
//           }
//       }
//
//
//    func startCarrotGeneration() {
//        let carrotX = UIScreen.main.bounds.width / 2
//        let spacing: CGFloat = 180
//        
//        for i in 0..<50 {
//            let carrot = Carrot(
//                position: CGPoint(x: carrotX, y: -CGFloat(i) * spacing)
//            )
//            carrots.append(carrot)
//        }
//    }
//
//    func spawnObstacle() {
//        let isLeftSide = Bool.random()
//        let obstacleType: ObstacleType = Bool.random() ? .bull : .farmer
//        let xPosition = isLeftSide ? leftLane : rightLane
//        
//        let newObstacle = Obstacle(
//            position: CGPoint(x: xPosition, y: -obstacleSize),
//            type: obstacleType
//        )
//        
//        obstacles.append(newObstacle)
//    }
//
//    func startObstacleSpawning() {
//        obstacleTimer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
//            if gameOver || gameSuccess {
//                timer.invalidate()
//                return
//            }
//            spawnObstacle()
//        }
//    }
//
//    func startGameLoop() {
//        Timer.scheduledTimer(withTimeInterval: 0.016, repeats: true) { timer in
//            if gameOver || gameSuccess {
//                timer.invalidate()
//                obstacleTimer?.invalidate()
//                scoreTimer?.invalidate()
//                return
//            }
//            updateGame()
//        }
//    }
//
//    func updateGame() {
//        for index in carrots.indices {
//            carrots[index].position.y += gameSpeed
//            
//            if checkCollection(rabbitPosition: rabbitPosition, itemPosition: carrots[index].position, itemSize: carrotSize) {
//                carrotsCollected += 1
//                playSound(named: "collect")
//                carrots.remove(at: index)
//                
//                if carrotsCollected >= 40 {
//                    gameSuccess = true
//                    playSound(named: "success")
//                }
//                return
//            }
//            
//            if carrots[index].position.y > UIScreen.main.bounds.height + carrotSize {
//                carrots[index].position.y = -carrotSize
//            }
//        }
//        
//        for index in obstacles.indices {
//            obstacles[index].position.y += gameSpeed
//            
//            if obstacles[index].position.y > UIScreen.main.bounds.height + obstacleSize {
//                obstacles.remove(at: index)
//                return
//            }
//        }
//        
//        leftGrassOffset += backgroundSpeed
//        rightGrassOffset += backgroundSpeed
//        
//        if leftGrassOffset > UIScreen.main.bounds.height * 2 {
//            leftGrassOffset = 0
//        }
//        if rightGrassOffset > UIScreen.main.bounds.height * 2 {
//            rightGrassOffset = 0
//        }
//        
//        if isInvincible {
//            let timeSinceLastCollision = Date().timeIntervalSince(lastCollisionTime)
//            if timeSinceLastCollision > collisionCooldown {
//                isInvincible = false
//            }
//        }
//        
//        if !isInvincible {
//            checkObstacleCollisions()
//        }
//    }
//
//    func checkObstacleCollisions() {
//        for obstacle in obstacles {
//            let isSameLane = abs(rabbitPosition.x - obstacle.position.x) < 50
//            
//            if isSameLane && checkCollision(rabbitPosition: rabbitPosition, obstaclePosition: obstacle.position) {
//                handleCollision(with: obstacle)
//                return
//            }
//        }
//    }
//
//    func handleCollision(with obstacle: Obstacle) {
//        lives -= 1
//        playSound(named: "hit")
//        
//        showHitEffect = true
//        hitEffectText = "-1 LIFE"
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//            withAnimation(.easeOut(duration: 0.5)) {
//                showHitEffect = false
//            }
//        }
//        
//        isInvincible = true
//        lastCollisionTime = Date()
//        
//        if let index = obstacles.firstIndex(where: { $0.id == obstacle.id }) {
//            obstacles.remove(at: index)
//        }
//        
//        withAnimation(.spring(response: 0.2, dampingFraction: 0.3)) {
//            if obstacle.position.x == leftLane {
//                rabbitPosition.x = rightLane
//            } else {
//                rabbitPosition.x = leftLane
//            }
//        }
//        
//        if lives <= 0 {
//            gameOver = true
//            playSound(named: "gameover")
//        }
//    }
//
//    func checkCollection(rabbitPosition: CGPoint, itemPosition: CGPoint, itemSize: CGFloat) -> Bool {
//        let distance = sqrt(pow(rabbitPosition.x - itemPosition.x, 2) + pow(rabbitPosition.y - itemPosition.y, 2))
//        return distance < (rabbitSize + itemSize) / 2
//    }
//
//    func checkCollision(rabbitPosition: CGPoint, obstaclePosition: CGPoint) -> Bool {
//        let distance = sqrt(pow(rabbitPosition.x - obstaclePosition.x, 2) + pow(rabbitPosition.y - obstaclePosition.y, 2))
//        return distance < (rabbitSize + obstacleSize) / 2
//    }
//
//    func calculatePercentage() -> Int {
//        // Calculate percentage based on carrots collected out of 40
//        let percentage = Double(carrotsCollected) / 40.0 * 100.0
//        return Int(percentage)
//    }
//    
//    // CHANGE: Restart game mein score reset nahi karo, continue karo
//       func restartGame() {
//           rabbitPosition = CGPoint(x: centerLane, y: UIScreen.main.bounds.height - 200)
//           carrots.removeAll()
//           obstacles.removeAll()
//           // Score reset nahi karo - continue from saved score
//           carrotsCollected = 0
//           lives = 3
//           gameOver = false
//           gameSuccess = false
//           showControls = false
//           gameStarted = false
//           isInvincible = false
//           showHitEffect = false
//           leftGrassOffset = 0
//           rightGrassOffset = 0
//           obstacleTimer?.invalidate()
//           scoreTimer?.invalidate()
//       }
//
//
//
//    func playSound(named soundName: String) {
//        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return }
//        
//        do {
//            // Uncomment when you have audio player setup
//            // audioPlayer = try AVAudioPlayer(contentsOf: url)
//            // audioPlayer?.play()
//        } catch {
//            print("Error playing sound: \(error.localizedDescription)")
//        }
//    }
//}
//
//struct Carrot: Identifiable {
//    let id = UUID()
//    var position: CGPoint
//}
//
//struct Obstacle: Identifiable {
//    let id = UUID()
//    var position: CGPoint
//    let type: ObstacleType
//}
//
//enum ObstacleType {
//    case bull
//    case farmer
//}
//
//struct GameSuccessView: View {
//    let score: Int
//    let carrotsCollected: Int
//    let restartAction: () -> Void
//    let menuAction: () -> Void
//    
//    var body: some View {
//        ZStack {
//            Image("background")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .ignoresSafeArea()
//                .overlay(Color.white.opacity(0.4).ignoresSafeArea())
//            
//            VStack(spacing: 0) {
//                Spacer()
//                    .frame(height: UIScreen.main.bounds.height * 0.1)
//                
//                Image("success")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(
//                        maxWidth: UIScreen.main.bounds.width * 0.85,
//                        maxHeight: UIScreen.main.bounds.height * 0.6
//                    )
//                    .cornerRadius(20)
//                    .clipped()
//                    .overlay(
//                        VStack {
//                            Image("app_logo")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(height: 200)
//                                .padding(.top, -40)
//                           
//                            Text("Level Completed")
//                                .font(.system(size: 30))
//                                .fontWeight(.bold)
//                                .foregroundColor(.green)
//                                .padding(.horizontal, 20)
//                            
//                            VStack(spacing: 8) {
//                                Text("Carrots Collected:")
//                                    .font(.system(size: 25))
//                                    .fontWeight(.bold)
//                                    .foregroundColor(.white)
//                                
//                                Text("\(carrotsCollected)")
//                                    .font(.system(size: 20))
//                                    .fontWeight(.semibold)
//                                    .foregroundColor(.green)
//                            }
//                            .padding(.top, 10)
//                            
//                            VStack(spacing: 8) {
//                                Text("Total Scores")
//                                    .font(.system(size: 25))
//                                    .fontWeight(.bold)
//                                    .foregroundColor(.white)
//                                
//                                Text("\(score)")
//                                    .font(.system(size: 20))
//                                    .fontWeight(.semibold)
//                                    .foregroundColor(.green)
//                            }
//                            .padding(.top, 5)
//                            
//                            Spacer()
//                            
//                            Button("Next Play") {
//                                restartAction()
//                            }
//                            .font(.headline)
//                            .fontWeight(.semibold)
//                            .foregroundColor(.white)
//                            .padding(.horizontal, 40)
//                            .padding(.vertical, 12)
//                            .background(Color.green)
//                            .cornerRadius(10)
//                            .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)
//                            .padding(.bottom, 30)
//                        }
//                        .padding()
//                    )
//                
//                Spacer()
//                    .frame(height: UIScreen.main.bounds.height * 0.1)
//            }
//            .padding(.horizontal, 40)
//        }
//        .ignoresSafeArea()
//    }
//}
//
//struct GameOverView: View {
//    let percentage: Int
//    let carrotsCollected: Int
//    let restartAction: () -> Void
//    let menuAction: () -> Void
//    
//    var body: some View {
//        ZStack {
//            Image("background")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .ignoresSafeArea()
//                .overlay(Color.white.opacity(0.4).ignoresSafeArea())
//            
//            VStack(spacing: 0) {
//                Spacer()
//                    .frame(height: UIScreen.main.bounds.height * 0.1)
//                
//                Image("success")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(
//                        maxWidth: UIScreen.main.bounds.width * 0.85,
//                        maxHeight: UIScreen.main.bounds.height * 0.6
//                    )
//                    .cornerRadius(20)
//                    .clipped()
//                    .overlay(
//                        VStack {
//                            Image("over")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(height: 200)
//                                .padding(.top, -40)
//                           
//                            Text("Game Over")
//                                .font(.system(size: 30))
//                                .fontWeight(.bold)
//                                .foregroundColor(.green)
//                                .padding(.horizontal, 20)
//                            
//                            VStack(spacing: 8) {
//                                Text("Carrots Collected:")
//                                    .font(.system(size: 25))
//                                    .fontWeight(.bold)
//                                    .foregroundColor(.white)
//                                
//                                Text("\(carrotsCollected)")
//                                    .font(.system(size: 20))
//                                    .fontWeight(.semibold)
//                                    .foregroundColor(.green)
//                            }
//                            .padding(.top, 10)
//                            
//                            VStack(spacing: 8) {
//                                Text("Percentage")
//                                    .font(.system(size: 25))
//                                    .fontWeight(.bold)
//                                    .foregroundColor(.white)
//                                
//                                Text("\(percentage)%")
//                                    .font(.system(size: 20))
//                                    .fontWeight(.semibold)
//                                    .foregroundColor(.green)
//                            }
//                            .padding(.top, 5)
//                            
//                            Spacer()
//                            
//                            Button("Try Again") {
//                                restartAction()
//                            }
//                            .font(.headline)
//                            .fontWeight(.semibold)
//                            .foregroundColor(.white)
//                            .padding(.horizontal, 40)
//                            .padding(.vertical, 12)
//                            .background(Color.green)
//                            .cornerRadius(10)
//                            .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)
//                            .padding(.bottom, 30)
//                        }
//                        .padding()
//                    )
//                
//                Spacer()
//                    .frame(height: UIScreen.main.bounds.height * 0.1)
//            }
//            .padding(.horizontal, 40)
//        }
//        .ignoresSafeArea()
//    }
//}
//
//// MARK: - Feature Model
//struct Feature {
//    let title: String
//    let subtitle: String
//    let description: String
//    let themeColor: Color
//    let icon: String
//    let customDrawing: AnyView
//}
////// MARK: - Feature Card
//struct FeatureCard: View {
//    let feature: Feature
//    
//    var body: some View {
//        ZStack {
//            // Card Background
//            RoundedRectangle(cornerRadius: 30)
//                .fill(
//                    LinearGradient(
//                        gradient: Gradient(colors: [
//                            feature.themeColor.opacity(0.9),
//                            feature.themeColor.opacity(0.5),
//                            Color.white.opacity(0.15)
//                        ]),
//                        startPoint: .topLeading,
//                        endPoint: .bottomTrailing
//                    )
//                )
//                .overlay(
//                    RoundedRectangle(cornerRadius: 30)
//                        .stroke(Color.white.opacity(0.4), lineWidth: 2)
//                )
//                .shadow(color: .black.opacity(0.4), radius: 15, x: 0, y: 8)
//            
//            VStack(spacing: 15) {
//                // Header with Icon
//                VStack(spacing: 8) {
//                    Text(feature.icon)
//                        .font(.system(size: 45))
//                        .shadow(color: .black.opacity(0.3), radius: 3)
//                    
//                    Text(feature.title)
//                        .font(.system(size: 22, weight: .black, design: .rounded))
//                        .foregroundColor(.white)
//                        .multilineTextAlignment(.center)
//                        .shadow(color: .black.opacity(0.6), radius: 3)
//                    
//                    Text(feature.subtitle)
//                        .font(.system(size: 14, weight: .medium, design: .rounded))
//                        .foregroundColor(.yellow)
//                        .multilineTextAlignment(.center)
//                }
//                
//                // Custom Drawing
//                feature.customDrawing
//                    .frame(height: 150)
//                
//                // Description
//                Text(feature.description)
//                    .font(.system(size: 15, weight: .medium, design: .rounded))
//                    .foregroundColor(.white)
//                    .multilineTextAlignment(.center)
//                    .lineSpacing(3)
//                    .padding(.horizontal, 20)
//                    .fixedSize(horizontal: false, vertical: true)
//                
//                Spacer()
//            }
//            .padding(.vertical, 25)
//            .padding(.horizontal, 15)
//        }
//        .frame(width: UIScreen.main.bounds.width * 0.78, height: 430)
//    }
//}
////
////// MARK: - Custom Drawings
//struct RabbitDrawing: View {
//    var body: some View {
//        ZStack {
//            // Background Circle
//            Circle()
//                .fill(
//                    RadialGradient(
//                        gradient: Gradient(colors: [
//                            Color.orange.opacity(0.4),
//                            Color.orange.opacity(0.1)
//                        ]),
//                        center: .center,
//                        startRadius: 0,
//                        endRadius: 80
//                    )
//                )
//            
//            // Rabbit with Animation
//            Image("rabbit")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 100, height: 100)
//                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
//                .scaleEffect(1.1)
//        }
//    }
//}
////
//struct SwipeNavigationDrawing: View {
//    @State private var rabbitPosition: CGFloat = 0
//    
//    var body: some View {
//        ZStack {
//            // Road Background
//            RoundedRectangle(cornerRadius: 20)
//                .fill(Color.brown.opacity(0.3))
//                .frame(width: 200, height: 120)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 20)
//                        .stroke(Color.white.opacity(0.3), lineWidth: 2)
//                )
//            
//            // Lanes
//            HStack(spacing: 40) {
//                ForEach(0..<3, id: \.self) { index in
//                    Rectangle()
//                        .fill(Color.yellow.opacity(0.4))
//                        .frame(width: 4, height: 100)
//                }
//            }
//            
//            // Rabbit that moves
//            Image("rabbit")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 50, height: 50)
//                .offset(x: rabbitPosition)
//                .onAppear {
//                    withAnimation(Animation.easeInOut(duration: 1.5).repeatForever()) {
//                        rabbitPosition = 60
//                    }
//                    
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//                        withAnimation(Animation.easeInOut(duration: 1.5).repeatForever()) {
//                            rabbitPosition = -60
//                        }
//                    }
//                }
//            
//            // Arrows
//            HStack {
//                Image(systemName: "arrow.left.circle.fill")
//                    .font(.title2)
//                    .foregroundColor(.blue)
//                    .offset(x: -90)
//                
//                Image(systemName: "arrow.right.circle.fill")
//                    .font(.title2)
//                    .foregroundColor(.orange)
//                    .offset(x: 90)
//            }
//        }
//    }
//}
//
//
//
//
//
//struct HowToPlayView: View {
//    @Environment(\.presentationMode) var presentationMode
//    @State private var currentPage = 0
//    
//    let features = [
//        Feature(
//            title: "RABBIT CATCH ROAD",
//            subtitle: "Your Strong Companion",
//            description: "Meet your quick and cute strong Rabbit! Guide the character through vibrant landscapes with swift movements to gather rewards and navigate challenges.",
//            themeColor: Color.orange,
//            icon: "🐰",
//            customDrawing: AnyView(RabbitDrawing())
//        ),
//        Feature(
//            title: "LANE NAVIGATION",
//            subtitle: "Strategic Movement",
//            description: "Tap left or right to switch between three pathways. Master the timing to navigate around challenges and position yourself for reward collection.",
//            themeColor: Color.blue,
//            icon: "🎯",
//            customDrawing: AnyView(SwipeNavigationDrawing())
//        ),
//        Feature(
//            title: "VIBRANT REWARDS",
//            subtitle: "Collectible Items",
//            description: "Gather colorful items scattered along your journey. Each collection increases your progress - aim for the target to complete your mission!",
//            themeColor: Color.orange,
//            icon: "🎁",
//            customDrawing: AnyView(CarrotCollectionDrawing())
//        ),
//        Feature(
//            title: "MOVING CHALLENGE",
//            subtitle: "Dynamic Obstacle",
//            description: "Navigate around moving elements in your path. Contact will affect your progress. Stay alert and change pathways quickly.",
//            themeColor: Color.red,
//            icon: "🚧",
//            customDrawing: AnyView(BullObstacleDrawing())
//        ),
//        Feature(
//            title: "PATROLLING FARMER",
//            subtitle: "Strategic Avoidance",
//            description: "Watch for patrolling farmer  along your route. Strategic avoidance is key to maintaining your progress and achieving your goal.",
//            themeColor: Color.green,
//            icon: "👀",
//            customDrawing: AnyView(FarmerObstacleDrawing())
//        ),
//        Feature(
//            title: "PROGRESS SYSTEM",
//            subtitle: "Three-Tier Challenge",
//            description: "Begin with 3 progress indicators. Manage them carefully! Each encounter affects your progress. The journey continues while indicators remain.",
//            themeColor: Color.pink,
//            icon: "💫",
//            customDrawing: AnyView(HeartSystemDrawing())
//        )
//    ]
//    
//    var body: some View {
//        ZStack {
//            // Background Image with Overlay
//            Image("background")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(
//                    width: UIScreen.main.bounds.width,
//                    height: UIScreen.main.bounds.height
//                )
//                .ignoresSafeArea()
//                .overlay(
//                    LinearGradient(
//                        gradient: Gradient(colors: [
//                            Color.black.opacity(0.6),
//                            Color.black.opacity(0.4),
//                            Color.black.opacity(0.6)
//                        ]),
//                        startPoint: .top,
//                        endPoint: .bottom
//                    )
//                )
//            
//            // Close Button
//            VStack {
//                HStack {
//                    Button(action: {
//                        presentationMode.wrappedValue.dismiss()
//                    }) {
//                        Image(systemName: "xmark.circle.fill")
//                            .font(.system(size: 35))
//                            .foregroundColor(.white)
//                            .padding(8)
//                            .background(Color.black.opacity(0.8))
//                            .clipShape(Circle())
//                            .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
//                    }
//                    .padding(.top, 50)
//                }
//                Spacer()
//            }
//            
//            // Main Content
//            VStack(spacing: 0) {
//                Spacer()
//                
//                // Header
//                VStack(spacing: 8) {
//                    Text("Guide")
//                        .font(.system(size: 16, weight: .medium, design: .rounded))
//                        .foregroundColor(.yellow)
//                        .shadow(color: .black.opacity(0.5), radius: 5)
//                }
//                .padding(.top, 10)
//                .padding(.bottom, 10)
//                
//                // Feature Pager
//                ZStack {
//                    // Background Card with Border
//                    RoundedRectangle(cornerRadius: 35)
//                        .fill(
//                            LinearGradient(
//                                gradient: Gradient(colors: [
//                                    Color.white.opacity(0.12),
//                                    Color.white.opacity(0.05),
//                                    Color.white.opacity(0.08)
//                                ]),
//                                startPoint: .topLeading,
//                                endPoint: .bottomTrailing
//                            )
//                        )
//                        .frame(width: UIScreen.main.bounds.width * 0.88, height: 480)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 35)
//                                .stroke(
//                                    LinearGradient(
//                                        gradient: Gradient(colors: [
//                                            Color.white.opacity(0.3),
//                                            Color.white.opacity(0.1),
//                                            Color.white.opacity(0.3)
//                                        ]),
//                                        startPoint: .topLeading,
//                                        endPoint: .bottomTrailing
//                                    ),
//                                    lineWidth: 2
//                                )
//                        )
//                        .shadow(color: .black.opacity(0.6), radius: 25, x: 0, y: 10)
//                    
//                    TabView(selection: $currentPage) {
//                        ForEach(0..<features.count, id: \.self) { index in
//                            FeatureCard(feature: features[index])
//                                .tag(index)
//                        }
//                    }
//                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//                    .frame(width: UIScreen.main.bounds.width * 0.82, height: 460)
//                }
//                
//                // Page Indicators
//                HStack(spacing: 10) {
//                    ForEach(0..<features.count, id: \.self) { index in
//                        Capsule()
//                            .fill(currentPage == index ? Color.white : Color.white.opacity(0.3))
//                            .frame(width: currentPage == index ? 25 : 8, height: 8)
//                            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: currentPage)
//                    }
//                }
//                .padding(.top, 25)
//                
//                // Navigation Buttons
//                HStack(spacing: 40) {
//                    // Previous Button
//                    Button(action: {
//                        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
//                            currentPage = max(0, currentPage - 1)
//                        }
//                    }) {
//                        Image(systemName: "chevron.left.circle.fill")
//                            .font(.system(size: 45))
//                            .foregroundColor(currentPage > 0 ? .white : .white.opacity(0.3))
//                            .shadow(color: .black.opacity(0.5), radius: 5)
//                    }
//                    .disabled(currentPage == 0)
//                    
//                    // Next/Close Button
//                    Button(action: {
//                        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
//                            if currentPage < features.count - 1 {
//                                currentPage += 1
//                            } else {
//                                presentationMode.wrappedValue.dismiss()
//                            }
//                        }
//                    }) {
//                        ZStack {
//                            Circle()
//                                .fill(
//                                    LinearGradient(
//                                        gradient: Gradient(colors: [
//                                            features[currentPage].themeColor,
//                                            features[currentPage].themeColor.opacity(0.8)
//                                        ]),
//                                        startPoint: .topLeading,
//                                        endPoint: .bottomTrailing
//                                    )
//                                )
//                                .frame(width: 65, height: 65)
//                                .shadow(color: .black.opacity(0.4), radius: 8, x: 0, y: 4)
//                            
//                            Image(systemName: currentPage < features.count - 1 ? "chevron.right" : "play.fill")
//                                .font(.system(size: 26, weight: .bold))
//                                .foregroundColor(.white)
//                                .shadow(color: .black.opacity(0.3), radius: 2)
//                        }
//                    }
//                }
//                .padding(.top, 25)
//                .padding(.bottom, 40)
//                
//                Spacer()
//            }
//        }
//    }
//}
//
//// MARK: - Updated Custom Drawings with neutral terms
//struct CarrotCollectionDrawing: View {
//    @State private var rewardScale: [CGFloat] = [1.0, 1.0, 1.0]
//    
//    var body: some View {
//        ZStack {
//            // Background
//            RoundedRectangle(cornerRadius: 20)
//                .fill(Color.orange.opacity(0.2))
//                .frame(width: 220, height: 100)
//            
//            HStack(spacing: 30) {
//                ForEach(0..<3, id: \.self) { index in
//                    VStack(spacing: 5) {
//                        Image("carrot")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 40, height: 40)
//                            .scaleEffect(rewardScale[index])
//                            .onAppear {
//                                withAnimation(
//                                    Animation.easeInOut(duration: 0.6)
//                                        .repeatForever()
//                                        .delay(Double(index) * 0.2)
//                                ) {
//                                    rewardScale[index] = 1.2
//                                }
//                            }
//                        
//                        Text("+10")
//                            .font(.system(size: 12, weight: .bold, design: .rounded))
//                            .foregroundColor(.yellow)
//                    }
//                }
//            }
//            
//            // Character collecting
//            Image("rabbit")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 45, height: 45)
//                .offset(x: -80, y: 10)
//        }
//    }
//}
//
//struct BullObstacleDrawing: View {
//    @State private var obstacleOffset: CGFloat = -80
//    
//    var body: some View {
//        ZStack {
//            // Background with alert stripes
//            RoundedRectangle(cornerRadius: 20)
//                .fill(
//                    LinearGradient(
//                        gradient: Gradient(colors: [
//                            Color.red.opacity(0.3),
//                            Color.orange.opacity(0.2)
//                        ]),
//                        startPoint: .top,
//                        endPoint: .bottom
//                    )
//                )
//                .frame(width: 220, height: 100)
//            
//            HStack(spacing: 60) {
//                // Moving obstacle
//                Image("bull")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 60, height: 60)
//                    .offset(x: obstacleOffset)
//                    .onAppear {
//                        withAnimation(Animation.easeInOut(duration: 2.0).repeatForever()) {
//                            obstacleOffset = 80
//                        }
//                    }
//                
//                // Character navigating
//                Image("rabbit")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 45, height: 45)
//                    .offset(x: -30)
//            }
//            
//            // Alert icon
//            Image(systemName: "exclamationmark.triangle.fill")
//                .font(.title2)
//                .foregroundColor(.red)
//                .offset(y: -35)
//        }
//    }
//}
//
//struct FarmerObstacleDrawing: View {
//    @State private var patrolScale: CGFloat = 1.0
//    
//    var body: some View {
//        ZStack {
//            // Background
//            RoundedRectangle(cornerRadius: 20)
//                .fill(Color.green.opacity(0.2))
//                .frame(width: 220, height: 100)
//            
//            HStack(spacing: 50) {
//                // Patrolling element
//                Image("farmer")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 50, height: 50)
//                    .scaleEffect(patrolScale)
//                    .onAppear {
//                        withAnimation(Animation.easeInOut(duration: 1.0).repeatForever()) {
//                            patrolScale = 1.1
//                        }
//                    }
//                
//                // Character maneuvering
//                Image("rabbit")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 40, height: 40)
//                    .opacity(0.7)
//            }
//            
//            // Observation indicators
//            HStack(spacing: 40) {
//                ForEach(0..<2, id: \.self) { _ in
//                    Circle()
//                        .fill(Color.blue.opacity(0.6))
//                        .frame(width: 8, height: 8)
//                }
//            }
//            .offset(y: -25)
//        }
//    }
//}
//
//struct HeartSystemDrawing: View {
//    @State private var progressPulse: CGFloat = 1.0
//    
//    var body: some View {
//        ZStack {
//            // Background
//            RoundedRectangle(cornerRadius: 20)
//                .fill(Color.pink.opacity(0.2))
//                .frame(width: 220, height: 100)
//            
//            HStack(spacing: 15) {
//                ForEach(0..<3, id: \.self) { index in
//                    VStack(spacing: 5) {
//                        Image(systemName: "circle.fill")
//                            .font(.title2)
//                            .foregroundColor(index == 0 ? .green : .gray)
//                            .scaleEffect(index == 0 ? progressPulse : 1.0)
//                        
//                        if index == 0 {
//                            Text("Active")
//                                .font(.system(size: 10, weight: .bold))
//                                .foregroundColor(.white)
//                        } else {
//                            Text("Used")
//                                .font(.system(size: 10, weight: .bold))
//                                .foregroundColor(.gray)
//                        }
//                    }
//                }
//            }
//            
//            // Animate the first progress indicator
//            .onAppear {
//                withAnimation(Animation.easeInOut(duration: 0.8).repeatForever()) {
//                    progressPulse = 1.2
//                }
//            }
//            
//            // Progress impact indicator
//            VStack {
//                Spacer()
//                HStack {
//                    Text("-1")
//                        .font(.system(size: 16, weight: .black, design: .rounded))
//                        .foregroundColor(.red)
//                        .padding(5)
//                        .background(Color.white.opacity(0.3))
//                        .cornerRadius(5)
//                    Spacer()
//                }
//                .offset(x: 20, y: 20)
//            }
//        }
//    }
//}




import SwiftUI
import AVFoundation

// Audio Manager Class
class AudioManager: ObservableObject {
    static let shared = AudioManager()
    
    private var backgroundPlayer: AVAudioPlayer?
    private var soundPlayers: [String: AVAudioPlayer] = [:]
    
    @Published var isBackgroundMusicPlaying = false
    
    private init() {
        setupAudioSession()
    }
    
    private func setupAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.ambient, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to set up audio session: \(error)")
        }
    }
    
    // Background Music
    func playBackgroundMusic(named fileName: String = "background_music") {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            print("Background music file not found: \(fileName).mp3")
            return
        }
        
        do {
            backgroundPlayer = try AVAudioPlayer(contentsOf: url)
            backgroundPlayer?.numberOfLoops = -1 // Infinite loop
            backgroundPlayer?.volume = 0.7
            backgroundPlayer?.play()
            isBackgroundMusicPlaying = true
            print("Background music started")
        } catch {
            print("Error playing background music: \(error)")
        }
    }
    
    func stopBackgroundMusic() {
        backgroundPlayer?.stop()
        backgroundPlayer = nil
        isBackgroundMusicPlaying = false
        print("Background music stopped")
    }
    
    func pauseBackgroundMusic() {
        backgroundPlayer?.pause()
        isBackgroundMusicPlaying = false
    }
    
    func resumeBackgroundMusic() {
        backgroundPlayer?.play()
        isBackgroundMusicPlaying = true
    }
    
    // Sound Effects
    func playSoundEffect(named fileName: String, volume: Float = 1.0) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            print("Sound effect file not found: \(fileName).mp3")
            return
        }
        
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.volume = volume
            player.play()
            soundPlayers[fileName] = player
        } catch {
            print("Error playing sound effect: \(error)")
        }
    }
    
    // Preload sounds for better performance
    func preloadSound(named fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "mp3") else {
            print("Sound file not found for preloading: \(fileName).mp3")
            return
        }
        
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            soundPlayers[fileName] = player
        } catch {
            print("Error preloading sound: \(error)")
        }
    }
    
    func stopAllSounds() {
        backgroundPlayer?.stop()
        soundPlayers.values.forEach { $0.stop() }
        soundPlayers.removeAll()
        isBackgroundMusicPlaying = false
    }
}

struct SplashView: View {
    @State private var isActive = false
    @State private var scale = 0.7
    @State private var opacity = 0.0
 
    
    var body: some View {
        if isActive {
            MainMenuView()
        } else {
            ZStack {
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height
                    )
                    .ignoresSafeArea()
            }
            .onAppear {
                withAnimation(.easeIn(duration: 1.2)) {
                    scale = 1.0
                    opacity = 1.0
                }
             
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

struct MainMenuView: View {
    @State private var showGame = false
    @State private var showAbout = false
    @State private var playButtonScale: CGFloat = 1.0
    @State private var aboutButtonScale: CGFloat = 1.0
    @State private var showHowToPlay = false
    @StateObject private var audioManager = AudioManager.shared
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(
                    width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height
                )
                .ignoresSafeArea()
                .blur(radius: 1)
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [Color.white.opacity(0.1), Color.green.opacity(0.6)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()
                )
            
            VStack(spacing: 40) {
                Spacer()
                
                VStack(spacing: 30) {
                    Image("app_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 220)
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)

                    Spacer()
                    
                    Button(action: {
                        animatePlayButton()
                        // Play button click sound
                        audioManager.playSoundEffect(named: "button_click")
                        showGame = true
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 25)
                                .fill(Color.green.opacity(0.7))
                                .frame(width: 200, height: 70)
                                .offset(y: 8)
                            
                            RoundedRectangle(cornerRadius: 25)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.green,
                                            Color.green.opacity(0.8)
                                        ]),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .frame(width: 200, height: 70)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke(Color.white.opacity(0.3), lineWidth: 2)
                                )
                                .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 2)
                            
                            HStack(spacing: 15) {
                                Image(systemName: "play.fill")
                                    .font(.title2)
                                    .foregroundColor(.white)
                                
                                Text("PLAY")
                                    .font(.system(size: 24, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    .scaleEffect(playButtonScale)
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {
                        animateAboutButton()
                        // Play button click sound
                        audioManager.playSoundEffect(named: "button_click")
                        showHowToPlay = true
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.blue.opacity(0.5))
                                .frame(width: 80, height: 80)
                                .offset(y: 4)
                            
                            Circle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.white,
                                            Color.green,
                                            Color.green.opacity(0.8)
                                        ]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 80, height: 80)
                                .overlay(
                                    Circle()
                                        .stroke(
                                            LinearGradient(
                                                gradient: Gradient(colors: [
                                                    Color.white.opacity(0.8),
                                                    Color.orange.opacity(0.6),
                                                    Color.white.opacity(0.3)
                                                ]),
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            ),
                                            lineWidth: 3
                                        )
                                        .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
                                )
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
                            
                            Image(systemName: "info.circle.fill")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.white)
                                .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
                        }
                    }
                    .scaleEffect(aboutButtonScale)
                    .buttonStyle(PlainButtonStyle())
                    .padding(.bottom, 30)
                }
                
                Spacer()
            }
            .padding()
            .fullScreenCover(isPresented: $showGame) {
                GameView()
            }
            .fullScreenCover(isPresented: $showHowToPlay) {
                HowToPlayView()
            }
        }
        .onAppear {
            
            // Start background music when splash appears
            audioManager.playBackgroundMusic()
            
            // Ensure background music continues
            if !audioManager.isBackgroundMusicPlaying {
                audioManager.resumeBackgroundMusic()
            }
        }
    }
    
    private func animatePlayButton() {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
            playButtonScale = 0.9
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                playButtonScale = 1.0
            }
        }
    }
    
    private func animateAboutButton() {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
            aboutButtonScale = 0.9
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                aboutButtonScale = 1.0
            }
        }
    }
}

// Add this outside GameView struct
class ScoreManager {
    static let shared = ScoreManager()
    
    private let scoreKey = "totalScore"
    
    func saveScore(_ score: Int) {
        UserDefaults.standard.set(score, forKey: scoreKey)
    }
    
    func getScore() -> Int {
        return UserDefaults.standard.integer(forKey: scoreKey)
    }
}

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var audioManager = AudioManager.shared
    
    @State private var rabbitPosition = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height - 200)
    @State private var carrots: [Carrot] = []
    @State private var obstacles: [Obstacle] = []
    @State private var score: Int = ScoreManager.shared.getScore()
    @State private var carrotsCollected = 0
    @State private var lives = 3
    @State private var gameOver = false
    @State private var gameSuccess = false
    @State private var showControls = false
    @State private var gameStarted = false
    @State private var leftGrassOffset: CGFloat = 0
    @State private var rightGrassOffset: CGFloat = 0
    @State private var isInvincible = false
    @State private var lastCollisionTime: Date = Date()
    @State private var scoreTimer: Timer?
    @State private var showHitEffect = false
    @State private var hitEffectText = ""
    
    let rabbitSize: CGFloat = 140
    let carrotSize: CGFloat = 110
    let obstacleSize: CGFloat = 120
    let roadWidth = UIScreen.main.bounds.width * 0.4
    let grassWidth = UIScreen.main.bounds.width * 0.3
    let gameSpeed: CGFloat = 6.0
    let backgroundSpeed: CGFloat = 6.0
    let collisionCooldown: TimeInterval = 1.0
    
    let leftLane: CGFloat
    let centerLane: CGFloat
    let rightLane: CGFloat
    
    @State private var obstacleTimer: Timer?
    
    init() {
        let screenWidth = UIScreen.main.bounds.width
        let roadLeftEdge = (screenWidth - roadWidth) / 2
        let roadRightEdge = (screenWidth + roadWidth) / 2
        
        self.leftLane = roadLeftEdge + roadWidth * 0.25
        self.centerLane = screenWidth / 2
        self.rightLane = roadRightEdge - roadWidth * 0.25
    }

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(
                    width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height
                )
                .ignoresSafeArea()
            
            ZStack {
                ZStack {
                    Image("left_grass")
                        .resizable()
                        .scaledToFill()
                        .frame(width: grassWidth, height: UIScreen.main.bounds.height * 2)
                        .offset(y: leftGrassOffset)
                    
                    Image("left_grass")
                        .resizable()
                        .scaledToFill()
                        .frame(width: grassWidth, height: UIScreen.main.bounds.height * 2)
                        .offset(y: leftGrassOffset - UIScreen.main.bounds.height * 2)
                }
                .frame(width: grassWidth, height: UIScreen.main.bounds.height)
                .clipped()
                .position(x: grassWidth / 2, y: UIScreen.main.bounds.height / 2)
                
                Rectangle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 0.6, green: 0.4, blue: 0.2),
                            Color(red: 0.7, green: 0.5, blue: 0.3),
                            Color(red: 0.6, green: 0.4, blue: 0.2)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                    .frame(width: roadWidth, height: UIScreen.main.bounds.height)
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
                    .overlay(
                        ZStack {
                            ForEach(0..<8) { i in
                                Rectangle()
                                    .fill(Color.clear)
                                    .frame(width: 10, height: 30)
                                    .position(
                                        x: UIScreen.main.bounds.width / 2,
                                        y: CGFloat(i * 120)
                                    )
                            }
                        }
                    )
            
                ZStack {
                    Image("left_grass")
                        .resizable()
                        .scaledToFill()
                        .frame(width: grassWidth, height: UIScreen.main.bounds.height * 2)
                        .offset(y: rightGrassOffset)
                    
                    Image("left_grass")
                        .resizable()
                        .scaledToFill()
                        .frame(width: grassWidth, height: UIScreen.main.bounds.height * 2)
                        .offset(y: rightGrassOffset - UIScreen.main.bounds.height * 2)
                }
                .frame(width: grassWidth, height: UIScreen.main.bounds.height)
                .clipped()
                .position(x: UIScreen.main.bounds.width - grassWidth / 2, y: UIScreen.main.bounds.height / 2)
            }
            .ignoresSafeArea()
            
            ZStack {
                ForEach(carrots) { carrot in
                    Image("carrot")
                        .resizable()
                        .frame(width: carrotSize, height: carrotSize)
                        .position(carrot.position)
                        .shadow(color: .orange.opacity(0.7), radius: 8, x: 0, y: 4)
                }

                ForEach(obstacles) { obstacle in
                    Image(obstacle.type == .bull ? "bull" : "farmer")
                        .resizable()
                        .frame(width: 100, height: 130)
                        .position(obstacle.position)
                        .shadow(color: .black.opacity(0.6), radius: 10, x: 0, y: 5)
                }

                Image("rabbit")
                    .resizable()
                    .frame(width: 160, height: 200)
                    .position(rabbitPosition)
                    .shadow(color: .black.opacity(0.4), radius: 8, x: 0, y: 4)
                    .opacity(isInvincible ? 0.5 : 1.0)
            }

            if showHitEffect {
                ZStack {
                    Rectangle()
                        .fill(
                            RadialGradient(
                                gradient: Gradient(colors: [
                                    Color.yellow.opacity(0.8),
                                    Color.orange.opacity(0.6),
                                    Color.red.opacity(0.4),
                                    Color.clear
                                ]),
                                center: .center,
                                startRadius: 0,
                                endRadius: 200
                            )
                        )
                        .frame(width: 400, height: 400)
                        .blur(radius: 20)
                    
                    ForEach(0..<15, id: \.self) { index in
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.yellow,
                                        Color.orange,
                                        Color.red
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .frame(width: CGFloat.random(in: 10...30), height: CGFloat.random(in: 10...30))
                            .position(
                                x: rabbitPosition.x + CGFloat.random(in: -100...100),
                                y: rabbitPosition.y + CGFloat.random(in: -100...100)
                            )
                            .opacity(0.7)
                    }
                    
                    Text(hitEffectText)
                        .font(.system(size: 32, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                        .shadow(color: .red, radius: 10)
                        .scaleEffect(1.5)
                        .position(x: rabbitPosition.x, y: rabbitPosition.y - 80)
                }
                .transition(.opacity)
            }

            VStack {
                HStack {
                    Button(action: {
                        audioManager.playSoundEffect(named: "button_click")
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .clipShape(Circle())
                    }

                    Spacer()

                    HStack(spacing: 8) {
                        ForEach(0..<3, id: \.self) { index in
                            Image(systemName: index < lives ? "heart.fill" : "heart")
                                .foregroundColor(index < lives ? .red : .gray)
                                .font(.title2)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(25)

                    Spacer()

                    VStack(spacing: 8) {
                        Text("Score: \(score)")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)

                        HStack(spacing: 6) {
                            Image(systemName: "carrot")
                                .foregroundColor(.orange)
                                .font(.title3)
                            Text("\(carrotsCollected)/40")
                                .font(.system(size: 18, weight: .bold))
                                .foregroundColor(.orange)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(25)
                }
                .padding(.top, 50)
                .padding(.horizontal)

                Spacer()

                if showControls {
                    HStack {
                        Button(action: {
                            moveRabbitLeft()
                        }) {
                            ZStack {
                                Circle()
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color.green,
                                                Color.green.opacity(0.8)
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .frame(width: 70, height: 70)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.white, lineWidth: 4)
                                            .shadow(color: .black.opacity(0.3), radius: 5)
                                    )
                                
                                Image(systemName: "arrow.left")
                                    .font(.system(size: 35, weight: .bold))
                                    .foregroundColor(.white)
                                    .shadow(color: .black.opacity(0.3), radius: 2)
                            }
                        }
                        .padding(.leading, 40)

                        Spacer()

                        Button(action: {
                            moveRabbitRight()
                        }) {
                            ZStack {
                                Circle()
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color.orange,
                                                Color.orange.opacity(0.8)
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .frame(width: 70, height: 70)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.white, lineWidth: 4)
                                            .shadow(color: .black.opacity(0.3), radius: 5)
                                    )
                                
                                Image(systemName: "arrow.right")
                                    .font(.system(size: 35, weight: .bold))
                                    .foregroundColor(.white)
                                    .shadow(color: .black.opacity(0.3), radius: 2)
                            }
                        }
                        .padding(.trailing, 40)
                    }
                    .padding(.bottom, 80)
                } else {
                    VStack {
                        Spacer()
                        Button(action: {
                            startGame()
                        }) {
                            ZStack {
                                Circle()
                                    .fill(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color.green,
                                                Color.green,
                                                Color.green
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .frame(width: 70, height: 70)
                                    .overlay(
                                        Circle()
                                            .stroke(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [
                                                        Color.white,
                                                        Color.yellow
                                                    ]),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                ),
                                                lineWidth: 6
                                            )
                                            .shadow(color: .black.opacity(0.5), radius: 10)
                                    )
                                
                                Image(systemName: "play.fill")
                                    .font(.system(size: 35, weight: .bold))
                                    .foregroundColor(.white)
                                    .shadow(color: .black.opacity(0.5), radius: 5)
                                    .offset(x: 4)
                            }
                        }
                        .padding(.bottom, 60)
                        .scaleEffect(1.1)
                    }
                }
            }
            
            if gameOver {
                Color.black.opacity(0.85)
                    .ignoresSafeArea()
                GameOverView(
                    percentage: calculatePercentage(),
                    carrotsCollected: carrotsCollected,
                    restartAction: restartGame,
                    menuAction: {
                        audioManager.playSoundEffect(named: "button_click")
                        presentationMode.wrappedValue.dismiss()
                    }
                )
            }

            if gameSuccess {
                Color.black.opacity(0.85)
                    .ignoresSafeArea()
                GameSuccessView(
                    score: score,
                    carrotsCollected: carrotsCollected,
                    restartAction: restartGame,
                    menuAction: {
                        audioManager.playSoundEffect(named: "button_click")
                        presentationMode.wrappedValue.dismiss()
                    }
                )
            }
        }
        .onAppear {
            // Preload game sounds for better performance
            preloadGameSounds()
        }
        .onDisappear {
            // Resume background music when leaving game
            audioManager.resumeBackgroundMusic()
        }
    }
    
    private func preloadGameSounds() {
        audioManager.preloadSound(named: "collect")
        audioManager.preloadSound(named: "hit")
        audioManager.preloadSound(named: "gameover")
        audioManager.preloadSound(named: "success")
        audioManager.preloadSound(named: "button_click")
    }

    func moveRabbitLeft() {
        if rabbitPosition.x == rightLane {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                rabbitPosition.x = centerLane
            }
        } else if rabbitPosition.x == centerLane {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                rabbitPosition.x = leftLane
            }
        }
    }

    func moveRabbitRight() {
        if rabbitPosition.x == leftLane {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                rabbitPosition.x = centerLane
            }
        } else if rabbitPosition.x == centerLane {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                rabbitPosition.x = rightLane
            }
        }
    }
    
    func startGame() {
         gameStarted = true
         showControls = true
         isInvincible = false
         
         // Pause background music during gameplay
         audioManager.pauseBackgroundMusic()
         
         // Load current saved score
         score = ScoreManager.shared.getScore()
         
         rabbitPosition.x = centerLane
         obstacles.removeAll()
         startCarrotGeneration()
         startObstacleSpawning()
         startGameLoop()
         startScoreTimer()
     }
    
    func startScoreTimer() {
           scoreTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
               if gameOver || gameSuccess {
                   timer.invalidate()
                   return
               }
               score += 1
               // Automatically save to UserDefaults
               ScoreManager.shared.saveScore(score)
           }
       }

    func startCarrotGeneration() {
        let carrotX = UIScreen.main.bounds.width / 2
        let spacing: CGFloat = 180
        
        for i in 0..<50 {
            let carrot = Carrot(
                position: CGPoint(x: carrotX, y: -CGFloat(i) * spacing)
            )
            carrots.append(carrot)
        }
    }

    func spawnObstacle() {
        let isLeftSide = Bool.random()
        let obstacleType: ObstacleType = Bool.random() ? .bull : .farmer
        let xPosition = isLeftSide ? leftLane : rightLane
        
        let newObstacle = Obstacle(
            position: CGPoint(x: xPosition, y: -obstacleSize),
            type: obstacleType
        )
        
        obstacles.append(newObstacle)
    }

    func startObstacleSpawning() {
        obstacleTimer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { timer in
            if gameOver || gameSuccess {
                timer.invalidate()
                return
            }
            spawnObstacle()
        }
    }

    func startGameLoop() {
        Timer.scheduledTimer(withTimeInterval: 0.016, repeats: true) { timer in
            if gameOver || gameSuccess {
                timer.invalidate()
                obstacleTimer?.invalidate()
                scoreTimer?.invalidate()
                return
            }
            updateGame()
        }
    }

    func updateGame() {
        for index in carrots.indices {
            carrots[index].position.y += gameSpeed
            
            if checkCollection(rabbitPosition: rabbitPosition, itemPosition: carrots[index].position, itemSize: carrotSize) {
                carrotsCollected += 1
                // Play carrot collection sound
                audioManager.playSoundEffect(named: "collect", volume: 0.8)
                carrots.remove(at: index)
                
                if carrotsCollected >= 40 {
                    gameSuccess = true
                    // Play success sound
                    audioManager.playSoundEffect(named: "success")
                }
                return
            }
            
            if carrots[index].position.y > UIScreen.main.bounds.height + carrotSize {
                carrots[index].position.y = -carrotSize
            }
        }
        
        for index in obstacles.indices {
            obstacles[index].position.y += gameSpeed
            
            if obstacles[index].position.y > UIScreen.main.bounds.height + obstacleSize {
                obstacles.remove(at: index)
                return
            }
        }
        
        leftGrassOffset += backgroundSpeed
        rightGrassOffset += backgroundSpeed
        
        if leftGrassOffset > UIScreen.main.bounds.height * 2 {
            leftGrassOffset = 0
        }
        if rightGrassOffset > UIScreen.main.bounds.height * 2 {
            rightGrassOffset = 0
        }
        
        if isInvincible {
            let timeSinceLastCollision = Date().timeIntervalSince(lastCollisionTime)
            if timeSinceLastCollision > collisionCooldown {
                isInvincible = false
            }
        }
        
        if !isInvincible {
            checkObstacleCollisions()
        }
    }

    func checkObstacleCollisions() {
        for obstacle in obstacles {
            let isSameLane = abs(rabbitPosition.x - obstacle.position.x) < 50
            
            if isSameLane && checkCollision(rabbitPosition: rabbitPosition, obstaclePosition: obstacle.position) {
                handleCollision(with: obstacle)
                return
            }
        }
    }

    func handleCollision(with obstacle: Obstacle) {
        lives -= 1
        // Play hit sound
        audioManager.playSoundEffect(named: "hit")
        
        showHitEffect = true
        hitEffectText = "-1 LIFE"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            withAnimation(.easeOut(duration: 0.5)) {
                showHitEffect = false
            }
        }
        
        isInvincible = true
        lastCollisionTime = Date()
        
        if let index = obstacles.firstIndex(where: { $0.id == obstacle.id }) {
            obstacles.remove(at: index)
        }
        
        withAnimation(.spring(response: 0.2, dampingFraction: 0.3)) {
            if obstacle.position.x == leftLane {
                rabbitPosition.x = rightLane
            } else {
                rabbitPosition.x = leftLane
            }
        }
        
        if lives <= 0 {
            gameOver = true
            // Play game over sound
            audioManager.playSoundEffect(named: "gameover")
        }
    }

    func checkCollection(rabbitPosition: CGPoint, itemPosition: CGPoint, itemSize: CGFloat) -> Bool {
        let distance = sqrt(pow(rabbitPosition.x - itemPosition.x, 2) + pow(rabbitPosition.y - itemPosition.y, 2))
        return distance < (rabbitSize + itemSize) / 2
    }

    func checkCollision(rabbitPosition: CGPoint, obstaclePosition: CGPoint) -> Bool {
        let distance = sqrt(pow(rabbitPosition.x - obstaclePosition.x, 2) + pow(rabbitPosition.y - obstaclePosition.y, 2))
        return distance < (rabbitSize + obstacleSize) / 2
    }

    func calculatePercentage() -> Int {
        // Calculate percentage based on carrots collected out of 40
        let percentage = Double(carrotsCollected) / 40.0 * 100.0
        return Int(percentage)
    }
    
    func restartGame() {
           rabbitPosition = CGPoint(x: centerLane, y: UIScreen.main.bounds.height - 200)
           carrots.removeAll()
           obstacles.removeAll()
           // Score reset nahi karo - continue from saved score
           carrotsCollected = 0
           lives = 3
           gameOver = false
           gameSuccess = false
           showControls = false
           gameStarted = false
           isInvincible = false
           showHitEffect = false
           leftGrassOffset = 0
           rightGrassOffset = 0
           obstacleTimer?.invalidate()
           scoreTimer?.invalidate()
       }
}

struct Carrot: Identifiable {
    let id = UUID()
    var position: CGPoint
}

struct Obstacle: Identifiable {
    let id = UUID()
    var position: CGPoint
    let type: ObstacleType
}

enum ObstacleType {
    case bull
    case farmer
}

struct GameSuccessView: View {
    let score: Int
    let carrotsCollected: Int
    let restartAction: () -> Void
    let menuAction: () -> Void
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .overlay(Color.white.opacity(0.4).ignoresSafeArea())
            
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: UIScreen.main.bounds.height * 0.1)
                
                Image("success")
                    .resizable()
                    .scaledToFill()
                    .frame(
                        maxWidth: UIScreen.main.bounds.width * 0.85,
                        maxHeight: UIScreen.main.bounds.height * 0.6
                    )
                    .cornerRadius(20)
                    .clipped()
                    .overlay(
                        VStack {
                            Image("app_logo")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .padding(.top, -40)
                           
                            Text("Level Completed")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                                .padding(.horizontal, 20)
                            
                            VStack(spacing: 8) {
                                Text("Carrots Collected:")
                                    .font(.system(size: 25))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Text("\(carrotsCollected)")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.green)
                            }
                            .padding(.top, 10)
                            
                            VStack(spacing: 8) {
                                Text("Total Scores")
                                    .font(.system(size: 25))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Text("\(score)")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.green)
                            }
                            .padding(.top, 5)
                            
                            Spacer()
                            
                            Button("Next Play") {
                                restartAction()
                            }
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 12)
                            .background(Color.green)
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)
                            .padding(.bottom, 30)
                        }
                        .padding()
                    )
                
                Spacer()
                    .frame(height: UIScreen.main.bounds.height * 0.1)
            }
            .padding(.horizontal, 40)
        }
        .ignoresSafeArea()
    }
}

struct GameOverView: View {
    let percentage: Int
    let carrotsCollected: Int
    let restartAction: () -> Void
    let menuAction: () -> Void
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .overlay(Color.white.opacity(0.4).ignoresSafeArea())
            
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: UIScreen.main.bounds.height * 0.1)
                
                Image("success")
                    .resizable()
                    .scaledToFill()
                    .frame(
                        maxWidth: UIScreen.main.bounds.width * 0.85,
                        maxHeight: UIScreen.main.bounds.height * 0.6
                    )
                    .cornerRadius(20)
                    .clipped()
                    .overlay(
                        VStack {
                            Image("over")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .padding(.top, -40)
                           
                            Text("Game Over")
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                                .padding(.horizontal, 20)
                            
                            VStack(spacing: 8) {
                                Text("Carrots Collected:")
                                    .font(.system(size: 25))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Text("\(carrotsCollected)")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.green)
                            }
                            .padding(.top, 10)
                            
                            VStack(spacing: 8) {
                                Text("Percentage")
                                    .font(.system(size: 25))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Text("\(percentage)%")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.green)
                            }
                            .padding(.top, 5)
                            
                            Spacer()
                            
                            Button("Try Again") {
                                restartAction()
                            }
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 12)
                            .background(Color.green)
                            .cornerRadius(10)
                            .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 2)
                            .padding(.bottom, 30)
                        }
                        .padding()
                    )
                
                Spacer()
                    .frame(height: UIScreen.main.bounds.height * 0.1)
            }
            .padding(.horizontal, 40)
        }
        .ignoresSafeArea()
    }
}

// MARK: - Feature Model
struct Feature {
    let title: String
    let subtitle: String
    let description: String
    let themeColor: Color
    let icon: String
    let customDrawing: AnyView
}

// MARK: - Feature Card
struct FeatureCard: View {
    let feature: Feature
    
    var body: some View {
        ZStack {
            // Card Background
            RoundedRectangle(cornerRadius: 30)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            feature.themeColor.opacity(0.9),
                            feature.themeColor.opacity(0.5),
                            Color.white.opacity(0.15)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.white.opacity(0.4), lineWidth: 2)
                )
                .shadow(color: .black.opacity(0.4), radius: 15, x: 0, y: 8)
            
            VStack(spacing: 15) {
                // Header with Icon
                VStack(spacing: 8) {
                    Text(feature.icon)
                        .font(.system(size: 45))
                        .shadow(color: .black.opacity(0.3), radius: 3)
                    
                    Text(feature.title)
                        .font(.system(size: 22, weight: .black, design: .rounded))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .shadow(color: .black.opacity(0.6), radius: 3)
                    
                    Text(feature.subtitle)
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .foregroundColor(.yellow)
                        .multilineTextAlignment(.center)
                }
                
                // Custom Drawing
                feature.customDrawing
                    .frame(height: 150)
                
                // Description
                Text(feature.description)
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineSpacing(3)
                    .padding(.horizontal, 20)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
            }
            .padding(.vertical, 25)
            .padding(.horizontal, 15)
        }
        .frame(width: UIScreen.main.bounds.width * 0.78, height: 430)
    }
}

// MARK: - Custom Drawings
struct RabbitDrawing: View {
    var body: some View {
        ZStack {
            // Background Circle
            Circle()
                .fill(
                    RadialGradient(
                        gradient: Gradient(colors: [
                            Color.orange.opacity(0.4),
                            Color.orange.opacity(0.1)
                        ]),
                        center: .center,
                        startRadius: 0,
                        endRadius: 80
                    )
                )
            
            // Rabbit with Animation
            Image("rabbit")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 3)
                .scaleEffect(1.1)
        }
    }
}

struct SwipeNavigationDrawing: View {
    @State private var rabbitPosition: CGFloat = 0
    
    var body: some View {
        ZStack {
            // Road Background
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.brown.opacity(0.3))
                .frame(width: 200, height: 120)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(0.3), lineWidth: 2)
                )
            
            // Lanes
            HStack(spacing: 40) {
                ForEach(0..<3, id: \.self) { index in
                    Rectangle()
                        .fill(Color.yellow.opacity(0.4))
                        .frame(width: 4, height: 100)
                }
            }
            
            // Rabbit that moves
            Image("rabbit")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .offset(x: rabbitPosition)
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 1.5).repeatForever()) {
                        rabbitPosition = 60
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation(Animation.easeInOut(duration: 1.5).repeatForever()) {
                            rabbitPosition = -60
                        }
                    }
                }
            
            // Arrows
            HStack {
                Image(systemName: "arrow.left.circle.fill")
                    .font(.title2)
                    .foregroundColor(.blue)
                    .offset(x: -90)
                
                Image(systemName: "arrow.right.circle.fill")
                    .font(.title2)
                    .foregroundColor(.orange)
                    .offset(x: 90)
            }
        }
    }
}

struct HowToPlayView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var audioManager = AudioManager.shared
    @State private var currentPage = 0
    
    let features = [
        Feature(
            title: "RABBIT CATCH ROAD",
            subtitle: "Your Strong Companion",
            description: "Meet your quick and cute strong Rabbit! Guide the character through vibrant landscapes with swift movements to gather rewards and navigate challenges.",
            themeColor: Color.orange,
            icon: "🐰",
            customDrawing: AnyView(RabbitDrawing())
        ),
        Feature(
            title: "LANE NAVIGATION",
            subtitle: "Strategic Movement",
            description: "Tap left or right to switch between three pathways. Master the timing to navigate around challenges and position yourself for reward collection.",
            themeColor: Color.blue,
            icon: "🎯",
            customDrawing: AnyView(SwipeNavigationDrawing())
        ),
        Feature(
            title: "VIBRANT REWARDS",
            subtitle: "Collectible Items",
            description: "Gather colorful items scattered along your journey. Each collection increases your progress - aim for the target to complete your mission!",
            themeColor: Color.orange,
            icon: "🎁",
            customDrawing: AnyView(CarrotCollectionDrawing())
        ),
        Feature(
            title: "MOVING CHALLENGE",
            subtitle: "Dynamic Obstacle",
            description: "Navigate around moving elements in your path. Contact will affect your progress. Stay alert and change pathways quickly.",
            themeColor: Color.red,
            icon: "🚧",
            customDrawing: AnyView(BullObstacleDrawing())
        ),
        Feature(
            title: "PATROLLING FARMER",
            subtitle: "Strategic Avoidance",
            description: "Watch for patrolling farmer  along your route. Strategic avoidance is key to maintaining your progress and achieving your goal.",
            themeColor: Color.green,
            icon: "👀",
            customDrawing: AnyView(FarmerObstacleDrawing())
        ),
        Feature(
            title: "PROGRESS SYSTEM",
            subtitle: "Three-Tier Challenge",
            description: "Begin with 3 progress indicators. Manage them carefully! Each encounter affects your progress. The journey continues while indicators remain.",
            themeColor: Color.pink,
            icon: "💫",
            customDrawing: AnyView(HeartSystemDrawing())
        )
    ]
    
    var body: some View {
        ZStack {
            // Background Image with Overlay
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(
                    width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height
                )
                .ignoresSafeArea()
                .overlay(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.black.opacity(0.6),
                            Color.black.opacity(0.4),
                            Color.black.opacity(0.6)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            
            // Close Button
            VStack {
                HStack {
                    Button(action: {
                        audioManager.playSoundEffect(named: "button_click")
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 35))
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.black.opacity(0.8))
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
                    }
                    .padding(.top, 50)
                }
                Spacer()
            }
            
            // Main Content
            VStack(spacing: 0) {
                Spacer()
                
                // Header
                VStack(spacing: 8) {
                    Text("Guide")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(.yellow)
                        .shadow(color: .black.opacity(0.5), radius: 5)
                }
                .padding(.top, 10)
                .padding(.bottom, 10)
                
                // Feature Pager
                ZStack {
                    // Background Card with Border
                    RoundedRectangle(cornerRadius: 35)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.white.opacity(0.12),
                                    Color.white.opacity(0.05),
                                    Color.white.opacity(0.08)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: UIScreen.main.bounds.width * 0.88, height: 480)
                        .overlay(
                            RoundedRectangle(cornerRadius: 35)
                                .stroke(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color.white.opacity(0.3),
                                            Color.white.opacity(0.1),
                                            Color.white.opacity(0.3)
                                        ]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ),
                                    lineWidth: 2
                                )
                        )
                        .shadow(color: .black.opacity(0.6), radius: 25, x: 0, y: 10)
                    
                    TabView(selection: $currentPage) {
                        ForEach(0..<features.count, id: \.self) { index in
                            FeatureCard(feature: features[index])
                                .tag(index)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    .frame(width: UIScreen.main.bounds.width * 0.82, height: 460)
                }
                
                // Page Indicators
                HStack(spacing: 10) {
                    ForEach(0..<features.count, id: \.self) { index in
                        Capsule()
                            .fill(currentPage == index ? Color.white : Color.white.opacity(0.3))
                            .frame(width: currentPage == index ? 25 : 8, height: 8)
                            .animation(.spring(response: 0.3, dampingFraction: 0.6), value: currentPage)
                    }
                }
                .padding(.top, 25)
                
                // Navigation Buttons
                HStack(spacing: 40) {
                    // Previous Button
                    Button(action: {
                        audioManager.playSoundEffect(named: "button_click")
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                            currentPage = max(0, currentPage - 1)
                        }
                    }) {
                        Image(systemName: "chevron.left.circle.fill")
                            .font(.system(size: 45))
                            .foregroundColor(currentPage > 0 ? .white : .white.opacity(0.3))
                            .shadow(color: .black.opacity(0.5), radius: 5)
                    }
                    .disabled(currentPage == 0)
                    
                    // Next/Close Button
                    Button(action: {
                        audioManager.playSoundEffect(named: "button_click")
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                            if currentPage < features.count - 1 {
                                currentPage += 1
                            } else {
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                    }) {
                        ZStack {
                            Circle()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            features[currentPage].themeColor,
                                            features[currentPage].themeColor.opacity(0.8)
                                        ]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 65, height: 65)
                                .shadow(color: .black.opacity(0.4), radius: 8, x: 0, y: 4)
                            
                            Image(systemName: currentPage < features.count - 1 ? "chevron.right" : "play.fill")
                                .font(.system(size: 26, weight: .bold))
                                .foregroundColor(.white)
                                .shadow(color: .black.opacity(0.3), radius: 2)
                        }
                    }
                }
                .padding(.top, 25)
                .padding(.bottom, 40)
                
                Spacer()
            }
        }
    }
}

// MARK: - Updated Custom Drawings with neutral terms
struct CarrotCollectionDrawing: View {
    @State private var rewardScale: [CGFloat] = [1.0, 1.0, 1.0]
    
    var body: some View {
        ZStack {
            // Background
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.orange.opacity(0.2))
                .frame(width: 220, height: 100)
            
            HStack(spacing: 30) {
                ForEach(0..<3, id: \.self) { index in
                    VStack(spacing: 5) {
                        Image("carrot")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .scaleEffect(rewardScale[index])
                            .onAppear {
                                withAnimation(
                                    Animation.easeInOut(duration: 0.6)
                                        .repeatForever()
                                        .delay(Double(index) * 0.2)
                                ) {
                                    rewardScale[index] = 1.2
                                }
                            }
                        
                        Text("+10")
                            .font(.system(size: 12, weight: .bold, design: .rounded))
                            .foregroundColor(.yellow)
                    }
                }
            }
            
            // Character collecting
            Image("rabbit")
                .resizable()
                .scaledToFit()
                .frame(width: 45, height: 45)
                .offset(x: -80, y: 10)
        }
    }
}

struct BullObstacleDrawing: View {
    @State private var obstacleOffset: CGFloat = -80
    
    var body: some View {
        ZStack {
            // Background with alert stripes
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.red.opacity(0.3),
                            Color.orange.opacity(0.2)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 220, height: 100)
            
            HStack(spacing: 60) {
                // Moving obstacle
                Image("bull")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .offset(x: obstacleOffset)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 2.0).repeatForever()) {
                            obstacleOffset = 80
                        }
                    }
                
                // Character navigating
                Image("rabbit")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .offset(x: -30)
            }
            
            // Alert icon
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.title2)
                .foregroundColor(.red)
                .offset(y: -35)
        }
    }
}

struct FarmerObstacleDrawing: View {
    @State private var patrolScale: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            // Background
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.green.opacity(0.2))
                .frame(width: 220, height: 100)
            
            HStack(spacing: 50) {
                // Patrolling element
                Image("farmer")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .scaleEffect(patrolScale)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 1.0).repeatForever()) {
                            patrolScale = 1.1
                        }
                    }
                
                // Character maneuvering
                Image("rabbit")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .opacity(0.7)
            }
            
            // Observation indicators
            HStack(spacing: 40) {
                ForEach(0..<2, id: \.self) { _ in
                    Circle()
                        .fill(Color.blue.opacity(0.6))
                        .frame(width: 8, height: 8)
                }
            }
            .offset(y: -25)
        }
    }
}

struct HeartSystemDrawing: View {
    @State private var progressPulse: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            // Background
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.pink.opacity(0.2))
                .frame(width: 220, height: 100)
            
            HStack(spacing: 15) {
                ForEach(0..<3, id: \.self) { index in
                    VStack(spacing: 5) {
                        Image(systemName: "circle.fill")
                            .font(.title2)
                            .foregroundColor(index == 0 ? .green : .gray)
                            .scaleEffect(index == 0 ? progressPulse : 1.0)
                        
                        if index == 0 {
                            Text("Active")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(.white)
                        } else {
                            Text("Used")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            
            // Animate the first progress indicator
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 0.8).repeatForever()) {
                    progressPulse = 1.2
                }
            }
            
            // Progress impact indicator
            VStack {
                Spacer()
                HStack {
                    Text("-1")
                        .font(.system(size: 16, weight: .black, design: .rounded))
                        .foregroundColor(.red)
                        .padding(5)
                        .background(Color.white.opacity(0.3))
                        .cornerRadius(5)
                    Spacer()
                }
                .offset(x: 20, y: 20)
            }
        }
    }
}
