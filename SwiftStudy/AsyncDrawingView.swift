//
//  AsyncDrawingView.swift
//  SwiftStudy
//
//  Created by 宁侠 on 2024/12/3.
//  Copyright © 2024 guoliting. All rights reserved.
//

import UIKit

class AsyncDrawingView: UIView {

    private var asyncImage: UIImage?

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        // 如果有异步绘制的图片，直接绘制它
        asyncImage?.draw(in: rect)
    }

    func drawAsync() {
        Task {
            // 创建图形上下文
            let size = self.bounds.size
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            guard let context = UIGraphicsGetCurrentContext() else { return }

            // 进行绘制操作
            context.setFillColor(UIColor.blue.cgColor)
            context.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))

            // 获取绘制结果
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            // 更新 UI，回到主线程
            await MainActor.run {
                self.asyncImage = image
                self.setNeedsDisplay() // 触发 draw(_:) 方法重新绘制
            }
        }
    }
}
