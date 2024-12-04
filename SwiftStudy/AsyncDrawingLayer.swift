//
//  AsyncDrawingLayer.swift
//  SwiftStudy
//
//  Created by 宁侠 on 2024/12/3.
//  Copyright © 2024 guoliting. All rights reserved.
//

import UIKit

class AsyncDrawingLayer: CALayer {

    override func draw(in ctx: CGContext) {
        super.draw(in: ctx)

        Task {
            // 在子线程中执行绘制操作
            await withCheckedContinuation { continuation in
                Task.detached {
                    // 执行绘制操作
                    ctx.setFillColor(UIColor.red.cgColor)
                    ctx.fill(self.bounds)

                    // 完成绘制操作后继续
                    continuation.resume()
                }
            }

            // 回到主线程更新 UI
            await MainActor.run {
                self.setNeedsDisplay() // 触发 draw(in:) 重新绘制
            }
        }
    }
}
