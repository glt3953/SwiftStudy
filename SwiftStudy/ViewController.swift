//
//  ViewController.swift
//  SwiftStudy（Swift 教程 https://www.runoob.com/swift/swift-tutorial.html）
//  https://developer.apple.com/swift/
//
//  Created by guoliting on 2019/8/27.
//  Copyright © 2019 guoliting. All rights reserved.
//

import UIKit
import ImageIO
import CoreData

class ViewController: UIViewController, ViewControllerTwoProtocol {
    var animationView: UIView?
    let urlString = "http://api.tianapi.com/txapi/wxhottopic/?key=897c62d4673212f094b5eeda5066853e&num=1" //http://api.tianapi.com/txapi/userinfo/?key=897c62d4673212f094b5eeda5066853e&apiid=1
    let apikey = "897c62d4673212f094b5eeda5066853e"
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        let barItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(doneClick))
        self.navigationItem.leftBarButtonItem = barItem
        self.tabBarItem.title = "首页"
        //        self.tabBarItem.image = UIImage(named: "bird1")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        //        self.tabBarItem.selectedImage = UIImage(named: "bird2")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        self.view.backgroundColor = UIColor.white
        
        let modelURL = Bundle.main.url(forResource: "Class", withExtension: "momd")
        let modelManager = NSManagedObjectModel(contentsOf: modelURL!) //数据模型管理类
        let store = NSPersistentStoreCoordinator(managedObjectModel: modelManager!) //数据库与数据模型之间的链接类，将数据模型创建的数据映射为数据库中的数据
        let sqlitePath = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/.SchoolSQL.sqlite")
        print(sqlitePath)
        try! store.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: sqlitePath, options: nil)
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType) //核心的数据管理类，进行数据的相关操作
        context.persistentStoreCoordinator = store
        let schoolClass:SchoolClass = NSEntityDescription.insertNewObject(forEntityName: "SchoolClass", into: context) as! SchoolClass //将实体类进行实体化
        schoolClass.name = "三年二班"
        schoolClass.studentCount = 60
        let student:Student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        student.name = "NingXia"
        student.age = 30
        schoolClass.monitor = student
        if ((try? context.save()) != nil) {
            print("新增数据成功")
        }
        //创建查询请求
        let fetchRequest = NSFetchRequest<SchoolClass>(entityName: "SchoolClass")
        fetchRequest.predicate = NSPredicate(format: "studentCount == 60")
        let result:NSAsynchronousFetchResult<SchoolClass> = try! context.execute(fetchRequest) as! NSAsynchronousFetchResult<SchoolClass>
        print(result.finalResult?.first?.name)
        
        ObjectiveC_Hander.runNormalSql("create table Student(name text PRIMARY KEY, age integer DEFAULT 15)")
        ObjectiveC_Hander.runNormalSql("insert into Student(name, age) values (\"宁侠\", 25)")
        
        let homeDicPath = NSHomeDirectory()
        let filePath = homeDicPath + "/archiver.file"
        let people = People()
        people.name = "NingXia"
        people.age = 30
        NSKeyedArchiver.archiveRootObject(people, toFile: filePath)
        let getPeople = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as! People
        print("\(getPeople.name):\(getPeople.age)")
//        let mutableData = NSMutableData()
//        let archiver = NSKeyedArchiver(forWritingWith: mutableData)
//        archiver.encode(30, forKey: "age")
//        archiver.encode("NingXia", forKey: "name")
//        archiver.finishEncoding()
//        mutableData.write(toFile: filePath, atomically: true)
//        let data = try? Data(contentsOf: URL(fileURLWithPath: filePath))
//        let unArchiver = NSKeyedUnarchiver(forReadingWith: data!)
//        let age = unArchiver.decodeInt32(forKey: "age")
//        let name = unArchiver.decodeObject(forKey: "name")
//        print("\(name):\(age)")
//        NSKeyedArchiver.archiveRootObject("NingXia", toFile: filePath)
//        let name = NSKeyedUnarchiver.unarchiveObject(withFile: filePath)
//        print(name ?? "name为nil")
        
