import { webview } from '@kit.ArkWeb';

@Component
export struct StatsPage {
  @State loaded: boolean = false
  stat1controller: webview.WebviewController = new webview.WebviewController();

  build() {
    Column() {
      Text('技能统计')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })

      // 这里可以添加图表组件来展示编程语言使用情况等统计
      Text('正在获取 GitHub 统计数据...')
        .fontSize(this.loaded ? 0 : 16)
        .fontColor('#666666')
      Web(
        {
          src: $rawfile('index.html'),
          controller: this.stat1controller
        })
        .onTitleReceive(msg => {
          this.loaded = true;
        })

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
    .padding(16)
  }
}