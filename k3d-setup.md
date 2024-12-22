# ez playground创建k8s-k3d练习集群

## 使用方法
在一台可上网的Linux机器上执行下面的命令,可是本地虚拟机，云主机。

### 下载ez-cli
```
sudo curl https://get-ez.32cloud.cn/latest/ez --output /usr/bin/ez
sudo chmod +x /usr/bin/ez

ez user login -u yourname
```

### 先登陆帐号
```
$ ez user login -u yourname
Login successed.

$ ez user info
Name:                   yourname        
Email:                  xxxx@yyy.com
Max Play intances:      2            # 最多可创建的实例数
Available Minues:       6000         # 剩余使用时长
```

### 创建playground练习机
```
# 使用ubuntu的镜像id 2002，创建一台叫 ckad-test的playground练习机
$ ez pg create -n ckad-test --image 2002
Success, Playground instance has been created

$ ez pg ls
== List of Playground ==
id      Name            Note            Type    Image                   IP              State  
146     gz1-vm60        ckad-test       S2C4G   Ubuntu20.4              10.32.1.xx      running

# 使用playgound id进行ssh连接
$ ez pg ssh -i 146
Welcome to Ubuntu 20.04.6 LTS (GNU/Linux 5.4.0-1104-kvm x86_64)

# 如果是使用非32cloud.cn的主机，刚需要先创建ingress后，再用ssh连接到playground主机
$ ez ing create --ip 10.32.1.xx -port 22

# 增加--ingress参数进行连接即可
$ ez ing ssh 146 --ingress

Last login: Sun Dec 10 02:32:39 2023 from 192.168.1.17
ubuntu@gz1-vm60:~$ 
```

### 下载ubuntu安装k3d教程v1.0
连接上playgroud后，需要在这台机器再安装一下ez-cli

```
$ ez exam find -i 4
== List of Exams ==
ID      Author  Tutorial ID     Tutorial        Exam Name            
20      alvin   4               CKAD练习题      CKAD练习题v1.1       
21      alvin   4               CKAD练习题      ubuntu安装k3d教程v1.0

# 增加Exam到自己的题库, 安装教程的id为21
$ ez exam re -i 21
Success, Exam has been registered, use `ez exam ls` to view

$ ez exam ls
== List of my exams ==
id      Name                    Author  State   Score
21      ubuntu安装k3d教程v1.0   alvin   0       0

$ ez exam pull -i 21
The exam yaml file have been pulled successfully, use `ez exam info` to view

$ ez exam info --all
== Exam ==
ID:     21                   
Name:   ubuntu安装k3d教程v1.0
Desc:   ubuntu安装k3d教程v1.0
Pages:  1                    
== Page ==
-> ubuntu安装k3d
# Step  State   Name               
1-1     Todo    第一步, 安装Docker 
1-2     Todo    第二步, 安装k3d    
1-3     Todo    第三步, 安装kubectl
1-4     Todo    第四步, 创建k8s集群
1-5     Todo    第五步, 导入镜像   
```

### 根据教程步骤安装练习环境

```
# 使用exam info 查看每个步骤的命令
$ ez exam info 1-1
Page:        
ubuntu安装k3d
安装教程     
Steps:       
1-1: Todo                         
第一步, 安装Docker                
安装Docker                        
hint:                             
sudo apt install docker.io        
                                  
配置镜像加速：                    
cat <<EOF > /etc/docker/daemon.json
{
  "registry-mirrors": [
    "https://docker.m.daocloud.io"
  ]
}
EOF
systemctl restart docker


# 根据 hint的内容进行操作
# 所有步骤有
ez exam info 1-2
ez exam info 1-3
ez exam info 1-4

# 最后确认k8s的系统pod全部正常运行
$ kubectl get po -A
kubectl get po -A
NAMESPACE     NAME                                      READY   STATUS              RESTARTS   AGE
kube-system   coredns-7b98449c4-grs6g                   1/1     Running             0          8m21s
kube-system   helm-install-traefik-cl6qr                0/1     Completed           5          8m22s
kube-system   helm-install-traefik-crd-8m4v2            0/1     Completed           0          8m22s
kube-system   local-path-provisioner-595dcfc56f-2k45k   1/1     Running             0          8m21s
kube-system   metrics-server-cdcc87586-6nbff            1/1     Running             0          8m21s
kube-system   svclb-traefik-bc8f3b48-htrrn              2/2     Running             0          96s
kube-system   svclb-traefik-bc8f3b48-k52p7              2/2     Running             0          96s
kube-system   svclb-traefik-bc8f3b48-xhgm5              2/2     Running             0          96s
kube-system   traefik-d7c9c5778-bshkl                   1/1     Running             0          97s

```

恭喜你，现在可以开始练习CKAD考试题目了
[答题教程](README.md)