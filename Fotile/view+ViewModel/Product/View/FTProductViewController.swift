
//
//  FTProductViewController.swift
//  Fotile
//
//  Created by 郭金涛 on 2017/4/25.
//  Copyright © 2017年 Gjt. All rights reserved.
//

import UIKit
import CHProgressHUD
class FTProductViewController: UIViewController {

    @IBOutlet var headView: UIView!
    @IBOutlet var headViewImage: UIImageView!
    @IBOutlet var search: UITextField!
    @IBOutlet var line: UIView!
    let viewModel:FTProductViewModel = FTProductViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        //测试数据
        viewModel.getData()
        self.edgesForExtendedLayout = .bottom
        //view.addSubview(sliderView)
        view.addSubview(sliderView1)
        view.addSubview(tableView)
      //  tableView.tableHeaderView = tableHead
        layout()
        // Do any additional setup after loading the view.
    }

    func layout() {
        headView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(0)
            make.height.equalTo(70)
        }
        headViewImage.snp.makeConstraints { (make) in
            make.left.equalTo(25)
            make.top.equalTo(40)
            make.width.height.equalTo(22)
        }
        search.snp.makeConstraints { (make) in
            make.left.equalTo(headViewImage.snp.right).offset(10)
            make.top.equalTo(35)
            make.right.equalTo(-25)
            make.height.equalTo(30)
        }
        line.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(0)
            make.height.equalTo(1)
        }
        tableView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(70)
            make.right.equalTo(-44)
            make.bottom.equalTo(-50)
        }


        sliderView1.snp.makeConstraints { (make) in
            make.right.equalTo(0)
            make.top.equalTo(70)
            make.width.equalTo(44)
            make.bottom.equalTo(0)
        }
    }
    lazy var sliderView1:FTOptionsView = {
        let view:FTOptionsView = FTOptionsView(frame: CGRect.zero)
        view.deleage = self
        return view
    }()
    lazy var tableView:FTProductTableView = {
        let table:FTProductTableView = FTProductTableView(frame: .zero, style: .plain)
        table.dele = self
        table.isProduct = true
        table.setViewModel(viewModel: self.viewModel)
        return table
    }()
    lazy var tableHead:UIView = {
        let view:UIView = UIView(frame: CGRect.init(x: 0, y: 50, width: 0, height: 20))
        return view
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        (UIApplication.shared.delegate as! AppDelegate).ftView?.isHidden = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension FTProductViewController:FTOptionsViewDeleage, FTProductTableViewDeleage{
    func clickBtnActionOption(index: Int) {
        if viewModel.products.count > index {
            let indexpath = IndexPath(row: 0, section: index)
            self.tableView.scrollToRow(at: indexpath, at: .top, animated: true)
        }
    }

    func moreAction(viewModel:FTProductCellViewModel) {
        let vc = FTProductDetailViewController.news()
        vc.viewModel.headViewModel = viewModel
        navigationController?.pushViewController(vc, animated: true)
    }
    func getSection(section: Int) {
        self.sliderView1.setDidIndex(index: section)
    }
}
