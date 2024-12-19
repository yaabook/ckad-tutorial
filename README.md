# CKAD 模拟环境+答案

## 使用方法

### 初始化CKAD模拟环境

在K8S的控制节点上，clone本项目,建议使用k3d工具来创建集群。
```
git clone https://github.com/yaabook/ckad-tutorial.git
cd ckad-tutorial/init
./init.sh
kubectl apply -f init.yaml
```

### 下载ez-cli使用cli教程
```
sudo curl https://get-ez.32cloud.cn/ez --output /usr/bin/ez
sudo chmod +x /usr/bin/ez
```

### 登陆并使用ez-cli工具
```
# 在my.32cloud.cn上注册
ez user login -u yourname

# 查找K8S相关题库
ez exam find -i 4

# 用ID注册一个题库
ez exam register -i 20

# 下载题库
ez exam pull -i 20

# 查看题库信息
ez exam info

更多内容使用ez exam -h进行查看

```
