//
//  AppDelegate.swift
//  SwiftStudy
//
//  Created by guoliting on 2019/8/27.
//  Copyright © 2019 guoliting. All rights reserved.
//

import UIKit
import Foundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let memorySize = getPhysicalMemorySize()
        print("Total physical memory: \(memorySize / 1024 / 1024) MB")
        
        if let vmStats = getVMStatistics() {
            print("Free memory: \(vmStats.freeMemory / 1024 / 1024) MB")
            print("Used memory: \(vmStats.usedMemory / 1024 / 1024) MB")
        }
        
        if let availableMemory = getAvailableMemory() {
            print("Available memory: \(availableMemory / 1024 / 1024) MB")
        }
        
        return true
    }
    
    func getAvailableMemory() -> UInt64? {
        var vmStats = vm_statistics_data_t()
        var count = mach_msg_type_number_t(MemoryLayout<vm_statistics_data_t>.size) / 4
        var hostPort: mach_port_t = mach_host_self()

        let result = withUnsafeMutablePointer(to: &vmStats) { vmStatsPtr in
            vmStatsPtr.withMemoryRebound(to: integer_t.self, capacity: 1) { intPtr in
                host_statistics(hostPort, HOST_VM_INFO, intPtr, &count)
            }
        }

        if result == KERN_SUCCESS {
            let pageSize = vm_kernel_page_size
            let freeMemory = UInt64(vmStats.free_count) * UInt64(pageSize)
            let inactiveMemory = UInt64(vmStats.inactive_count) * UInt64(pageSize)
            return freeMemory + inactiveMemory
        } else {
            print("Failed to get VM statistics with error code \(result)")
            return nil
        }
    }
    
    func getVMStatistics() -> (freeMemory: UInt64, usedMemory: UInt64)? {
        var vmStats = vm_statistics_data_t()
        var count = mach_msg_type_number_t(MemoryLayout<vm_statistics_data_t>.size) / 4
        var hostPort: mach_port_t = mach_host_self()

        let result = withUnsafeMutablePointer(to: &vmStats) { vmStatsPtr in
            vmStatsPtr.withMemoryRebound(to: integer_t.self, capacity: 1) { intPtr in
                // 用于获取主机的统计信息。通过指定 `HOST_VM_INFO`，可以获取虚拟内存相关的数据。
                host_statistics(hostPort, HOST_VM_INFO, intPtr, &count)
            }
        }

        if result == KERN_SUCCESS {
            let pageSize = vm_kernel_page_size // 系统的页面大小（通常为 4096 字节）。
            let freeMemory = UInt64(vmStats.free_count) * UInt64(pageSize)
            let usedMemory = (UInt64(vmStats.active_count) + UInt64(vmStats.inactive_count) + UInt64(vmStats.wire_count)) * UInt64(pageSize)
            return (freeMemory, usedMemory)
        } else {
            print("Failed to get VM statistics with error code \(result)")
            return nil
        }
    }
    
    func getPhysicalMemorySize() -> UInt64 {
        let physicalMemory = ProcessInfo.processInfo.physicalMemory
        return physicalMemory
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