//        let plistPath = Bundle.main.path(forResource: "NewPlist", ofType: "plist")
//        let dic = NSDictionary(contentsOfFile: plistPath!)
//        print(dic ?? "dic为nil")
        let plistPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
        let fileName = plistPath! + "/MyPlist.plist"
        let dic:NSDictionary = ["name":"NingXia", "age":"29"]
        dic.write(toFile: fileName, atomically: true)
        let dicRes = NSDictionary(contentsOfFile: fileName)
        print(dicRes ?? "dicRes为nil")
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(URL(string: "http://www.baidu.com"), forKey:"urlKey")
        userDefaults.set("stringValue", forKey: "stringKey")
        userDefaults.set(true, forKey: "boolKey")
        userDefaults.set(Double(0.1), forKey: "doubleKey")
        userDefaults.set(Float(1.5), forKey: "floatKey")
        userDefaults.set(5, forKey: "intKey")
        userDefaults.set(["1":"一"], forKey: "dicKey")
        userDefaults.set([1, 2, 3, 4], forKey: "arrKey")
        userDefaults.set(Data(), forKey: "dataKey")
        userDefaults.synchronize()
        userDefaults.removeObject(forKey: "urlKey")
        print(userDefaults.url(forKey: "urlKey") ?? "无url")
        print(userDefaults.string(forKey: "stringKey"))
        print(userDefaults.bool(forKey: "boolKey"))
        print(userDefaults.double(forKey: "doubleKey"))
        print(userDefaults.float(forKey: "floatKey"))
        print(userDefaults.integer(forKey: "intKey"))
        print(userDefaults.dictionary(forKey: "dicKey"))
        print(userDefaults.array(forKey: "arrKey"))
        print(userDefaults.data(forKey: "dataKey"))
        
        
        let config = URLSessionConfiguration.default
        let url = URL(string: String(format: urlString, apikey))
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (data, response, error) in
            let dictionary = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
            print(dictionary ?? "未解析到数据")
        }
        task.resume()
        
        //粒子效果
        self.view.backgroundColor = UIColor.black
        let fireEmitter = CAEmitterLayer()
        fireEmitter.emitterPosition = CGPoint(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height-50)
        fireEmitter.emitterSize = CGSize(width: self.view.bounds.size.width-100, height: 20)
        fireEmitter.renderMode = CAEmitterLayerRenderMode.additive //粒子的渲染模式为混合渲染
        let fireCell = CAEmitterCell()
        fireCell.birthRate = 1500
        fireCell.lifetime = 3.0
        fireCell.lifetimeRange = 1.5
        fireCell.color = UIColor(red: 0.8, green: 0.4, blue: 0.2, alpha: 0.1).cgColor
        fireCell.contents = UIImage(named: "emtter")?.cgImage
        fireCell.velocity = 120 //粒子运动速度为120
        fireCell.velocityRange = 60 //粒子运动速度随机范围为60
        fireCell.emissionLongitude = CGFloat(Double.pi + Double.pi/2) //粒子在x-y平面的发射角度
        fireCell.emissionRange = CGFloat(Double.pi/2) //粒子发射角度的随机范围
        fireCell.scaleSpeed = 0.5 //粒子的缩放速率
        fireCell.spin = 0.2 //粒子的旋转
        let smokeCell = CAEmitterCell()
        smokeCell.birthRate = 1000
        smokeCell.lifetime = 4.0
        smokeCell.lifetimeRange = 1.5
        smokeCell.color = UIColor(red: 1, green: 1, blue: 1, alpha: 0.05).cgColor
        smokeCell.contents = UIImage(named: "emtter")?.cgImage
        smokeCell.velocity = 200
        smokeCell.velocity = 100
        smokeCell.emissionLongitude = CGFloat(Double.pi+Double.pi/2)
        smokeCell.emissionRange = CGFloat(Double.pi/2)
        fireEmitter.emitterCells = [fireCell, smokeCell]
        self.view.layer.addSublayer(fireEmitter)
        return
        
        let buttonOne = UIButton(type: UIButton.ButtonType.custom)
        buttonOne.frame = CGRect(x: 20, y: 44+60, width: 100, height: 30)
        buttonOne.backgroundColor = UIColor.purple
        buttonOne.setTitle("跳转", for: UIControl.State.normal)
        buttonOne.setTitleColor(UIColor.white, for: UIControl.State.normal)
