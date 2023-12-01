
import { BottomTabsList } from '../viewmodel/BottomTabsModel';
import { Home } from '../home/tabs/HomeTabPage';
import { Category } from '../home/tabs/CategoryTabPage';
import { Explore } from '../home/tabs/ExploreTabPage';
import { Mine } from '../home/tabs/MineTabPage';
import { Cart } from '../home/tabs/CartTabPage';
@Entry
@Component
struct IndexPage {
  @State @Watch('onIndexChange') bottomTabIndex: number = 0;
  private controller: TabsController = new TabsController();

  @Builder TabBuilder(index: number, _name: string) {
    Column() {
      Image(this.bottomTabIndex === index
        ? BottomTabsList[index].iconSelected
        : BottomTabsList[index].icon)
        .width(this.bottomTabIndex===0 && index === 0 ?'70%':'50%')
        .height(this.bottomTabIndex===0 && index === 0 ?'70%':'50%')
        .objectFit(ImageFit.Contain)

        if(index == 0 ){
          if (this.bottomTabIndex != 0) {
            Text(BottomTabsList[index].text)
              .fontSize(14)
              .opacity(0.6)
              .fontColor(this.bottomTabIndex === index ?
              Color.Red : Color.Black)
          }
        }else {
          Text(BottomTabsList[index].text)
            .fontSize(14)
            .opacity(0.6)
            .fontColor(this.bottomTabIndex === index ?
            Color.Red : Color.Black)
        }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor("#F1F3F5")
  }


  onIndexChange() {
    this.controller.changeIndex(this.bottomTabIndex);
  }

  pageTransition() {
    PageTransitionEnter({ duration: 800 })
      .slide(SlideEffect.Top)
    PageTransitionExit({ delay: 100 })
      .opacity(0)
  }

  build() {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.End,
      justifyContent: FlexAlign.End }) {
      Tabs({
        barPosition: BarPosition.End, index: 0,
        controller: this.controller }) {

        TabContent() {
          Home()
        }.tabBar(this.TabBuilder(0, 'Home'))

        TabContent() {
          Category()
        }.tabBar(this.TabBuilder(1, 'Category'))

        TabContent() {
          Cart()
        }.tabBar(this.TabBuilder(2, 'Cart'))

        TabContent() {
          Explore()
        }.tabBar(this.TabBuilder(3, 'Explore'))

        TabContent() {
          Mine()
        }.tabBar(this.TabBuilder(4, 'Mine'))
      }
      .width('100%')
      .height('100%')
      .vertical(false)
      .scrollable(false)
      // .barHeight('10%')
      .onChange((index: number) => {
        this.bottomTabIndex = index;
      })
    }
    .width('100%')
  }


}