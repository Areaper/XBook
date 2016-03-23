//
//  Push_TypeViewController.swift
//  XBook
//
//  Created by leon on 16/3/23.
//  Copyright © 2016年 leon. All rights reserved.
//

import UIKit

typealias Push_TypeControllerBlock = (type: String, detailType: String) -> Void

class Push_TypeViewController: UIViewController, IGLDropDownMenuDelegate {
    
    
    var callBack: Push_TypeControllerBlock?
    
    var literatureArray1:Array<NSDictionary> = []
    var literatureArray2:Array<NSDictionary> = []
    
    
    var humanitiesArray1:Array<NSDictionary> = []
    var humanitiesArray2:Array<NSDictionary> = []
    
    
    var livelihoodArray1:Array<NSDictionary> = []
    var livelihoodArray2:Array<NSDictionary> = []
    
    
    var economiesArray1:Array<NSDictionary> = []
    var economiesArray2:Array<NSDictionary> = []
    
    
    var technologyArray1:Array<NSDictionary> = []
    var technologyArray2:Array<NSDictionary> = []
    
    var NetworkArray1:Array<NSDictionary> = []
    var NetworkArray2:Array<NSDictionary> = []
    
    func initDropArray(){
        
        self.literatureArray1 = [
            ["title":"小说"],
            ["title":"漫画"],
            ["title":"青春文学"],
            ["title":"随笔"],
            ["title":"现当代诗"],
            ["title":"戏剧"],
        ];
        self.literatureArray2 = [
            ["title":"传记"],
            ["title":"古诗词"],
            ["title":"外国诗歌"],
            ["title":"艺术"],
            ["title":"摄影"],
        ];
        self.humanitiesArray1 = [
            ["title":"历史"],
            ["title":"文化"],
            ["title":"古籍"],
            ["title":"心理学"],
            ["title":"哲学/宗教"],
            ["title":"政治/军事"],
        ];
        self.humanitiesArray2 = [
            ["title":"社会科学"],
            ["title":"法律"],
        ];
        self.livelihoodArray1 = [
            ["title":"休闲/爱好"],
            ["title":"孕产/胎教"],
            ["title":"烹饪/美食"],
            ["title":"时尚/美妆"],
            ["title":"旅游/地图"],
            ["title":"家庭/家居"],
        ];
        self.livelihoodArray2 = [
            ["title":"亲子/家教"],
            ["title":"两性关系"],
            ["title":"育儿/早教"],
            ["title":"保健/养生"],
            ["title":"体育/运动"],
            ["title":"手工/DIY"],
        ];
        self.economiesArray1  = [
            ["title":"管理"],
            ["title":"投资"],
            ["title":"理财"],
            ["title":"经济"],
        ];
        self.economiesArray2  = [
            ["title":"没有更多了"],
        ];
        self.technologyArray1 =  [
            ["title":"科普读物"],
            ["title":"建筑"],
            ["title":"医学"],
            ["title":"计算机/网络"],
        ];
        self.technologyArray2 = [
            ["title":"农业/林业"],
            ["title":"自然科学"],
            ["title":"工业技术"],
        ];
        self.NetworkArray1 =    [
            ["title":"玄幻/奇幻"],
            ["title":"武侠/仙侠"],
            ["title":"都市/职业"],
            ["title":"历史/军事"],
        ];
        self.NetworkArray2 =    [
            ["title":"游戏/竞技"],
            ["title":"科幻/灵异"],
            ["title":"言情"],
        ];
        
        
        
        
        
    }
    

    
    
    var dropDownMenu1: IGLDropDownMenu?
    var dropDownMenu2: IGLDropDownMenu?
    
    var type = "文学"
    var detailType = "文学"
    
    
    var segmentController1: AKSegmentedControl!
    var segmentController2: AKSegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = RGB(231, g: 231, b: 231)
        
        let segmentLabel = UILabel(frame: CGRectMake((ScreenWidth - 300) / 2, 20, 300, 20))
        segmentLabel.font = UIFont(name: MyFont, size: 17)
        segmentLabel.text = "请选择分类"
        segmentLabel.shadowOffset = CGSizeMake(0, 1)
        segmentLabel.shadowColor = UIColor.whiteColor()
        segmentLabel.textColor = RGB(82, g: 113, b: 131)
        segmentLabel.textAlignment = .Center
        self.view.addSubview(segmentLabel)

        initSegment()
        
        
        initDropArray()
        