//        buttonOne.setBackgroundImage(UIImage(named: "bird1"), for: UIControl.State.normal)
        buttonOne.addTarget(self, action: #selector(buttonClick), for: UIControl.Event.touchUpInside)
        self.view.addSubview(buttonOne)
        
        let buttonAlert = UIButton(type: UIButton.ButtonType.custom)
        buttonAlert.frame = CGRect(x: 20, y: 44+100, width: 100, height: 30)
        buttonAlert.backgroundColor = UIColor.purple
        buttonAlert.setTitle("警告框弹窗", for: UIControl.State.normal)
        buttonAlert.setTitleColor(UIColor.white, for: UIControl.State.normal)
//        buttonOne.setBackgroundImage(UIImage(named: "bird1"), for: UIControl.State.normal)
        buttonAlert.addTarget(self, action: #selector(buttonAlertClick), for: UIControl.Event.touchUpInside)
        self.view.addSubview(buttonAlert)
        
        let buttonSheet = UIButton(type: UIButton.ButtonType.custom)
        buttonSheet.frame = CGRect(x: 20, y: 44+140, width: 100, height: 30)
        buttonSheet.backgroundColor = UIColor.purple
        buttonSheet.setTitle("抽屉弹窗", for: UIControl.State.normal)
        buttonSheet.setTitleColor(UIColor.white, for: UIControl.State.normal)
//        buttonOne.setBackgroundImage(UIImage(named: "bird1"), for: UIControl.State.normal)
        buttonSheet.addTarget(self, action: #selector(buttonSheetClick), for: UIControl.Event.touchUpInside)
        self.view.addSubview(buttonSheet)
        
//        animationView = UIView(frame: CGRect(x: 20, y: 250, width: 100, height: 100))
//        animationView?.backgroundColor = UIColor.red
//        self.view.addSubview(animationView!)
        
//        let imageView = UIImageView(frame: CGRect(x: 20, y: 250, width: 200, height: 200))
//        self.view.addSubview(imageView)
//        self.playGIFOnImageView(name: "animation", imageView: imageView)
        let webView = UIWebView(frame: CGRect(x: 20, y: 250, width: 200, height: 200))
        self.view.addSubview(webView)
        self.playGIFOnWebView(name: "animation", webView: webView)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.bounds = CGRect(x: 0, y: 460, width: 100, height: 100)
        gradientLayer.position = CGPoint(x: 300, y: 100)
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor]
        gradientLayer.locations = [NSNumber(value: 0.2), NSNumber(value: 0.5), NSNumber(value: 0.7)]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0) //CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1) //CGPoint(x: 1, y: 0.5)
        self.view.layer.addSublayer(gradientLayer)
        
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.position = CGPoint.zero
        let subLayer = CALayer()
        subLayer.bounds = CGRect(x: 0, y: 0, width: 20, height: 20)
        subLayer.position = CGPoint(x: 150, y: 220)
        subLayer.backgroundColor = UIColor.red.cgColor
        replicatorLayer.addSublayer(subLayer)
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(30, 0, 0)
        replicatorLayer.instanceCount = 10
        self.view.layer.addSublayer(replicatorLayer)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.position = CGPoint.zero
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 250, y: 250))
        path.addLine(to: CGPoint(x: 450, y: 250))
        path.addLine(to: CGPoint(x: 350, y: 350))
        path.addLine(to: CGPoint(x: 250, y: 250))
        shapeLayer.path = path
        shapeLayer.strokeStart = 0
        shapeLayer.strokeEnd = 1
        shapeLayer.fillRule = CAShapeLayerFillRule.evenOdd
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 1
        self.view.layer.addSublayer(shapeLayer)
        
        let basicAni = CABasicAnimation(keyPath: "transform.rotation.z")
        basicAni.fromValue = NSNumber(value: 0)
        basicAni.toValue = NSNumber(value: Double.pi)
        basicAni.duration = 2
        self.view.layer.add(basicAni, forKey: nil)
        
        //关键帧动画
        let keyframeAni = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        keyframeAni.values = [NSNumber(value: 0), NSNumber(value: Double.pi/4), NSNumber(value: 0), NSNumber(value: Double.pi)]
        keyframeAni.duration = 3
        self.view.layer.add(keyframeAni, forKey: "")
        
        //阻尼动画
        let springAni = CASpringAnimation(keyPath: "position.y")
        springAni.mass = 2 //模拟重物质量
        springAni.stiffness = 5 //模拟弹簧劲度系数
        springAni.damping = 2 //设置阻尼系数
        springAni.toValue = 300
        springAni.duration = 3
        let layer = CALayer()
        layer.position = CGPoint(x: 280, y: 400)
        layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        layer.backgroundColor = UIColor.red.cgColor
        self.view.layer.addSublayer(layer)
        layer.add(springAni, forKey: "")
