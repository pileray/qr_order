import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['item', 'submit']

  connect() {
    console.log("connected")
  }

  toggleDisabled({ detail: { content } }) {
    const valid = this.itemTargets.some((item) => {
      return item.dataset.orderCountNumValue > 0
    })

    this.submitTarget.disabled = !valid
  }
}