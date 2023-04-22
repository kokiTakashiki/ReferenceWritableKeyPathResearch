//
//  SixthView.swift
//  ReferenceWritableKeyPathResearch
//
//  Created by 武田孝騎 on 2023/04/22.
//

import SwiftUI
import Combine

struct SixthView: View {
    @ObservedObject var object = SixthTestObject()
    
    var body: some View {
        Text(self.object.text)
            .onAppear {
                // wrappedValueに値を代入するとReferenceWritableKeyPathが生成され、deinitしてもそのReferenceWritableKeyPathは残る。
                //self.object.text = "test test"
                // assign(to:)を利用してdeinitしてもReferenceWritableKeyPathが生成され、残る。
                Just("test test").assign(to: &self.object.$text)
                // 値を変更しなくてもReferenceWritableKeyPathが生成される。
            }
    }
}

struct SixthView_Previews: PreviewProvider {
    static var previews: some View {
        SixthView()
    }
}
