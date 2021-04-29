//
//  LottieView.swift
//  Amazing.ca
//
//  Created by Djallil Elkebir on 2021-04-28.
//

import SwiftUI
import Lottie

struct LottieCartView: UIViewRepresentable {
    
    var animationView = AnimationView()
    
    func makeUIView(context: UIViewRepresentableContext<LottieCartView>) -> UIView {
        let view = UIView(frame: .zero)
        
        animationView.animation = Animation.named("cart")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([ animationView.heightAnchor.constraint(equalTo: view.heightAnchor), animationView.widthAnchor.constraint(equalTo: view.widthAnchor)])
        return view
    }
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieCartView>) {
        
    }
}