        createDropMenu(literatureArray1, array2: literatureArray2)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func sure() {
        
        callBack!(type: type, detailType: detailType)
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func close() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // 初始化 segment
    func initSegment() {
        let buttonArray = [
            ["image": "ledger", "title": "文学", "font": MyFont],
            ["image": "drama masks", "title": "人文社科", "font": MyFont],
            ["image": "aperture", "title": "生活", "font": MyFont],
        ]
        self.segmentController1 = AKSegmentedControl(frame: CGRectMake(10, 60, ScreenWidth - 20, 37))
        segmentController1?.initButtonWithTitleandImage(buttonArray)
        view.addSubview(segmentController1)
        
        let buttonArray1 = [
            ["image": "atom", "title": "经管", "font": MyFont],
            ["image": "alien", "title": "科技", "font": MyFont],
            ["image": "fire element", "title": "网络流行", "font": MyFont],
        ]
        self.segmentController2 = AKSegmentedControl(frame: CGRectMake(10, 110, ScreenWidth - 20, 37))
        segmentController2.initButtonWithTitleandImage(buttonArray1)
        view.addSubview(segmentController2)
        
        segmentController1.addTarget(self, action: "segmentControllerAction:", forControlEvents: .ValueChanged)
        segmentController2.addTarget(self, action: "segmentControllerAction:", forControlEvents: .ValueChanged)
        
        
    }
    
    
    // segment 的点击动作
    func segmentControllerAction(segment: AKSegmentedControl) {
        var index = segment.selectedIndexes.firstIndex
        
        
        self.type = (segment.buttonsArray[index] as? UIButton)!.currentTitle!

        
        print(index)
        if segment == self.segmentController1 {
            segmentController2.setSelectedIndex(3)
        }
        else
        {
            segmentController1.setSelectedIndex(3)
            index += 3
        }
        
        
        if self.dropDownMenu1 != nil {
            self.dropDownMenu1?.resetParams()
        }
        if self.dropDownMenu2 != nil {
            self.dropDownMenu2?.resetParams()
        }
        
        switch (index) {
        case 0:
            createDropMenu(literatureArray1, array2: literatureArray2)
            break
        case 1:
            createDropMenu(humanitiesArray1, array2: humanitiesArray2)

            break
        case 2:
            createDropMenu(livelihoodArray1, array2: livelihoodArray2)

            break
        case 3:
            createDropMenu(economiesArray1, array2: economiesArray2)

            break
        case 4:
            createDropMenu(technologyArray1, array2: technologyArray2)

            break
        case 5:
            createDropMenu(NetworkArray1, array2: NetworkArray2)

            break
        default:
            break
        }
        
        
    }
    
    // 初始化 dropDownMenu
    func createDropMenu(array1: Array<NSDictionary>, array2: Array<NSDictionary>) {
        let dropDownItem1 = NSMutableArray()
        for var i = 0; i < array1.count; i++ {
            let dict = array1[i]
            let item = IGLDropDownItem()
            item.text = dict["title"] as! String
            dropDownItem1.addObject(item)
        }
        let dropDownItem2 = NSMutableArray()

        for var i = 0; i < array2.count; i++ {
            let dict = array2[i]
            let item = IGLDropDownItem()
            item.text = dict["title"] as! String
            dropDownItem2.addObject(item)
        }
        
        
        dropDownMenu1?.removeFromSuperview()
        self.dropDownMenu1 = IGLDropDownMenu()
        dropDownMenu1?.menuText = "点我, 展开详细列表"
        dropDownMenu1?.menuButton.textLabel.adjustsFontSizeToFitWidth = true
        dropDownMenu1?.menuButton.textLabel.textColor = RGB(38, g: 82, b: 67)
        dropDownMenu1?.paddingLeft = 15
        dropDownMenu1?.delegate = self
        dropDownMenu1?.type = .Stack
        dropDownMenu1?.itemAnimationDelay = 0.1
        dropDownMenu1?.gutterY = 5
        dropDownMenu1?.dropDownItems = dropDownItem1 as [AnyObject]
        dropDownMenu1?.frame = CGRectMake(20, 150, ScreenWidth / 2, (ScreenHeight - 200) / 7)
        view.addSubview(dropDownMenu1!)
        
        dropDownMenu1?.reloadView()
        
        dropDownMenu2?.removeFromSuperview()
        self.dropDownMenu2 = IGLDropDownMenu()
        dropDownMenu2?.menuText = "点我, 展开详细列表"
        dropDownMenu2?.menuButton.textLabel.adjustsFontSizeToFitWidth = true
        dropDownMenu2?.menuButton.textLabel.textColor = RGB(38, g: 82, b: 67)
        dropDownMenu2?.paddingLeft = 15
        dropDownMenu2?.delegate = self
        dropDownMenu2?.type = .Stack
        dropDownMenu2?.itemAnimationDelay = 0.1
        dropDownMenu2?.gutterY = 5
        dropDownMenu2?.dropDownItems = dropDownItem1 as [AnyObject]
        dropDownMenu2?.frame = CGRectMake(ScreenWidth / 2 + 10, 150, ScreenWidth / 2, (ScreenHeight - 200) / 7)
        view.addSubview(dropDownMenu2!)
        
        dropDownMenu1?.reloadView()
        
        dropDownMenu2?.reloadView()
        
        
        
    }
    
    func dropDownMenu(dropDownMenu: IGLDropDownMenu!, selectedItemAtIndex index: Int) {
        if dropDownMenu == self.dropDownMenu1 {
            let item = self.dropDownMenu1?.dropDownItems[index] as? IGLDropDownItem
            detailType = (item?.text)!
            dropDownMenu2?.menuButton.text = detailType
            
        }
        else
        {
            let item = self.dropDownMenu2?.dropDownItems[index] as? IGLDropDownItem
            detailType = (item?.text)!
            dropDownMenu1?.menuButton.text = detailType
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