//        let label = UILabel(frame: CGRect(x: 20, y: 200, width: 280, height: 30))
//        self.view.addSubview(label)
    }
    
    func playGIFOnWebView(name:String, webView:UIWebView) {
        let path = Bundle.main.path(forResource: name, ofType: "gif")
        let url = URL.init(fileURLWithPath: path!)
        let imageData = try! Data(contentsOf: url)
        webView.scrollView.bounces = false
        webView.backgroundColor = UIColor.clear
        webView.scalesPageToFit = true
        webView.load(imageData, mimeType: "image/gif", textEncodingName: "", baseURL: URL(string: Bundle.main.bundlePath)!)
    }
    
    func playGIFOnImageView(name:String, imageView:UIImageView) {
        let path = Bundle.main.path(forResource: name, ofType: "gif")
        let url = URL.init(fileURLWithPath: path!)
        let source = CGImageSourceCreateWithURL(url as CFURL, nil)
        let count = CGImageSourceGetCount(source!)
        var imageArray = Array<UIImage>()
        var imagesWidth = Array<Int>()
        var imagesHeight = Array<Int>()
        var time:Int = Int()
        for index in 0..<count {
            let image = CGImageSourceCreateImageAtIndex(source!, index, nil)
            imageArray.append(UIImage(cgImage: image!))
            let info = CGImageSourceCopyPropertiesAtIndex(source!, index, nil) as! Dictionary<String, AnyObject>
            let width = Int(info[kCGImagePropertyPixelWidth as String]! as! NSNumber)
            let height = Int(info[kCGImagePropertyPixelHeight as String]! as! NSNumber)
            imagesWidth.append(width)
            imagesHeight.append(height)
            let timeDic = info[kCGImagePropertyGIFDictionary as String]! as! Dictionary<String, AnyObject>
            time += Int(timeDic[kCGImagePropertyGIFDelayTime as String]! as! NSNumber)
        }
        imageView.frame = CGRect(x: 0, y: 100, width: imagesWidth[0], height: imagesHeight[0])
        imageView.animationImages = imageArray
        imageView.animationDuration = TimeInterval(time)
        imageView.animationRepeatCount = 0
        imageView.startAnimating()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        UIView.animate(withDuration: 1, animations: {
//            self.animationView?.backgroundColor = UIColor.blue
//        }) {(finish) in
//            UIView.animate(withDuration: 2, animations: {
//                self.animationView?.center = CGPoint(x: 150, y: 400)
//            })
//        }
//        UIView.animate(withDuration: 1, delay: 2, options: [UIView.AnimationOptions.repeat], animations: {
//            self.animationView?.backgroundColor = UIColor.blue
//        }, completion: nil)
//        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
//            self.animationView?.center = CGPoint(x: 150, y: 350)
//        }, completion: nil)
//        UIView.transition(with: animationView!, duration: 3, options: .transitionCurlUp, animations: {
//
//        }, completion: nil)
//        let otherView = UIView(frame: CGRect(x: 20, y: 350, width: 280, height: 300))
//        otherView.backgroundColor = UIColor.blue
//        UIView.transition(from: animationView!, to: otherView, duration: 3, options: UIView.AnimationOptions.transitionFlipFromRight, completion: nil)
        
        //转场动画
//        let transAni = CATransition()
//        transAni.type = CATransitionType.push
//        transAni.subtype = CATransitionSubtype.fromTop
//        let layer = CALayer()
//        layer.position = CGPoint(x: 280, y: 400)
//        layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
//        layer.backgroundColor = UIColor.red.cgColor
//        layer.add(transAni, forKey: "")
//        self.view.layer.addSublayer(layer)
        
        //组合动画
//        let basicAni = CABasicAnimation(keyPath: "backgroundColor")
//        basicAni.toValue = UIColor.green.cgColor
//        let basicAni2 = CABasicAnimation(keyPath: "transform.scale.x")
//        basicAni.toValue = NSNumber(value: 2)
//        let groupAni = CAAnimationGroup()
//        groupAni.animations = [basicAni, basicAni2]
//        groupAni.duration = 3
//        let layer = CALayer()
//        layer.position = CGPoint(x: 280, y: 400)
//        layer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
//        layer.backgroundColor = UIColor.red.cgColor
//        layer.add(groupAni, forKey: "")
//        self.view.layer.addSublayer(layer)
    }
    
    @objc func buttonClick(_ sender: AnyObject) {
        let action = UIAlertAction(title: "按钮一", style: UIAlertAction.Style.default) { (action) in
            print("用户点击了按钮一")
        }
//        let viewController = ViewControllerTwo(data: "这是从第一个界面传递进来的数据")
        let viewController = ViewControllerTwo()
        viewController.data = "这是从第一个界面传递进来的数据"
//        viewController.delegate = self
//        viewController.closure = {(data:String) in
//            let label = UILabel(frame: CGRect(x: 20, y: 200, width: 280, height: 30))
//            label.text = data
//        }
//        self.present(viewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
        print("用户点击了按钮")
    }
    
    @objc func buttonAlertClick(_ sender: AnyObject) {
        let alertController = UIAlertController(title: "我是警告框弹窗", message: "这里填写内容", preferredStyle: UIAlertController.Style.alert)
//        let alertAction1 = UIAlertAction(title: "确定", style: UIAlertAction.Style.default, handler: nil)
//        let alertAction2 = UIAlertAction(title: "删除", style: UIAlertAction.Style.destructive, handler: nil)
//        let alertAction3 = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
        let alertAction1 = UIAlertAction(title: "登录", style: UIAlertAction.Style.default) {
            (action) in print(alertController.textFields?.first?.text ?? "未输入文字")
        }
        let alertAction2 = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
//        alertController.addAction(alertAction3)
        alertController.addTextField { (textField) in
            textField.placeholder = "请输入用户名"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "请输入密码"
            textField.isSecureTextEntry = true
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func buttonSheetClick(_ sender: AnyObject) {
        let alertController = UIAlertController(title: "我是抽屉弹窗", message: "这里填写内容", preferredStyle: UIAlertController.Style.actionSheet)
        let alertAction1 = UIAlertAction(title: "确定", style: UIAlertAction.Style.default) {
            (action) in print(alertController.textFields?.first?.text ?? "未输入文字")
        }
        let alertAction2 = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @objc func doneClick(_ sender: AnyObject) {
        print("用户点击了Done按钮")
    }
    
    func sentedData(data: String) {
        let label = UILabel(frame: CGRect(x: 20, y: 200, width: 280, height: 30))
        label.text = data
        self.view.addSubview(label)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    deinit {
        print("deinit")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
