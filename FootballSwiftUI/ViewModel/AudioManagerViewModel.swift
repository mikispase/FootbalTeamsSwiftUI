//
//  File.swift
//  FootballSwiftUI
//
//  Created by Dimitar Spasovski on 9/22/21.
//

import Foundation
import AVKit

class AudioManagerViewModel {
    
    private var player:AVAudioPlayer?
    
    func playback(_ team:Team){
        // if sound already stop it
        // if sound isn't then  paly it
        
        if team.isPlaying {
            player?.stop()
        }else {
            guard let path = Bundle.main.path(forResource: "\(team.id.chantFile).mp3", ofType: nil) else {
                return
            }
            
           let url =  URL(fileURLWithPath: path)
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player?.numberOfLoops = -1
                player?.play()
            }catch {
                debugPrint(error)
            }
            
          
            player?.play()
        }
        
    }
}
