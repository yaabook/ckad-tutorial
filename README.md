# CKAD 模拟环境+答案

## 使用方法

### 练习K8S环境准备

根据自己的情况选择一种练环境
- 使用killer kubernetes playground（需要科学上网）
- 使用云主机，结合k3d安装教程进行安装[教程](k3d-setup.md)
- 使用本地虚拟机，结合k3d安装教程进行安装[教程](k3d-setup.md)
- 使用ez-cli创建免费的playground云实例并安装K8S练习环境[教程](k3d-setup.md)

### 下载ez-cli使用ckad教程进行练习

在能正用kubectl进行集群操作的主机上下载ez-cli工具

```
sudo curl https://get-ez.32cloud.cn/latest/ez --output /usr/bin/ez
sudo chmod +x /usr/bin/ez

# 在my.32cloud.cn上注册
# 登陆帐号
ez user login -u yourname

# 查找K8S相关题库
ez exam find -i 4

# 用ID注册一个题库
ez exam register -i 18

# 下载题库
ez exam pull -i 18
```
使用ez-cli直接创建playground主机的教程，请先使用ubuntu安装k3d教程，创建一个kubernetes练习集群。

### 初始化CKAD模拟环境

在K8S的控制节点上，clone本项目,建议使用k3d工具来创建集群。
```
# 先确认保你有一个干净和健康的K8s环境
$ kubectl get po -A
NAMESPACE     NAME                                      READY   STATUS      RESTARTS   AGE
kube-system   coredns-7b98449c4-grs6g                   1/1     Running     0          11m
kube-system   local-path-provisioner-595dcfc56f-2k45k   1/1     Running     0          11m
kube-system   metrics-server-cdcc87586-6nbff            1/1     Running     0          11m
kube-system   svclb-traefik-bc8f3b48-htrrn              2/2     Running     0          4m49s
kube-system   svclb-traefik-bc8f3b48-k52p7              2/2     Running     0          4m49s
kube-system   svclb-traefik-bc8f3b48-xhgm5              2/2     Running     0          4m49s
kube-system   traefik-d7c9c5778-bshkl                   1/1     Running     0          4m50s

$ git clone https://github.com/yaabook/ckad-tutorial.git
$ cd ckad-tutorial/init
$ ./init.sh
$ kubectl apply -f init.yaml
```

### 下载ez-cli使用cli教程
```
sudo curl https://get-ez.32cloud.cn/latest/ez --output /usr/bin/ez
sudo chmod +x /usr/bin/ez
```

### 用ez exam练习题目
```
# 题目参考答案用到的资源清单
$ cd /root/ckad-tutorial/
$ ll
01-cronjob.yaml
02-cronjob.yaml
04-quta.yaml
07-canary-chipmunk-deployment.yaml
09-env-var.yaml
11-configmap.yaml
12-secret.yaml
14-readyness.yaml
15-upgrade-strategy.yaml
17-expose-service.yaml
19-ingress1.yaml
20-ingress.yaml
21-configmap.yaml
23-pv-pvc.yaml
24-sidecar.yaml

# 查看题库信息，如果看到的信息不对，请重新用 ez exam pull -i id 下载题目
$ ez exam info
== Exam ==
ID:     18
Name:   CKAD练习题v1.0
Desc:   本题库共有24道练习题，操作说明：
        使用 ez exam info --all 查看所有题目
        使用 ez exam info 1     查看第一题
        使用 ez exam check 1-1  操作完成后，验证是否符合题要求
        使用 ez exam commit     提交成绩

        查找更多k8s相关教程：
        ez exam find -i 4
        注册新题库:
        ez exam register -i id

# 查看题库所有题目
ez exam info --all

```

### 练习方法，第一题为例
```
$ ez exam info 1
Page:
第一题, 创建Cron Job
创建一个名为 ppi 并执行一个运行以下单一容器的 Pod 的 CronJob
Steps:
1-1: Todo
Task 1, 创建一个名为 ppi 并执行一个运行以下单一容器的 Pod 的 CronJob
1、创建一个名为 ppi 并执行一个运行以下单一容器的 Pod 的 CronJob
- name: pi
  image: perl: 5
  command: ["perl", " Mbignum=bpi", " wle", "print bpi(2000)"]
配置 CronJob 为：
* 每隔 5 分钟执行一次
* 保留 2 个已完成的 Job
* 保留 4 个失败的 Job
* 永不重启 Pod
* 在 8 秒后终止 Pod
hint:
docs/tasks/job/automated-tasks-with-cron-jobs/

1-2: Todo
Task 2,从 CronJob ppi 中 手动创建并执行一个名为 ppi test 的 Job
为测试目的，从 CronJob ppi 中 手动创建并执行一个名为 ppi test 的 Job
hint:
kubectl create job ppi-test --from=cronjob/ppi

# 答题1-1
$ kubectl apply -f 01-cronjob.yaml
cronjob.batch/ppi created

# 系统检查1-1
$ ez exam check 1-1
1-1 is Passed, please use `ez exam info` to see more details

# 答题1-2
$ kubectl create job ppi-test --from=cronjob/ppi
job.batch/ppi-test created

# 系统检查1-2
ez exam check 1-2
1-2 is Passed, please use `ez exam info` to see more details

# 查看一题答题的情况
$ ez exam info 1
Page:
第一题, 创建Cron Job
创建一个名为 ppi 并执行一个运行以下单一容器的 Pod 的 CronJob
Steps:
1-1: Passed
...
1-2: Passed
...
```