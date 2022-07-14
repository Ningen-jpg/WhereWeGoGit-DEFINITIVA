//
//  PlayerView.swift
//  WhereWeGoApptvOS
//
//  Created by Stefano Leva on 06/07/22.
//

import SwiftUI
import AVKit
import AVFoundation

struct PlayerView: UIViewRepresentable {
    var video: String
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }

        func makeUIView(context: Context) -> UIView {
            let newVideo = LoopingPlayerUIView(frame: .zero)
            newVideo.setVideo(video: video)
            return newVideo
        }
}

class LoopingPlayerUIView: UIView {
    
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    func setVideo(video: String){
        // Load the resource -> h
        let fileUrl = Bundle.main.url(forResource: video, withExtension: "mp4")!
        let asset = AVAsset(url: fileUrl)
        let item = AVPlayerItem(asset: asset)
        // Setup the player
        let player = AVQueuePlayer()
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        // Create a new player looper with the queue player and template item
        playerLooper = AVPlayerLooper(player: player, templateItem: item)
        // Start the movie
        player.play()
            
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(video: "Mare")
    }
}
