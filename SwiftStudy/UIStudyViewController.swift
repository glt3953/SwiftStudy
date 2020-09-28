//
//  UIStudyViewController.swift
//  SwiftStudy（Swift 教程 https://www.runoob.com/swift/swift-tutorial.html）
//  https://developer.apple.com/swift/
//
//  Created by guoliting on 2019/8/27.
//  Copyright © 2019 guoliting. All rights reserved.
//

import UIKit

//自定义中缀运算符
infix operator ++
func ++(param1:Int, param2:Int)->Int {
    return param1*param1 + param2*param2
}
//自定义后缀运算符
postfix operator ++
postfix func ++(param1:Int)->Int {
    return param1+param1
}

class UIStudyViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UISearchBarDelegate {
    
    @objc func touchBegin() {
        print("用户点击了按钮")
    }
    
    func labelStudy() {
        let label = UILabel(frame: CGRect(x: 20, y: 44+20, width: 200, height: 30))
        label.text = "我是一个普通的便签控件"
        self.view.addSubview(label)
        
        let label2 = UILabel(frame: CGRect(x: 20, y: 44+60, width: 260, height: 30))
        label2.text = "我是一个自定义的便签控件"
        label2.font = UIFont.boldSystemFont(ofSize: 20)
        label2.textColor = UIColor.red
        label2.shadowColor = UIColor.green
        label2.shadowOffset = CGSize(width: 2, height: 2)
        label2.textAlignment = NSTextAlignment.center
        self.view.addSubview(label2)
        
        let label3 = UILabel(frame: CGRect(x: 20, y: 44+110, width: 200, height: 150))
        label3.text = "我是长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长长文本"
        label3.numberOfLines = 7
        self.view.addSubview(label3)
        
        let label4 = UILabel(frame: CGRect(x: 20, y: 44+280, width: 200, height: 150))
        let attri = NSMutableAttributedString(string: "我是个性化文本")
        attri.addAttributes([NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20), NSAttributedString.Key.foregroundColor:UIColor.red], range: NSRange(location: 0, length: 2))
        attri.addAttributes([NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 13), NSAttributedString.Key.foregroundColor:UIColor.blue], range: NSRange(location: 3, length: 3))
        label4.attributedText = attri
        self.view.addSubview(label4)
    }
    
    func buttonStudy() {
        let buttonOne = UIButton(type: UIButton.ButtonType.custom)
        buttonOne.frame = CGRect(x: 20, y: 44+20, width: 100, height: 30)
        buttonOne.backgroundColor = UIColor.purple
        buttonOne.setTitle("标题", for: UIControl.State.normal)
        buttonOne.setTitleColor(UIColor.white, for: UIControl.State.normal)
        buttonOne.setImage(UIImage(named: "image"), for: UIControl.State.normal)
        buttonOne.titleEdgeInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 20)
        buttonOne.imageEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 30, right: 0)
        buttonOne.setBackgroundImage(UIImage(named: "image"), for: UIControl.State.normal)
        buttonOne.addTarget(self, action: #selector(touchBegin), for: UIControl.Event.touchUpInside)
        self.view.addSubview(buttonOne)
    }
    
    func imageViewStudy() {
        let image = UIImage(named: "IMG_6521")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 30, y: 44+30, width: 300, height: 200)
        self.view .addSubview(imageView)
        let size = image?.size
        let image2 = UIImage(contentsOfFile: "filePath")
        let image3 = UIImage(data: Data())
        
        //创建一个数组 用于存放动画图片
        var imageArry = Array<UIImage>()
        //进行图片的循环创建
        for index in 1...8{
            //使用格式化的字符串进行创建
            let birdImage = UIImage(named: "bird\(index)")
            //将创建的图片添加进数组中
            imageArry.append(birdImage!)
        }
        //创建UIImageView
        let birdImageView = UIImageView(frame: CGRect(x: 30, y: 44+250, width: 200, height: 100))
        //设置动画数组
        birdImageView.animationImages = imageArry
        //设置动画播放时长
        birdImageView.animationDuration = 0.5
        //设置动画播放次数
        birdImageView.animationRepeatCount = 0
        self.view.addSubview(birdImageView)
        //开始播放动画
        birdImageView.startAnimating()
    }
    
    func textFieldStudy() {
        let textField = UITextField(frame: CGRect(x: 20, y: 44+30, width: 200, height: 30))
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.textColor = UIColor.red
        textField.textAlignment = NSTextAlignment.center
        textField.placeholder = "请输入11位数字"
        self.view.addSubview(textField)
        
        //创建左视图
        let imageView1 = UIImageView(image: UIImage(named: "bird1"))
        imageView1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        //创建右视图
        let imageView2 = UIImageView(image: UIImage(named: "bird1"))
        imageView2.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        textField.leftView = imageView1
        textField.rightView = imageView2
        textField.leftViewMode = UITextField.ViewMode.always
        textField.rightViewMode = UITextField.ViewMode.always
        
        textField.delegate = self
        textField.clearButtonMode = UITextField.ViewMode.always
    }
    
    //这个方法在输入框即将进入编辑状态时被调用
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    //这个方法在输入框已经开始编辑时被调用
    func textFieldDidBeginEditing(_ textField: UITextField){
        
    }
    //这个方法在输入框即将结束编辑时被调用
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool{
        return true
    }
    //这个方法在输入框已经结束编辑时被调用
    func textFieldDidEndEditing(_ textField: UITextField){
        
    }
    //这个方法在输入框中文本发生变化时被调用
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        //如果输入框中的文字已经等于11位 则不允许再输入
        if (textField.text?.count)! >= 11 {
            return false
        }
        //只有0-9之间的数字可以输入
        if string.first!>="0" && string.first!<="9" {
            return true
        }else{
            return false
        }
        
    }
    //这个方法用户点击输入框中清除按钮会被调用
    func textFieldShouldClear(_ textField: UITextField) -> Bool{
        return true
    }
    //这个方法用户点击键盘上Return按钮会被调用
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    func switchStudy() {
        let swi = UISwitch()
        swi.center = CGPoint(x: 100, y: 100)
        swi.onTintColor = UIColor.green
        swi.tintColor = UIColor.red
        swi.thumbTintColor = UIColor.purple
        swi.isOn = true
        swi.addTarget(self, action: #selector(switchChange), for: UIControl.Event.valueChanged)
        self.view.addSubview(swi)
    }
    
    @objc func switchChange(swi:UISwitch) {
        print("开关状态：\(swi.isOn)")
    }
    
    func pageControlStudy() {
        let pageControl = UIPageControl(frame: CGRect(x: 20, y: 100, width: 280, height: 30))
        pageControl.numberOfPages = 10
        pageControl.backgroundColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.blue
        pageControl.currentPage = 3
        pageControl.addTarget(self, action: #selector(pageControlChange), for: UIControl.Event.valueChanged)
        self.view.addSubview(pageControl)
    }
    
    @objc func pageControlChange(pageControl:UIPageControl) {
        print("当前所在页码：\(pageControl.currentPage)")
    }
    
    func segmentedControlStudy() {
        let segmentedControl = UISegmentedControl(items: ["按钮1", "按钮2", "按钮3", "按钮4"])
        segmentedControl.frame = CGRect(x: 100, y: 100, width: 200, height: 30)
        segmentedControl.tintColor = UIColor.blue
        segmentedControl.addTarget(self, action: #selector(segmentedControlSelect), for: UIControl.Event.valueChanged)
        segmentedControl.apportionsSegmentWidthsByContent = true
        self.view.addSubview(segmentedControl)
    }
    
    @objc func segmentedControlSelect(segmentedControl:UISegmentedControl) {
        segmentedControl.insertSegment(withTitle: "新按钮", at: 0, animated: true)
        segmentedControl.insertSegment(with: UIImage(named: "bird1")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), at: 4, animated: true)
        print("选择了\(segmentedControl.selectedSegmentIndex)")
        segmentedControl.removeSegment(at: 1, animated: true)
        segmentedControl.setImage(UIImage(named: "bird1")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), forSegmentAt: 2)
        segmentedControl.setTitle("new", forSegmentAt: 3)
        segmentedControl.setWidth(80, forSegmentAt: 0)
    }
    
    func sliderStudy() {
        let slider = UISlider(frame: CGRect(x: 20, y: 100, width: 280, height: 30))
        slider.maximumValue = 10
        slider.minimumValue = 0
        slider.value = 5
        slider.minimumTrackTintColor = UIColor.red
        slider.maximumTrackTintColor = UIColor.green
        slider.thumbTintColor = UIColor.blue
//        slider.setThumbImage(UIImage(named: "bird1"), for: UIControl.State.normal)
//        slider.setMinimumTrackImage(UIImage(named: "bird2"), for: UIControl.State.normal)
//        slider.setMaximumTrackImage(UIImage(named: "bird3"), for: UIControl.State.normal)
        slider.isContinuous = false  //只在拖拽动作结束后再触发用户交互的事件
        slider.addTarget(self, action: #selector(sliderChange), for: UIControl.Event.valueChanged)
        self.view.addSubview(slider)
    }
    
    @objc func sliderChange(slider:UISlider) {
        print("slider值：\(slider.value)")
    }
    
    func activityIndicatorStudy() {
        self.view.backgroundColor = UIColor.red
        let activity = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        activity.center = self.view.center
        activity.startAnimating()
        activity.color = UIColor.green
        self.view.addSubview(activity)
    }
    
    func progressViewStudy() {
        let progressView = UIProgressView(progressViewStyle: UIProgressView.Style.default)
        progressView.frame = CGRect(x: 20, y: 100, width: 280, height: 10)
        progressView.progress = 0.3
        progressView.progressTintColor = UIColor.green
//        progressView.progressImage = UIImage(named: "bird1")
        progressView.trackTintColor = UIColor.red
        self.view.addSubview(progressView)
    }
    
    func stepperStudy() {
        let stepper = UIStepper(frame: CGRect(x: 100, y: 100, width: 0, height: 0))
        stepper.tintColor = UIColor.red
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.stepValue = 1
        stepper.isContinuous = false
        stepper.wraps = true
        stepper.addTarget(self, action: #selector(stepperClick), for: UIControl.Event.valueChanged)
        self.view.addSubview(stepper)
    }
    
    @objc func stepperClick(stepper:UIStepper) {
        print("步进控制器的值：\(stepper.value)")
    }
    
    func pickerViewStudy() {
        let pickerView = UIPickerView(frame: CGRect(x: 20, y: 100, width: 280, height: 200))
        pickerView.delegate = self
        pickerView.dataSource = self
        self.view.addSubview(pickerView)
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 8
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "第\(component+1)组第\(row)行"
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attri = NSMutableAttributedString(string: "第\(component+1)组第\(row)行")
        attri.addAttributes([NSAttributedString.Key.foregroundColor:UIColor.red], range: NSRange(location: 0, length: attri.length))
        
        return attri
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let rowImage = UIImage(named: "bird\(row+1)")
        let view = UIImageView(image: rowImage)
//        view.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: rowImage!.size)
        view.frame = CGRect(x: 0, y: 0, width: 110, height: 30)
        
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("用户选择了\(component)组\(row)行")
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 0 {
            return 180
        } else {
            return 100
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 20
    }
    
    func datePickerStudy() {
        let datePicker = UIDatePicker(frame: CGRect(x: 20, y: 100, width: 280, height: 200))
        datePicker.datePickerMode = UIDatePicker.Mode.countDownTimer
        datePicker.addTarget(self, action: #selector(datePickerSelect), for: UIControl.Event.valueChanged)
        self.view.addSubview(datePicker)
    }
    
    @objc func datePickerSelect(datePicker:UIDatePicker) {
        let date = datePicker.date
        let time = datePicker.countDownDuration
        print(date, time)
    }
    
    func searchBarStudy() {
        let searchBar = UISearchBar(frame: CGRect(x: 20, y: 100, width: 280, height: 150))
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        searchBar.barTintColor = UIColor.red
        searchBar.placeholder = "请输入要搜索的文字"
//        searchBar.prompt = "搜索"
        searchBar.showsCancelButton = true
        searchBar.showsBookmarkButton = true
        searchBar.showsSearchResultsButton = true
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["女鞋", "男鞋", "女装", "男装", "童装"]
        searchBar.selectedScopeButtonIndex = 0
        searchBar.delegate = self
        self.view.addSubview(searchBar)
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.searchBarStudy()
        return
        
        var a1 = UInt8.max
        print(a1)
        var a2 = UInt.max
        print(a2)
        var a3 = MemoryLayout<UInt>.size
        print(a3)
        var a4 = UInt64.max
        print(a4)
        var a5 = Int.max
        print(a5)
        var a6 = Int.min
        print(a6)
        
        print("Hello, World!")

        var str = "Hello, playground"
        str = str + " Test"
        print(str)

        //声明3个Int类型的变量
        var one, two, three:Int
        
        let occ = OCClass();
        occ.ocInstanceMethod();
        OCClass.ocClassMethod();
        
        var index = 10
        
        while index < 20
        {
            print( "index 的值为 \(index)")
            index = index + 1
        }
        
        switch index {
        case 100  :
            print("index 的值为 100")
            fallthrough //如果使用了fallthrough 语句，则会继续执行之后的 case 或 default 语句，不论条件是否满足都会执行。
        case 10,15  :
            print("index 的值为 10 或 15")
            fallthrough
        case 5  :
            print("index 的值为 5")
            fallthrough
        default :
            print("默认 case")
        }
        
        print("闭区间运算符:")
        for index in 1...5 {
            print("\(index) * 5 = \(index * 5)")
        }
        
        print("半开区间运算符:")
        for index in 1..<5 {
            print("\(index) * 5 = \(index * 5)")
        }
        
        let A = 60  // 二进制为 0011 1100
        let B = 13 // 二进制为 0000 1101
        print("A&B 结果为：\(A&B)")
        print("A|B 结果为：\(A|B)")
        print("A^B 结果为：\(A^B)")
        print("~A 结果为：\(~A)")
        //现在计算机普遍使用补码表示负数。知道一个数的补码，要求其值的方法是：首先看符号位也就是最左的一位，如果是1代表是负数(-)如果是0代码是正数(+)，然后对该值取反再+1，得到其源码。例如本例中得到的 1111 1111 1111 1111 1111 1111 1111 1010，其符号位（最左一位）是1，表明它表示的是负数，欲求其源码，需先对其取反，然后再加1：0000 0000 0000 0000 0000 0000 0000 0101 + 1 = 0000 0000 0000 0000 0000 0000 0000 0110，然后在得到的源码前加一个负号，即-0000 0000 0000 0000 0000 0000 0000 0110 = -6。以上便是对~按位取反运算以及负数的二进制表示的理解，不难发现，在求源码的时候，要将补码进行取反后再加1，然而这个补码原本就是之前由~运算时，对原来的操作数通过~按位取反而得来的，所以，此时在求该补码的源码时的取反操作，相当于将补码变回了原来的那个操作数，之后进行的加1操作就相当于对原来的操作数进行加1，只不过结果变成了他的相反数。因此，可以总结出~按位取反的计算结论是：~n = -(n+1)
        
        let stringL = "Hello\tWorld\n\n菜鸟教程官网：\'http://www.runoob.com\'"
        print(stringL)
        
        let myString:String?
        myString = "a"
        if let yourString = myString {
            print("你的字符串值为 - \(yourString)")
        } else {
            print("你的字符串没有值")
        }
        if myString != nil {
            print(myString!) //强制解析：myString!
        } else {
            print("字符串为 nil")
        }
        
        var optionalInteger: Int?
//        var optionalInteger: Optional<Int>
        optionalInteger = 42
        
        var name = "菜鸟教程"
        let site = "http://www.runoob.com"
        print("\(name)的官网地址为：\(site)")
        
        let varB:Float
        varB = 3.14159
        print(varB)
        
        typealias Feet = Int
        let distance: Feet = 100
        print(distance)
        
        let theInput = readLine()
        
        var a = 1 + 2
        for x in 0...10 {
            print("\(x) ", terminator:"")
        }
        print()
        
        index = 15
        
        repeat {
            print( "index 的值为 \(index)")
            index = index + 1
        } while index < 20
//        while index < 20 {
//            print( "index 的值为 \(index)")
//            index = index + 1
//        }
        
        // 实例化 String 类来创建空字符串
        let stringB = String()
        
        if stringB.isEmpty {
            print( "stringB 是空的" )
        } else {
            print( "stringB 不是空的" )
        }
        
        // stringA 可被修改
        var stringA = "菜鸟教程："
        stringA += "http://www.runoob.com"
        print( stringA )
        
        // stringB 不能修改
//        let stringC = String("菜鸟教程：")
//        stringC += "http://www.runoob.com"
//        print( stringC )
        
        let varA   = 20
        let constA = 100
        let varC:Float = 20.0
        
        stringA = "\(varA) 乘于 \(constA) 等于 \(varC * 100)"
        print( stringA )
        
        stringA = "www.runoob.com"
        print( "\(stringA), 长度为 \(stringA.count)" )
        
        for ch in "Runoob" {
            print(ch)
        }
        
        var someInts = [Int]()
        
        someInts.append(20)
        someInts.append(30)
        someInts += [40]
        
        let someVar = someInts[0]
        print( "第一个元素的值 \(someVar)" )
        print( "第二个元素的值 \(someInts[1])" )
        print( "第三个元素的值 \(someInts[2])" )
        
        var someStrs = [String]()
        someStrs.append("Apple")
        someStrs.append("Amazon")
        someStrs.append("Runoob")
        someStrs += ["Google"]
        for item in someStrs {
            print(item)
        }
        for (index, item) in someStrs.enumerated() {
            print("在 index = \(index) 位置上的值为 \(item)")
        }
        
        let intsA = [Int](repeating: 2, count:2)
        let intsB = [Int](repeating: 1, count:3)
        let intsC = intsA + intsB
        for item in intsC {
            print(item)
        }
        
        var someDict:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
//        var oldVal = someDict.updateValue("One 新的值", forKey: 1) //updateValue(_:forKey:)方法返回旧的Optional值
        var oldVal = someDict[1]
        someDict[1] = "One 新的值"
        let someString = someDict[1]
//        var removedValue = someDict.removeValue(forKey: 2)
//        someDict[2] = nil
        print( "key = 1 旧的值 \(oldVal)" )
        print( "key = 1 的值为 \(someString)" )
//        print( "key = 2 的旧值为 \(removedValue)" )
        print( "key = 2 的值为 \(someDict[2])" )
        print( "key = 3 的值为 \(someDict[3])" )
        for (key, value) in someDict {
            print("字典 key \(key) -  字典 value \(value)")
        }
        for (key, value) in someDict.enumerated() {
            print("字典 key \(key) -  字典 (key, value) 对 \(value)")
        }
        let dictKeys = [Int](someDict.keys)
        let dictValues = [String](someDict.values)
        print("输出字典的键(key)")
        for (key) in dictKeys {
            print("\(key)")
        }
        print("输出字典的值(value)")
        for (value) in dictValues {
            print("\(value)")
        }
        
        var someDict1:[Int:String] = [1:"One", 2:"Two", 3:"Three"]
        var someDict2:[Int:String] = [4:"Four", 5:"Five"]
        print("someDict1 含有 \(someDict1.count) 个键值对")
        print("someDict2 含有 \(someDict2.count) 个键值对")
        
        var someDict3:[Int:String] = [Int:String]()
        print("someDict1 = \(someDict1.isEmpty)")
        print("someDict2 = \(someDict2.isEmpty)")
        print("someDict3 = \(someDict3.isEmpty)")
        
//        func runoob(site: String) -> String {
//            return (site)
//        }
//        print(runoob(site: "www.runoob.com"))
        
        func runoob(name: String, site: String) -> String {
            return name + site
        }
        print(runoob(name: "菜鸟教程：", site: "www.runoob.com"))
        print(runoob(name: "Google：", site: "www.google.com"))
        
        func sitename() -> String {
            return "菜鸟教程"
        }
        print(sitename())
        
//        //函数返回值类型可以是字符串，整型，浮点型等。元组与数组类似，不同的是，元组中的元素可以是任意类型，使用的是圆括号。
//        func minMax(array: [Int]) -> (min: Int, max: Int) {
//            var currentMin = array[0]
//            var currentMax = array[0]
//            for value in array[1..<array.count] {
//                if value < currentMin {
//                    currentMin = value
//                } else if value > currentMax {
//                    currentMax = value
//                }
//            }
//            return (currentMin, currentMax)
//        }
//        let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
//        print("最小值为 \(bounds.min) ，最大值为 \(bounds.max)")
        
        func minMax(array: [Int]) -> (min: Int, max: Int)? {
            if array.isEmpty {
                print("数组为空")
                return nil
            }
            var currentMin = array[0]
            var currentMax = array[0]
            for value in array[1..<array.count] {
                if value < currentMin {
                    currentMin = value
                } else if value > currentMax {
                    currentMax = value
                }
            }
            return (currentMin, currentMax)
        }
//        if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
        if let bounds = minMax(array: []) {
            print("最小值为 \(bounds.min)，组大值为 \(bounds.max)")
        }
        
        func runoob1(site: String) {
            print("菜鸟教程官网：\(site)")
        }
        runoob1(site: "http://www.runoob.com")
        
        func pow(firstArg a: Int, secondArg b: Int) -> Int {
            var res = a
            for _ in 1..<b {
                res = res * a
            }
            print(res)
            return res
        }
        pow(firstArg:5, secondArg:3)
        
        //可变参数可以接受零个或多个值。函数调用时，你可以用可变参数来指定函数参数，其数量是不确定的。可变参数通过在变量类型名后面加入（...）的方式来定义。
        func vari<N>(members: N...){
            for i in members {
                print(i)
            }
        }
        vari(members: 4,3,5)
        vari(members: 4.5, 3.1, 5.6)
        vari(members: "Google", "Baidu", "Runoob")
        
        func swapTwoInts(_ a: inout Int, _ b: inout Int) {
            let temporaryA = a
            a = b
            b = temporaryA
        }
        var x = 1
        var y = 5
        swapTwoInts(&x, &y)
        print("x 现在的值 \(x), y 现在的值 \(y)")
        
        func sum(a: Int, b: Int) -> Int {
            return a + b
        }
        var addition: (Int, Int) -> Int = sum
        print("输出结果: \(addition(40, 89))")
        
        func another(addition: (Int, Int) -> Int, a: Int, b: Int) {
            print("输出结果: \(addition(a, b))")
        }
        another(addition: sum, a: 10, b: 20)
        
        func calcDecrement(forDecrement total: Int) -> () -> Int {
            var overallDecrement = 0
            func decrementer() -> Int {
                overallDecrement -= total
                return overallDecrement
            }
            return decrementer
        }
        let decrem = calcDecrement(forDecrement: 30)
        print(decrem())
        
        var b3 = MemoryLayout<Float80>.size
        print(b3)
        var c = MemoryLayout<Double>.size
        print(c)
        
        var decimal = 1.25e3
        print(decimal)
        var hex = 0x1p3
        print(hex)
        
        var bool1 = true
        print(bool1)
        
        var pen:(name:String, price:Int) = ("钢笔", 2)
        print(pen.name, pen.price)
        var car:(String, Int) = ("奔驰", 2000000)
        print(car.0, car.1)
        var (theName, thePrice) = car
        print(theName, thePrice)
        
        var obj:String? = "HS"
        if let tmp = obj {
            print(tmp)
        } else {
            obj = "HS"
            print(obj!)
        }
        var obj1:Int? = 1
        var obj2:Int? = 2
        if let tmp1 = obj1, let tmp2 = obj2, tmp1 < tmp2 {
            print(tmp1, tmp2)
        }
        
        typealias Price = Int
        var penPrice:Price = 100
        
        str = String()
        str = String("hello")
        str = String(666)
        str = String(6.66)
        str = String("a")
        str = String(false)
        print(str)
        str = String(describing: (1, 1.0, true))
        str = String(format:"我是%@", "宁侠")
        str = String(describing: Int.self)  //通过类型来构造字符串”Int“
        print(str)
        var c1 = "Hello"
        var c2 = "World"
        var c3 = c1 + " " + c2
        print(c3)
        var d = "Hello \(123)"
        var d2 = "Hello \(c2)"
        print(d2)
        print(MemoryLayout<String>.size)
        print(MemoryLayout<Character>.size)
        var uni = "\u{21}"  //使用Unicode码来创建字符，Unicode码21代表的字符为！
        print(uni)
        var com1 = "30a"
        var com2 = "30b"
        if com1 < com2 {
            print("com1 比 com2 小")
        }
        var string = "Hello-Swift"
        var startIndex = string.startIndex
        var endIndex = string.endIndex
        var char = string[string.index(after: startIndex)]
        print(char)
        var char2 = string[string.index(before: string.endIndex)]
        print(char2)
        var subSring = string[startIndex...string.index(startIndex, offsetBy: 4)]
        print(subSring)
        print(subSring.uppercased())
        var subString2 = string[string.index(endIndex, offsetBy: -5)..<endIndex]
        subString2.removeAll()
        print(subString2)
        var array3 = [String](repeating: "Hello", count: 10)
        print(array3)
        var array4 = Array(repeating: 1, count: 10)
        print(array4)
        var array5 = [1,2,3] + [4,5,6]
        print(array5)
        let arrayLet = [5,6,7,8,9]
        for item in arrayLet.enumerated() {
            print(item)
        }
        let arrayLet2 = [(1,2), (2,3), (3,4)]
        for index in arrayLet2.indices {
            print(arrayLet2[index], separator:"")
        }
        var arraySort = [1,3,5,6,7]
        print(arraySort.sorted(by:>))
        print(arraySort.sorted(by:<))
        var set3:Set<Int> = [1,2,3,4]
        var set4:Set<Int> = [1,2,5,6]
        print(set3.intersection(set4))
        print(set3.symmetricDifference(set4))  //set3与set4的并集除去set3与set4的交集
        print(set3.union(set4))
        print(set3.subtracting(set4))  //set3除去set3与set4的交集
        var set7:Set = [1,2,3]
        var set8:Set = [1,2,3]
        print(set7.isSuperset(of: set8))  //超集
        print(set7.isStrictSuperset(of: set8))  //真超集
        for item in set7.enumerated() {
            print(item)
        }
        for index in set7.indices {
            print(set7[index])
        }
        for item in set7.sorted(by: >) {
            print(item)
        }
        var dic1 = [1:"1", 2:"2", 3:"3"]
        dic1.updateValue("0", forKey: 1)
        print(dic1)
        for item in dic1.keys {
            print(item)
        }
        for item in dic1.values {
            print(item)
        }
        for item in dic1 {
            print(item)
        }
        var stringOri2 = "swsvr!vrfe?123321!!你好?世界!"
        var stringRes2 = String()
        for index in stringOri2.indices {
            if stringOri2[index] != "?" && stringOri2[index] != "!" {
                stringRes2.append(stringOri2[index])
            }
        }
        print(stringRes2)
        var stringOri3 = "abcdefg"
        var index3 = stringOri3.endIndex
        print(index3)
        print(stringOri3.startIndex)
        var stringRes3 = String()
        while index3 > stringOri3.startIndex {
            index3 = stringOri3.index(before: index3)
            stringRes3.append(stringOri3[index3])
        }
        print(stringRes3)
        var stringOri5 = "abc中国abc美国abc英国~德国abc法国abc"
        var range5 = stringOri5.range(of: "abc")
        while range5 != nil {
            stringOri5.replaceSubrange(range5!, with: "Hello")
            range5 = stringOri5.range(of: "abc")
        }
        print(stringOri5)
        var dicOri4 = ["a":98, "b":86, "c":93]
        for item in dicOri4.sorted(by: {(stud1, stud2) -> Bool in
            return stud1.value > stud2.value
        }) {
            print(item)
        }
        //创建范围>=0且<=10的闭区间
        var range1 = 0...10
        print(range1)
        print(range1 ~= 8)
        //创建范围>=0且<10的半开区间
        var range2 = 0..<10
        print(range2)
        var tuple = (0,0)
        switch tuple {
        case (let a,1):
            print(a)
        case (let b,0) where b==0:
            print(b)
        case let(a,b) where a==b:
            print(a,b)
        case (0,1):
            print("Sure")
        case (_,1):  //选择性匹配
            print("Sim")
        case (0...3,0...3):  //元组元素的范围匹配
            print("SIM")
        default:
            print("")
        }
        MyLabel:for indexI in 0...2 {
            for indexJ in 0...2 {
                if indexI == 1 {
                    continue MyLabel
                }
                print("第\(indexI)\(indexJ)次循环")
            }
        }
        MyLabel:for indexI in 0...2 {
            for indexJ in 0...2 {
                if indexI == 1 {
                    break MyLabel
                }
                print("第\(indexI)\(indexJ)次循环")
            }
        }
        func myFuncTwo(param:Int) {
            guard param>0 else {
                return
            }
            print("其他操作")
        }
        //”水仙花数“：是指一个3位数，其各位数字的立方和等于该数本身
        for item in 100...999 {
            var dig = item%10
            var tens = item/10%10
            var hundred = item/100
            var sum = dig*dig*dig + tens*tens*tens + hundred*hundred*hundred
            if sum == item {
                print(item)
            }
        }
    //猴子吃桃问题：猴子第一天摘下若干个桃子，当即吃了一半，还不过瘾，又多吃了一个。第二天早上将剩下的桃子吃掉一半，又多吃了一个。以后每天早上都吃了前一天剩下的一半零一个。到第10天早上想再吃时，就只剩下一个桃子了。求第一天共摘了多少个桃子。
        var count = 1
        for day in 1...9 {
            count = (count+1)*2
        }
        print(count)
        func searchData (dataID:String)->(success:Bool, data:String) {
            let result = true
            let data = "数据实体"
            return (result, data)
        }
        if searchData(dataID: "1101").success {
            print(searchData(dataID: "1101").data)
        }
        func myFunc10(param:Int...){
            var sum = 0
            for count in param {
                sum += count
            }
            print(sum)
        }
        myFunc10(param: 1,2,3,4,5)
        myFunc10(param: 12,2,3)
        func myFunc11(param1:Int...,param2:String) {
            var sum = 0
            for count in param1 {
                sum += count
            }
            print("\(param2):\(sum)")
        }
        myFunc11(param1: 1,2,3, param2: "hello")
        //在函数内部修改参数变量的值
        func myFunc12(param:inout Int) {
            param += 1
        }
        var para = 10
        myFunc12(param: &para)
        print(para)
        var addFunc:(Int,Int)->Int
        func myFunc15() -> (Int,Int)->Int {
            return {(param1:Int, param2:Int) in
                return param1+param2
            }
        }
        addFunc = myFunc15()
        print(addFunc(1,2))
        let myClosures = {(param:Int)->Int in
            return param*param
        }
        print(myClosures(3))
        func mySort(array:inout Array<Any>, sortClosure:(Int,Int)->Bool) -> Array<Any> {
            for indexI in array.indices {
                if indexI == array.count-1 {
                    break
                }
                
                for indexJ in 0...((array.count-1)-indexI-1) {
                    if sortClosure(indexJ, indexJ+1) {
                        
                    } else {
                        array.swapAt(indexJ, indexJ+1)
                    }
                }
            }
            return array
        }
        var array:Array<Any> = [1,4,3,5,7,5,4,2,7]
//        mySort(array: &array, sortClosure: {(index:Int, nextIndex:Int) -> Bool in
//            return (array[index] as! Int) > (array[nextIndex] as! Int)
//        })
        print(array)
        a = 00001000
        print(a)
        print(~a)
        var b:UInt8 = 255
        b = b &+ 1  //支持溢出的加操作
        print(b)
        b = b &- 1
        print(b)
        b = b &* 2  //等同于左移一位
        print(b)
        print(5++4)
        print(5++)
        enum Shape {
            case circle(center:(Double,Double), radius:Double)
            case rect(center:(Double,Double), width:Double, height:Double)
            case triangle(point1:(Double,Double), point2:(Double,Double), point3:(Double,Double))
        }
        var circle = Shape.circle(center: (0,0), radius: 3)
        var rect = Shape.rect(center: (1,1), width: 10, height: 15)
        var triangle = Shape.triangle(point1: (2,2), point2: (3,3), point3: (2,5))
        func shapeFunc(param:Shape) {
            switch param {
            case let .circle(center, radius):
                print("此圆的圆心为：\(center), 半径为：\(radius)")
            case let .rect(center, width, height):
                print("此矩形的中心为：\(center), 宽为：\(width), 高为：\(height)")
            case let .triangle(point1, point2, point3):
                print("此三角形的3个顶点分别为：\(point1), \(point2), \(point3)")
            }
        }
        shapeFunc(param: circle)
        shapeFunc(param: rect)
        shapeFunc(param: triangle)
        class Work {
            var name:String
            init(name:String) {
                self.name = name
                print("完成了Work类实例的构造")
            }
        }
        class People {
            var age:Int
            lazy var work:Work = Work(name: "teacher")
            init(age:Int) {
                self.age = age
            }
        }
        let people = People(age:24)
        print(people.work)
        class Teacher {
            var name:String {
                willSet {
                    print("将要设置名字为：\(newValue)")
                }
                didSet {
                    print("旧的名字为：\(oldValue)")
                }
            }
            var age:Int
            init(name:String, age:Int) {
                self.age = age
                self.name = name
            }
        }
        let teacher = Teacher(name:"珲少", age:24)
        teacher.name = "Jaki"
        class MyArray {
            var array:Array<Array<Int>>
            init(param:Array<Int>...) {
                array = param
            }
            subscript(index1:Int, index2:Int)->Int {
                set {
                    array[index1][index2] = newValue
                }
                get {
                    let tmp = array[index1]
                    return tmp[index2]
                }
            }
        }
        let myArray = MyArray(param: [1,2,3], [3,4,5], [4,5,6], [6,7,8], [7,8,9])
        print(myArray[1,2])
        print(myArray[4,2])
        myArray[4,2] = 0
        print(myArray[4,2])
        class Temp {
            deinit {
                print("Temp 实例被销毁")
            }
        }
        var temp:Temp? = Temp()
        //当可选类型的类实例变量被赋值为nil时，实例会被释放
        temp = nil
        class ClassOne {
            deinit {
                print("ClassOne deinit")
            }
        }
        class ClassTwo {
            var cls:ClassOne?
            init(cls:ClassOne?) {
                self.cls = cls
            }
            deinit {
                print("ClassTwo deinit")
            }
        }
        var objARC:ClassOne? = ClassOne()
        var objARC2:ClassTwo? = ClassTwo(cls: objARC)
        objARC = nil
        objARC2 = nil
        class ClassThree {
            unowned var cls:ClassFour
            init(cls:ClassFour) {
                self.cls = cls
            }
            deinit {
                print("ClassThree deinit")
            }
        }
        class ClassFour {
            var cls:ClassThree!
            init() {
                cls = ClassThree(cls: self)
            }
            deinit {
                print("ClassFour deinit")
            }
        }
        var obj5:ClassFour? = ClassFour()
        obj5 = nil
        class MyClassSix {
            var name:String = "HS"
            lazy var closure:()->Void = {
                //使用捕获列表对闭包中使用到的self进行无主引用的转换
                [unowned self]()->Void in
                print(self.name)
            }
            deinit {
                print("ClassSix deinit")
            }
        }
//        var obj6:MyClassSix? = MyClassSix()
//        obj6?.closure
//        obj6 = nil
    }
}
