import Vue from 'vue'
import App from './App.vue'
import router from 'router'
import store from 'store'
import {
  Row,
  Col,
  Dropdown,
  DropdownMenu,
  DropdownItem,
  Input,
  Button,
  Breadcrumb,
  BreadcrumbItem,
  Pagination,
  Carousel,
  CarouselItem,
  Card,
  Table,
  TableColumn,
  Radio,
  RadioGroup,
  Dialog,
  FormItem,
  Form,
  Cascader,
  Menu,
  MenuItem,
  Submenu,
  Select,
  Option,
  DatePicker,
} from "element-ui"

Vue.use(Row)
Vue.use(Col)
Vue.use(Dropdown)
Vue.use(DropdownMenu)
Vue.use(DropdownItem)
Vue.use(Input)
Vue.use(Button)
Vue.use(Breadcrumb)
Vue.use(BreadcrumbItem)
Vue.use(Pagination)
Vue.use(Carousel)
Vue.use(CarouselItem)
Vue.use(Card)
Vue.use(Table)
Vue.use(TableColumn)
Vue.use(Radio)
Vue.use(RadioGroup)
Vue.use(Dialog)
Vue.use(FormItem)
Vue.use(Form)
Vue.use(Cascader)
Vue.use(Menu)
Vue.use(MenuItem)
Vue.use(Submenu)
Vue.use(Select)
Vue.use(Option)
Vue.use(DatePicker)

Vue.config.productionTip = false

new Vue({
  render: h => h(App),
  router,
  store,
}).$mount('#app')
