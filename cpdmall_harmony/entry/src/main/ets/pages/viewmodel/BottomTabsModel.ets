export const BottomTabsList: Array<BottomTabsItem> = [
  {
    icon: $r('app.media.ic_tab_home'),
    iconSelected: $r('app.media.ic_tab_home_active'),
    text: $r('app.string.bottom_text_home')
  },
  {
    icon: $r('app.media.ic_tab_category'),
    iconSelected: $r('app.media.ic_tab_category_active'),
    text: $r('app.string.bottom_text_category')
  },
  {
    icon: $r('app.media.ic_tab_explore'),
    iconSelected: $r('app.media.ic_tab_explore_active'),
    text: $r('app.string.bottom_text_explore')
  },
  {
    icon: $r('app.media.ic_tab_cart'),
    iconSelected: $r('app.media.ic_tab_cart_active'),
    text: $r('app.string.bottom_text_cart')
  },
  {
    icon: $r('app.media.ic_tab_mine'),
    iconSelected: $r('app.media.ic_tab_mine_active'),
    text: $r('app.string.bottom_text_mine')
  }
]

export interface BottomTabsItem {
  icon: Resource;
  iconSelected: Resource;
  text: Resource;
}