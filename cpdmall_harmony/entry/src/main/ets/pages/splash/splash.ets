import router from '@ohos.router'
import {RouterConstants as CpdRouter} from '../../common/constants/RouterConstants'
@Entry
@Component

struct Splash {

  countdown: number = 2;
  private timer:number = -1;


  aboutToAppear(): void {

    setTimeout(() => {
      this.startTiming();
    }, 3000);
  }

  aboutToDisappear() {
    this.clearTiming();
  }



  build() {

    Row() {
      Column() {
        Image($r("app.media.app_splash"))
          .width(150)
          .height(150)
          .objectFit(ImageFit.Fill)
      }
      .width('100%')
    }
    .height('100%')

  }


  startTiming() {
    this.timer = setInterval(() => {
      this.countdown--;
      if (this.countdown === 0) {
        this.clearTiming();
        this.jumpToMainPage();
      }
    }, 1000);
  }

  clearTiming() {
    if (this.timer !== -1) {
      clearInterval(this.timer);
      this.timer = -1;
    }
  }

  jumpToMainPage() {
    this.clearTiming();
    router.replaceUrl({
      url: CpdRouter.home
    });
  }
}