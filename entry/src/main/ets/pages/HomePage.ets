@Component
export struct HomePage {
  build() {
    Column() {
      Text('我的个人简历')
        .fontSize(32)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 50, bottom: 20 })

      Text('Version 1.0.0')
        .fontSize(16)
        .fontColor('#666666')

      Text('最后更新：2024年12月')
        .fontSize(14)
        .fontColor('#999999')
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
    .justifyContent(FlexAlign.Center)
  }
}