import { componentSnapshot, PromptAction, promptAction } from "@kit.ArkUI"
import { image } from "@kit.ImageKit"
import { fileIo } from "@kit.CoreFileKit"
import { BusinessError } from "@kit.BasicServicesKit"
import { resourceManager } from "@kit.LocalizationKit"
import { photoAccessHelper } from '@kit.MediaLibraryKit';

@Component
export struct ResumeContent {
  build() {
    Scroll() {
      Column() {
        // 基本信息
        Column() {
          Image($r('app.media.head'))
            .margin({ top: 12, bottom: 0})
            .alignSelf(ItemAlign.Center)
            .width(160)
            .clip(new Circle({ width: 160, height: 200 }))
            // .height(64)
          Text('基本信息')
            .fontSize(20)
            .fontColor('#320A6F')
            .fontWeight(FontWeight.Bold)
            .margin({ top: 12, bottom: 12 })
          Column() {
            Text('金晨烨')
              .fontSize(24)
              .fontWeight(FontWeight.Bold)
            Text('燕山大学 · 软件工程')
              .fontSize(16)
              .margin({ top: 8 })
            Text('2022 - 2026(预计)')
              .fontSize(14)
              .fontColor('#666666')
              .margin({ top: 4 })
          }
          .margin({ bottom: 12 })
        }
        .justifyContent(FlexAlign.Start)

        // 联系方式
        Column() {
          Text('联系方式')
            .fontSize(20)
            .fontColor('#320A6F')
            .fontWeight(FontWeight.Bold)
            .margin({ top: 24, bottom: 12 })
          Column() {
            this.ContactItem("电话", "18857009339")
            this.ContactItem("邮箱", "chenyejin2004@stumail.ysu.edu.cn")
            this.ContactItem("GitHub", "255doesnotexist")
          }
          .margin({ bottom: 12 })
        }
        .justifyContent(FlexAlign.Start)

        // 教育背景
        Column() {
          Text('教育背景')
            .fontSize(20)
            .fontColor('#320A6F')
            .fontWeight(FontWeight.Bold)
            .margin({ top: 24, bottom: 12 })
          Column() {
            Row() {
              Text('燕山大学')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
              Text('软件工程专业 (2022-2026)')
                .fontSize(14)
                .fontColor("#666666")
                .margin( {left: 8} )
            }
            Text('· C++、C#、数据结构等程序设计\n    强相关专业课成绩 >= A\n· 自主完成 RISC-V rCore Lab\n· 任本校编程类社团负责人\n· 英语四六级通过，雅思 6.5')
              .fontSize(14)
              .margin({ top: 8 })
          }
          .margin({ bottom: 12 })
        }
        .justifyContent(FlexAlign.Center)

        // 工作经验
        Column() {
          Text('工作经验')
            .fontSize(20)
            .fontColor('#320A6F')
            .fontWeight(FontWeight.Bold)
            .margin({ top: 24, bottom: 12 })
          Column() {
            this.ExperienceItem(
              "中科院软件所 PLCT Lab",
              "2024.6 - 至今",
              "软件测试",
              "自大二暑假起参与 PLCT Lab 实习，承担开源软件开发、测试工作。期间产出数个测试报告、两个自动化测试框架。"
            )
            this.ExperienceItem(
              "燕山大学 AIoT 课题组",
              "2023.6 - 2023.10",
              "实习成员",
              "大一暑假时协助学长工作，对 VIPS 论文的图匹配部分进行重写复现，在组内 GraphPS 论文中用作参照数据进行比较。"
            )
          }
          .margin({ bottom: 12 })
        }
        .justifyContent(FlexAlign.Start)

        // 获奖情况
        Column() {
          Text('获奖情况')
            .fontSize(20)
            .fontColor('#320A6F')
            .fontWeight(FontWeight.Bold)
            .margin({ top: 24, bottom: 12 })
          Column() {
            Text('· 蓝桥杯 Python A 组 国二省一 (大二)\n· 睿抗机器人 CAIP 国一\n· 蓝桥杯 C++ A 组省一国优 (大一)\n· HBCPC 省赛金牌\n· ASC2024 预赛二等奖\n· GPLT 天梯赛 2024 团体二等奖个人二等奖')
              .fontSize(14)
              .margin({ top: 8 })
          }
          .margin({ bottom: 12 })
        }
        .justifyContent(FlexAlign.Start)

        // 技能特长
        Column() {
          Text('技能特长')
            .fontSize(20)
            .fontColor('#320A6F')
            .fontWeight(FontWeight.Bold)
            .margin({ top: 24, bottom: 12 })
          Column() {
            Text('· 熟练掌握 C/C#/C++/Rust/Python/TypeScript/ArkTS\n· 熟悉 GNU 系编译工具链\n· 具备算法竞赛经历\n· 熟练使用 Linux 系统进行集群运维\n· 具有良好的代码风格和团队协作能力')
              .fontSize(14)
              .margin({ top: 8 })
          }
          .margin({ bottom: 12 })
        }
        .justifyContent(FlexAlign.Start)

        Row() {
          Button('给我发邮件')
            .margin({ top: 20, bottom: 40 })
            .backgroundColor('#320A6F')
            .fontSize(16)
            .onClick(() => {
              let uiContext = this.getUIContext();
              let promptAction: PromptAction = uiContext.getPromptAction();
              try {
                promptAction.showActionMenu({
                  title: '以下邮件均可：',
                  buttons: [
                    {
                      text: 'chenyejin2004@stumail.ysu.edu.cn',
                      color: '#000000'
                    },
                    {
                      text: '1293883574jcy@gmail.com',
                      color: '#666666'
                    },
                  ]
                })
                  .then(data => {
                    console.info('showActionMenu success, click button: ' + data.index);
                  })
                  .catch((err: Error) => {
                    console.error('showActionMenu error: ' + err);
                  })
              } catch (error) {
              }
            })
        }.width('100%')
        .justifyContent(FlexAlign.Center)
      }
      .padding(16)
    }
  }

  @Builder ContactItem(label: string, value: string) {
    Row() {
      Text(label + ": ")
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
      Text(value)
        .fontSize(14)
    }
    .margin({ top: 4 })
  }

  @Builder ExperienceItem(company: string, time: string, position: string, description: string) {
    Column() {
      Row() {
        Text(company)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
        Text(time)
          .fontSize(14)
          .fontColor('#666666')
          .margin({ left: 8 })
        Text(position)
          .fontSize(14)
          .margin({ left: 8 })
      }
      .justifyContent(FlexAlign.Start)
      Text(description)
        .fontSize(14)
        .fontColor('#666666')
        .margin({ top: 4 })
    }
    .margin({ top: 12 })
    .alignItems(HorizontalAlign.Start)
    .justifyContent(FlexAlign.Start)
  }
}
