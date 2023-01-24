import { Controller } from "@hotwired/stimulus"
import { Datepicker } from 'vanillajs-datepicker';

export default class extends Controller {
  static targets = ['datepick']

  connect() {
   const date_picker = new Datepicker(this.datepickTarget)

   date_picker.setOptions({
    // maxDate: "11/7/2022",
    clearButton: true,
    todayBtn: true,
    todayBtnMode: 1,
    weekStart: 6
   })
 }
}