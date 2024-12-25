import { HomePage } from '../pages/HomePage'
import { ResumeContent } from '../pages/ResumeContent'
import { StatsPage } from '../pages/Stats'

@Entry
@Component
struct Index {
  @State currentIndex: number = 0;

  build() {
    Tabs({
      barPosition: BarPosition.End,
      index: this.currentIndex
    }) {
      TabContent() {
        HomePage()
      }.tabBar(this.TabBuilder("首页", 0, $r('app.media.home')))

      TabContent() {
        ResumeContent()
      }.tabBar(this.TabBuilder("简历", 1, $r('app.media.resume')))

      TabContent() {
        StatsPage()
      }.tabBar(this.TabBuilder("统计", 2, $r('app.media.stats')))
    }
    .backgroundColor('#F1F3F5')
    .width('100%')
    .height('100%')
    .onChange((index: number) => {
      this.currentIndex = index
    })
  }

  @Builder TabBuilder(title: string, index: number, icon_path: Resource) {
    Column() {
      Row() {
        Image(icon_path)
          .width(24)
          .height(24)
          .fillColor(this.currentIndex === index ? '#320A6F' : '#666666')
          .margin({top: 8})
      }
      Row() {
        Text(title)
          .fontColor(this.currentIndex === index ? '#320A6F' : '#666666')
          .fontSize(14)
          .padding(8)
      }
    }
  }
}